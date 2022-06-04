<?php
class personaData {
	public static $tablename = "persona";


	public	function __construct(){
		$this->cDoi = "";
	//	$this->cNombres = "";
	//	$this->cApellidos = "";
		$this->nEstado = 1 ;
		$this->cUsuario="";
		$this->cPassword = "";
		$this->dRegistro = "";
		$this->dDesactiva = "";
		$this->nTipoUsuario = 1;
		$this->bAdmin = 0;	


	}
public static function getDatosEmpleados($idEmpresa){
	$sql = "SELECT r.`nId`,p.`cNombres`,p.`cApellidos` FROM responsable r
	JOIN persona p ON p.`nId` = r.`nIdPersona`
	JOIN empresa e ON e.`nId`=r.`nIdEmpresa` 
	WHERE e.nId = ".$idEmpresa."
	/*WHERE e.`nTipo`=1*/";
	$query = Executor::doit($sql);
	return Model::many($query[0],new personaData());

}

	public function add(){
		$sql = "call spt_ins_user";
		$sql .= "(
		\"$this->cNombres\",
		\"$this->cApellidos\",
		\"$this->cDoi\",
		\"$this->cPassword\")";

		return Executor::doit($sql);
	}
	
	public function addUpdPass($user,$newPass){
		$sql = "update persona set cPassword='$newPass' where cDoi='$user'";
		return Executor::doit($sql);
	}
	public function UpdUser($codigo){

		if($this->cPassword != ""){
			$sql = "UPDATE persona 
			SET cDoi='$this->cDoi',
			cNombres='$this->cNombres',
			cApellidos='$this->cApellidos',
			cUsuario='$this->cUsuario',
			cPassword ='$this->cPassword'
			WHERE nId = $codigo";
		}else{
			$sql = "UPDATE persona 
			SET cDoi='$this->cDoi',
			cNombres='$this->cNombres',
			cApellidos='$this->cApellidos',
			cUsuario='$this->cUsuario'
			WHERE nId = $codigo";
		}

		return Executor::doit($sql);
	}
	public function UpdUserAdmin(){
		$sql = "update clienteunibanca 
		set cNomcli='$this->nombre', 
		nDoi='$this->dni'
		where cUser='$this->user'";

		return Executor::doit($sql);
	}
	
	
	public function onOFF($cUser){
		$sql = "update ".self::$tablename." set nEstado=IF(nEstado=1,0,1) where nId = ".$cUser; 
		return Executor::doit($sql);
	}
	public function onOFFRoot($nId){
		$sql = "update ".self::$tablename." set bAdmin=IF(bAdmin=1,0,1), nTipoUsuario=IF(nTipoUsuario=1,0,1) where nId ='$nId'"; 
		return Executor::doit($sql);
	}
	public function deleteUser($cUser){
		$sql = "update ".self::$tablename." set nEstado=-1 where nId = ".$cUser; 
		return Executor::doit($sql);
	}
	
	
	public function addCliente(){
		$sql = "call spt_ins_solicitud_activate ";
		$sql .= "(
		\"$this->agencia\",
		\"$this->nTipo\",
		\"$this->dni\",
		\"$this->rucTit\",
		\"$this->nombres\",
		\"$this->apellidos\",
		\"$this->telefono\",
		\"$this->cCorreo\",
		\"$this->direccion\",
		\"$this->actividad\",
		\"$this->doirepresentante\",
		\"$this->representante\"
		)";

