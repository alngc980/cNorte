<?php
/****************************************************************************
* Software: FPDF_Protection                                                 *
* Version:  1.05                                                            *
* Date:     2018-03-19                                                      *
* Author:   Klemen VODOPIVEC                                                *
* License:  FPDF                                                            *
*                                                                           *
* Thanks:  Cpdf (http://www.ros.co.nz/pdf) was my working sample of how to  *
*          implement protection in pdf.                                     *
****************************************************************************/

// require('fpdf.php');

if(function_exists('openssl_encrypt'))
{
	function RC4($key, $data)
	{
		return openssl_encrypt($data, 'RC4-40', $key, OPENSSL_RAW_DATA);
	}
}
elseif(function_exists('mcrypt_encrypt'))
{
	function RC4($key, $data)
	{
		return @mcrypt_encrypt(MCRYPT_ARCFOUR, $key, $data, MCRYPT_MODE_STREAM, '');
	}
}
else
{
	function RC4($key, $data)
	{
		static $last_key, $last_state;

		if($key != $last_key)
		{
			$k = str_repeat($key, 256/strlen($key)+1);
			$state = range(0, 255);
			$j = 0;
			for ($i=0; $i<256; $i++){
				$t = $state[$i];
				$j = ($j + $t + ord($k[$i])) % 256;
				$state[$i] = $state[$j];
				$state[$j] = $t;
			}
			$last_key = $key;
			$last_state = $state;
		}
		else
			$state = $last_state;

		$len = strlen($data);
		$a = 0;
		$b = 0;
		$out = '';
		for ($i=0; $i<$len; $i++){
			$a = ($a+1) % 256;
			$t = $state[$a];
			$b = ($b+$t) % 256;
			$state[$a] = $state[$b];
			$state[$b] = $t;
			$k = $state[($state[$a]+$state[$b]) % 256];
			$out .= chr(ord($data[$i]) ^ $k);
		}
		return $out;
	}
}

class FPDF_Protection extends FPDF
{
	protected $encrypted = false;  //whether document is protected
	protected $Uvalue;             //U entry in pdf document
	protected $Ovalue;             //O entry in pdf document
	protected $Pvalue;             //P entry in pdf document
	protected $enc_obj_id;         //encryption object id

	/**
	* Function to set permissions as well as user and owner passwords
	*
	* - permissions is an array with values taken from the following list:
	*   copy, print, modify, annot-forms
	*   If a value is present it means that the permission is granted
	* - If a user password is set, user will be prompted before document is opened
	* - If an owner password is set, document can be opened in privilege mode with no
	*   restriction if that password is entered
	*/
	function SetProtection($permissions=array(), $user_pass='', $owner_pass=null)
	{
		$options = array('print' => 4, 'modify' => 8, 'copy' => 16, 'annot-forms' => 32 );
		$protection = 192;
		foreach($permissions as $permission)
		{
			if (!isset($options[$permission]))
				$this->Error('Incorrect permission: '.$permission);
			$protection += $options[$permission];
		}
		if ($owner_pass === null)
			$owner_pass = uniqid(rand());
		$this->encrypted = true;
		$this->padding = "\x28\xBF\x4E\x5E\x4E\x75\x8A\x41\x64\x00\x4E\x56\xFF\xFA\x01\x08".
						"\x2E\x2E\x00\xB6\xD0\x68\x3E\x80\x2F\x0C\xA9\xFE\x64\x53\x69\x7A";
		$this->_generateencryptionkey($user_pass, $owner_pass, $protection);
	}

/****************************************************************************
*                                                                           *
*                              Private methods                              *
*                                                                           *
****************************************************************************/

	function _putstream($s)
	{
		if ($this->encrypted)
			$s = RC4($this->_objectkey($this->n), $s);
		parent::_putstream($s);
	}

	function _textstring($s)
	{
		if (!$this->_isascii($s))
			$s = $this->_UTF8toUTF16($s);
		if ($this->encrypted)
			$s = RC4($this->_objectkey($this->n), $s);
		return '('.$this->_escape($s).')';
	}