		return Executor::doit($sql);
	}
	public static function getUserByDNI(){
		$sql = "SELECT * FROM ".self::$tablename."  WHERE cdoi ='$this->cDoi'";
		$query =Executor::doit($sql);
		return Model::one($query[0],new personaData());
	}
	public function getGenerar($fecha){
        $sql = "select count(*) as cantidad from usuarios where iduser like '%$fecha%'";
        $query = Executor::doit($sql);

        return  Model::one($query[0],new personaData());
	}
	public static function generaCod($doi, $telefono, $cod,$cnombre){
		$sql = "INSERT INTO codigos (cDoi,cTelefono,cCodigo,cRazon)
		VALUES('".$doi."', '".$telefono."','".$cod."','$cnombre')";
        Executor::doit($sql);
	}
	public static function generaCodAgencia($doi, $telefono, $cod,$cnombre,$nAgencia,$cUser){
		$sql = "INSERT INTO codigos (cDoi,cTelefono,cCodigo,cRazon,nAgencia,cUser)
		VALUES('".$doi."', '".$telefono."','".$cod."','$cnombre',$nAgencia,'$cUser')";
        Executor::doit($sql);
	}
	public static function updateCod($doi, $telefono, $cod,$cnombre){
		$sql = "UPDATE codigos SET cCodigo='$cod',nRecuperaClave=nRecuperaClave+1 WHERE cDoi=$doi";
        Executor::doit($sql);
	}
	public static function validaDoi($doi){
		$sql = "SELECT * FROM codigos WHERE cdoi ='".$doi."'";
		$query =Executor::doit($sql);
		return Model::one($query[0],new personaData());
	}
	public static function validaFono($fono){
		$sql = "SELECT * FROM codigos WHERE cTelefono ='".$fono."'";
		$query =Executor::doit($sql);
		return Model::one($query[0],new personaData());
	}
	
	public static function validaDoiCod($doi, $cod){
		$sql = "SELECT * FROM codigos WHERE cdoi ='".$doi."' AND cCodigo='".$cod."'";
		$query =Executor::doit($sql);
		return Model::one($query[0],new personaData());
	}
	public static function validaCred($cred,$id){
		$sql ="SELECT * FROM colocacionesweb WHERE idcodigo=$id AND cctacod='$cred'";
		$query = Executor::doit($sql);
		return Model::many($query[0],new personaData());
	}
	public static function validaCred_new($cred){
		$sql ="SELECT * FROM colocacionesweb WHERE  cctacod='$cred'";
		$query = Executor::doit($sql);
		return Model::many($query[0],new personaData());
	}

	public static function allUser($CodUser){
		$sql = "call spt_sel_all_User('$CodUser')";
		$query = Executor::doit($sql);
		return Model::many($query[0],new personaData());

	}
	public static function datUser($xUser)
	{
		$sql = "SELECT nId,cDoi,cNombres,cApellidos,cUsuario FROM persona WHERE nId = '".$xUser."'";
		$query = Executor::doit($sql);

		return  Model::one($query[0], new personaData());
	}
	public static function datUserDow($xUser)
	{
		$sql = "SELECT p.nId,p.cDoi,p.cNombres,p.cApellidos,p.cUsuario FROM `responsable`res 
		JOIN persona p on p.nId=res.nIdPersona where res.nId = '".$xUser."'";
		$query = Executor::doit($sql);

		return  Model::one($query[0], new personaData());
	}

	public static function EsultimoAdminQ($nIdUser)
	{
		//SELECT COUNT(*) Cant FROM persona WHERE bAdmin = 1 AND nId<>0
		$sql = "CALL spt_sel_VerificaUltimoAdmin (".$nIdUser.")";
		$query = Executor::doit($sql);

		return  Model::one($query[0], new personaData());
	}

	public static function reporte()
	{
		$sql = "call stp_sel_reporte()";
		$query = Executor::doit($sql);

		return  Model::one($query[0], new personaData());
	}
	// public static function newUserCod()
	// {
	// 	$sql = "call stp_sel_newUser()";
	// 	$query = Executor::doit($sql);

	// 	return  Model::one($query[0], new personaData());
	// }

	public static function getByUser($user){
		$sql = "select * from ".self::$tablename." where cDoi=\"$user\"";
		$query = Executor::doit($sql);
		return Model::one($query[0],new personaData());
	}
	public static function getByDni($dni){
		$sql = "select * from ".self::$tablename."  where cDoi=\"$dni\"";
		$query = Executor::doit($sql);
		return Model::one($query[0],new personaData());
	}


	public static function validaIntentos($q){
		$sql = "select * from codigos where cdoi='$q'";
		$query = Executor::doit($sql);
		return Model::many($query[0],new personaData());
	}
	public static function ObterCodSol($cred){
		$sql = "CALL stp_get_codSol('$cred');";
		$query = Executor::doit($sql);
		return Model::many($query[0],new personaData());
	}
	public static function guardarResultado($idphpTipo,$plataforma,$Ipdis,$latitude,$longitude,$dataadd,$coderror){
	
		$sql = "call spt_ins_publicidad ($idphpTipo,'$plataforma','$Ipdis',$latitude,$longitude,'$dataadd','$coderror')";
		Executor::doit($sql);
	}

	public static function setFallido($DOI){
		$sql = "UPDATE codigos AS U1, (SELECT `nIntFallidos`+1 TAM FROM  CODIGOS WHERE Cdoi=$DOI )AS U2 
		SET U1.`nIntFallidos` = (U2.TAM)
		WHERE U1.Cdoi=$DOI";
		
		Executor::doit($sql);
		
	}
	public static function setUsado($DOI){
		$sql = "UPDATE codigos SET nUsado=1 WHERE cDoi='$DOI'";
		Executor::doit($sql);
		
	}
	// public static function setSolExt($DOI,$estado){
		
	// 	$sql = "UPDATE codigos SET nSolExt=$estado,  cDateSolExt=NOW() WHERE cDoi='$DOI'";
	// 	Executor::doit($sql);
		
	// }
	public static function setExt($DOI,$cred,$estado,$correo,$canal,$user,$motivo){

		$sql = "call stp_ins_reversion ('$DOI','$cred',$estado,'$correo','$canal','$user','$motivo') ";
		Executor::doit($sql);
		
	}
	

	//Added by TORE
	public static function getDatosPersona(){
		$sql = "SELECT `nId`, `cDoi`, `cNombres`, `cApellidos` FROM persona WHERE `nEstado` = 1";
		$query = Executor::doit($sql);
		return Model::many($query[0],new personaData());
	}

	public static function addPersona($doi, $nombre, $apellidos){
		$sql = "INSERT INTO persona (cDoi, cNombres, cApellidos) VALUES('".$doi."', '".$nombre."','".$apellidos."')";
        return Executor::doit($sql);
	}
	
	public static function addPersonaResponsable($doi, $nombre, $apellidos, $nIdEmpresa){
		$sql = "call stp_ins_responsable";
		$sql .= "(
		\"$doi\",
		\"$nombre\",
		\"$apellidos\",
		\"$nIdEmpresa\");";

		//return Executor::doit($sql);
		$query= Executor::doit($sql);
		return Model::one($query[0],new informeData());
	}


}