	/**
	* Compute key depending on object number where the encrypted data is stored
	*/
	function _objectkey($n)
	{
		return substr($this->_md5_16($this->encryption_key.pack('VXxx',$n)),0,10);
	}

	function _putresources()
	{
		parent::_putresources();
		if ($this->encrypted) {
			$this->_newobj();
			$this->enc_obj_id = $this->n;
			$this->_put('<<');
			$this->_putencryption();
			$this->_put('>>');
			$this->_put('endobj');
		}
	}

	function _putencryption()
	{
		$this->_put('/Filter /Standard');
		$this->_put('/V 1');
		$this->_put('/R 2');
		$this->_put('/O ('.$this->_escape($this->Ovalue).')');
		$this->_put('/U ('.$this->_escape($this->Uvalue).')');
		$this->_put('/P '.$this->Pvalue);
	}

	function _puttrailer()
	{
		parent::_puttrailer();
		if ($this->encrypted) {
			$this->_put('/Encrypt '.$this->enc_obj_id.' 0 R');
			$this->_put('/ID [()()]');
		}
	}

	/**
	* Get MD5 as binary string
	*/
	function _md5_16($string)
	{
		return md5($string, true);
	}

	/**
	* Compute O value
	*/
	function _Ovalue($user_pass, $owner_pass)
	{
		$tmp = $this->_md5_16($owner_pass);
		$owner_RC4_key = substr($tmp,0,5);
		return RC4($owner_RC4_key, $user_pass);
	}

	/**
	* Compute U value
	*/
	function _Uvalue()
	{
		return RC4($this->encryption_key, $this->padding);
	}

	/**
	* Compute encryption key
	*/
	function _generateencryptionkey($user_pass, $owner_pass, $protection)
	{
		// Pad passwords
		$user_pass = substr($user_pass.$this->padding,0,32);
		$owner_pass = substr($owner_pass.$this->padding,0,32);
		// Compute O value
		$this->Ovalue = $this->_Ovalue($user_pass,$owner_pass);
		// Compute encyption key
		$tmp = $this->_md5_16($user_pass.$this->Ovalue.chr($protection)."\xFF\xFF\xFF");
		$this->encryption_key = substr($tmp,0,5);
		// Compute U value
		$this->Uvalue = $this->_Uvalue();
		// Compute P value
		$this->Pvalue = -(($protection^255)+1);
	}


// Tabla coloreada
// Tabla coloreada
function FancyTable($header,$detcuenta, $data)
{
    
	for ($k=0;$k<count($data);$k++){
		// Colores, ancho de línea y fuente en negrita
		if ($this->getY()>178){
			$this->AddPage('L');
		}
		$this->SetFont('Arial','',16);
		$varxfin=100;
		$this->Image('app/core/logo.png',10,$this->GetY(),33);
		$this->Ln(10);
		$this->Cell(290,10,utf8_decode('CRONOGRAMA DE PAGOS'),0,0,'C');
		$this->Ln(20);
		$this->SetFont('Arial','',11);
		$this->Cell(20);
		$this->SetFont('Arial','B',11);
		$this->Cell(20,6,utf8_decode("Crédito: "),0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell($varxfin,6,$detcuenta[$k]->cCtacod,0);
		$this->SetFont('Arial','B',11);
		$this->Cell(60,6,"Agencia: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell(40,6,utf8_decode( str_replace("-","",substr($detcuenta[$k]->cAgencia,2))),0);
		$this->Ln();
		$this->Cell(20);
		$this->SetFont('Arial','B',11);
		$this->Cell(20,6,utf8_decode("Cliente: "),0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell($varxfin,6,utf8_decode($detcuenta[$k]->titular),0);
		$this->SetFont('Arial','B',11);
		$this->Cell(60,6,"Vigencia: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell(40,6,utf8_decode($detcuenta[$k]->cFecgaVig),0);
		$this->Ln();
		$this->Cell(20);
		$this->SetFont('Arial','B',11);
		$this->Cell(20,6,"Moneda: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell($varxfin,6,utf8_decode(substr($detcuenta[$k]->Moneda,2)),0);
		$this->SetFont('Arial','B',11);
		$this->Cell(60,6,"T.E.A: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell(40,6,$detcuenta[$k]->nTea.'%',0);
		$this->Ln();
		$this->Cell(20);
		$this->SetFont('Arial','B',11);
		$this->Cell(20,6,"Monto: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell($varxfin,6,$detcuenta[$k]->nMontoDesem,0);
		$this->SetFont('Arial','B',11);
		$this->Cell(60,6,"T.C.E.A: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell(40,6,$detcuenta[$k]->nTcea.'%',0);
	

		$this->Ln(10);

		$this->SetFillColor(240,240,240);
		$this->SetTextColor(0);
		$this->SetDrawColor(0,0,0);
		$this->SetLineWidth(.3);
		$this->SetFont('','B');
		$this->SetFont('Arial','',11);
		// Cabecera
		$w = array(30, 26, 26, 30,30,30,26,26,30);
		$x=30;
		$this->Cell(12);
		for($i=0;$i<count($header);$i++)
			$this->Cell($w[$i],7,utf8_decode($header[$i]),1,0,'C',true);
		$this->Ln();
		// Restauración de colores y fuentes
		$this->SetFillColor(255,255,255);
		$this->SetTextColor(0,0,0);
		$this->SetFont('');
		// Datos
		$fill = false;
		$nMontoCuota=0.00;
		$nCapital=0.00;
		$nInteres=0.00;
		$nGastos=0.00;
		$nSegDes=0.00;
		$nSegMul=0.00;
		$nSalCap=0.00;
		for($j=0 ;$j<count($data[0]) ; $j++) {
			$this->Cell(12);
			$this->Cell($w[0],6,$data[$k][$j]->cFechaVen,'LR',0,'C',$fill);
			$this->Cell($w[1],6,$data[$k][$j]->nCuota,'LR',0,'C',$fill);
			$this->Cell($w[2],6,number_format($data[$k][$j]->nMontoCuota,2),'LR',0,'R',$fill);
			$nMontoCuota =$nMontoCuota+$data[$k][$j]->nMontoCuota;
			
			$this->Cell($w[3],6,number_format($data[$k][$j]->nCapital,2),'LR',0,'R',$fill);
			$nCapital=$nCapital+$data[$k][$j]->nCapital;

			$this->Cell($w[4],6,number_format($data[$k][$j]->nInteres,2),'LR',0,'R',$fill);
			$nInteres = $nInteres + $data[$k][$j]->nInteres;

			$this->Cell($w[5],6,number_format($data[$k][$j]->nGastos-($data[$k][$j]->nSegDes+$data[$k][$j]->nSegMul),2),'LR',0,'R',$fill);
			$nGastos=$nGastos+($data[$k][$j]->nGastos-($data[$k][$j]->nSegDes+$data[$k][$j]->nSegMul));

			$this->Cell($w[6],6,number_format($data[$k][$j]->nSegDes,2),'LR',0,'R',$fill);
			$nSegDes= $nSegDes +$data[$k][$j]->nSegDes;

			$this->Cell($w[7],6,number_format($data[$k][$j]->nSegMul,2),'LR',0,'R',$fill);
			$nSegMul=$nSegMul+$data[$k][$j]->nSegMul;
			
			$this->Cell($w[8],6,number_format($data[$k][$j]->nSalCap,2),'LR',0,'R',$fill);
			$nSalCap=$nSalCap+$data[$k][$j]->nSalCap;
	
			$this->Ln();
			$fill = !$fill;
		}
		
		$this->Cell(12);
		$this->Cell(array_sum($w),0,'','T');
		$this->Ln();
		$this->Cell(12);
		$this->Cell($w[0],6,'Total','LR',0,'C',$fill);
		$this->Cell($w[1],6,'','LR',0,'C',$fill);
		$this->Cell($w[2],6,number_format($nMontoCuota,2),'LR',0,'R',$fill);
		$this->Cell($w[3],6,number_format($nCapital,2),'LR',0,'R',$fill);
		$this->Cell($w[4],6,number_format($nInteres,2),'LR',0,'R',$fill);
		$this->Cell($w[5],6,number_format($nGastos,2),'LR',0,'R',$fill);
		$this->Cell($w[6],6,number_format($nSegDes,2),'LR',0,'R',$fill);
		$this->Cell($w[7],6,number_format($nSegMul,2),'LR',0,'R',$fill);
		$this->Cell($w[8],6,'','LR',0,'R',$fill);
		$this->Ln();
		$this->Cell(12);
		$this->Cell(array_sum($w),0,'','T');
		  //  $pdf->AddPage('L');
		$this->Ln(5);
		$this->Cell(15);
		$txt=file_get_contents("./app/core/fpdf/license.txt");
		$this->MultiCell(0,5,utf8_decode($txt));
		
	
	}
    // Línea de cierre
 
}
function FancyTable2($header,$detcuenta, $data)
{
    
	for ($k=0;$k<count($data);$k++){
		// Colores, ancho de línea y fuente en negrita
		if ($this->getY()>178){
			$this->AddPage('L');
		}
		$this->SetFont('Arial','',16);
		$varxfin=100;
		$this->Image('app/core/logo.png',10,$this->GetY(),33);
		$this->Ln(10);
		$this->Cell(290,10,utf8_decode('CRONOGRAMA DE PAGOS'),0,0,'C');
		$this->Ln(20);
		$this->SetFont('Arial','',11);
		$this->Cell(20);
		$this->SetFont('Arial','B',11);
		$this->Cell(20,6,utf8_decode("Crédito: "),0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell($varxfin,6,$detcuenta[$k]->cCtacod,0);
		$this->SetFont('Arial','B',11);
		$this->Cell(60,6,"Agencia: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell(40,6,utf8_decode( str_replace("-","",substr($detcuenta[$k]->cAgencia,2))),0);
		$this->Ln();
		$this->Cell(20);
		$this->SetFont('Arial','B',11);
		$this->Cell(20,6,utf8_decode("Cliente: "),0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell($varxfin,6,utf8_decode($detcuenta[$k]->titular),0);
		$this->SetFont('Arial','B',11);
		$this->Cell(60,6,"Vigencia: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell(40,6,utf8_decode($detcuenta[$k]->cFecgaVig),0);
		$this->Ln();
		$this->Cell(20);
		$this->SetFont('Arial','B',11);
		$this->Cell(20,6,"Moneda: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell($varxfin,6,utf8_decode(substr($detcuenta[$k]->Moneda,2)),0);
		$this->SetFont('Arial','B',11);
		$this->Cell(60,6,"T.E.A: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell(40,6,$detcuenta[$k]->nTea.'%',0);
		$this->Ln();
		$this->Cell(20);
		$this->SetFont('Arial','B',11);
		$this->Cell(20,6,"Monto: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell($varxfin,6,$detcuenta[$k]->nMontoDesem,0);
		$this->SetFont('Arial','B',11);
		$this->Cell(60,6,"T.C.E.A: ",0,'','R');
		$this->SetFont('Arial','',11);
		$this->Cell(40,6,$detcuenta[$k]->nTcea.'%',0);
	

		$this->Ln(10);

		$this->SetFillColor(240,240,240);
		$this->SetTextColor(0);
		$this->SetDrawColor(0,0,0);
		$this->SetLineWidth(.3);
		$this->SetFont('','B');
		$this->SetFont('Arial','',11);
		// Cabecera
		$w = array(30, 26, 26, 26,26,26,26,26,26,26);
		$x=30;
		$this->Cell(12);
		for($i=0;$i<count($header);$i++)
			$this->Cell($w[$i],7,utf8_decode($header[$i]),1,0,'C',true);
		$this->Ln();
		// Restauración de colores y fuentes
		$this->SetFillColor(255,255,255);
		$this->SetTextColor(0,0,0);
		$this->SetFont('');
		// Datos
		$fill = false;
		$nMontoCuota=0.00;
		$nCapital=0.00;
		$nInteres=0.00;
		$nInteresGra=0.00;
		$nGastos=0.00;
		$nSegDes=0.00;
		$nSegMul=0.00;
		$nSalCap=0.00;
		for($j=0 ;$j<count($data[0]) ; $j++) {
			$this->Cell(12);
			$this->Cell($w[0],6,$data[$k][$j]->cFechaVen,'LR',0,'C',$fill);
			$this->Cell($w[1],6,$data[$k][$j]->nCuota,'LR',0,'C',$fill);
			$this->Cell($w[2],6,$data[$k][$j]->nMontoCuota,'LR',0,'R',$fill);
			$nMontoCuota =$nMontoCuota+$data[$k][$j]->nMontoCuota;
			
			$this->Cell($w[3],6,number_format($data[$k][$j]->nCapital,2),'LR',0,'R',$fill);
			$nCapital=$nCapital+$data[$k][$j]->nCapital;

			$this->Cell($w[4],6,number_format($data[$k][$j]->nInteres,2),'LR',0,'R',$fill);
			$nInteres = $nInteres + $data[$k][$j]->nInteres;

			$this->Cell($w[5],6,number_format($data[$k][$j]->nInteresGra,2),'LR',0,'R',$fill);
			$nInteresGra = $nInteresGra + $data[$k][$j]->nInteresGra;

			$this->Cell($w[6],6,number_format($data[$k][$j]->nGastos-($data[$k][$j]->nSegDes+$data[$k][$j]->nSegMul),2),'LR',0,'R',$fill);
			$nGastos=$nGastos+($data[$k][$j]->nGastos-($data[$k][$j]->nSegDes+$data[$k][$j]->nSegMul));

			$this->Cell($w[7],6,number_format($data[$k][$j]->nSegDes,2),'LR',0,'R',$fill);
			$nSegDes= $nSegDes +$data[$k][$j]->nSegDes;

			$this->Cell($w[8],6,number_format($data[$k][$j]->nSegMul,2),'LR',0,'R',$fill);
			$nSegMul=$nSegMul+$data[$k][$j]->nSegMul;
			
			$this->Cell($w[9],6,number_format($data[$k][$j]->nSalCap,2),'LR',0,'R',$fill);
			$nSalCap=$nSalCap+$data[$k][$j]->nSalCap;
	
			$this->Ln();
			$fill = !$fill;
		}
		
		$this->Cell(12);
		$this->Cell(array_sum($w),0,'','T');
		$this->Ln();
		$this->Cell(12);
		$this->Cell($w[0],6,'Total','LR',0,'C',$fill);
		$this->Cell($w[1],6,'','LR',0,'C',$fill);
		$this->Cell($w[2],6,number_format($nMontoCuota,2),'LR',0,'R',$fill);
		$this->Cell($w[3],6,number_format($nCapital,2),'LR',0,'R',$fill);
		$this->Cell($w[4],6,number_format($nInteres,2),'LR',0,'R',$fill);
		$this->Cell($w[5],6,number_format($nInteresGra,2),'LR',0,'R',$fill);
		$this->Cell($w[6],6,number_format($nGastos,2),'LR',0,'R',$fill);
		$this->Cell($w[7],6,number_format($nSegDes,2),'LR',0,'R',$fill);
		$this->Cell($w[8],6,number_format($nSegMul,2),'LR',0,'R',$fill);
		$this->Cell($w[9],6,'','LR',0,'R',$fill);
		$this->Ln();
		$this->Cell(12);
		$this->Cell(array_sum($w),0,'','T');
		  //  $pdf->AddPage('L');
		$this->Ln(5);
		$this->Cell(15);
		$txt=file_get_contents("./app/core/fpdf/license.txt");
		$this->MultiCell(0,5,utf8_decode($txt));
		
	
	}
    // Línea de cierre
 
}

}

?>
