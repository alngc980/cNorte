<?php
class trabajadoresData {
	//public static $tablename = "persona";


	public	function __construct(){
		//$this->cDoi = "";
		//$this->cNombres = "";
		//$this->cApellidos = "";
		//$this->nEstado = 1 ;
		//$this->cUsuario="";
		//$this->cPassword = "";
		//$this->dRegistro = "";
		//$this->dDesactiva = "";
		//$this->nTipoUsuario = 1;
		//$this->bAdmin = 0;	


	}


	/*Added by TORE */
	public static function addResponsable($idEmpresa, $idPersona){
		$sql = "INSERT INTO `responsable`(`nIdPersona`, `nIdEmpresa`, `nFlag`) VALUES(".$idEmpresa.",".$idPersona.",0)";
		return Executor::doit($sql);
	}

	public static function getCargosEmpresa($nId){
		$sql = "SELECT ec.`nId`, e.`cNombre`, ec.`cCargo` FROM empresa e
		INNER JOIN empresa_cargo ec ON e.`nId`= ec.`nIdEmpresa`
		WHERE e.`nId` = ". $nId. " and ec.`nFlag` = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresa_cargoData());
	}

	public static function getPersonalCargosEmpresa(){
		$sql = "SELECT e.cNombre, p.cNombres, p.cApellidos, p.cDoi, ec.cCargo
		FROM `empresa_cargo_trabajador` et
		INNER JOIN `persona` p ON et.nIdPersona = p.nId
		INNER JOIN `empresa_cargo` ec ON et.nIdEmpresa_Cargo = ec.nId
		INNER JOIN `empresa` e ON ec.nIdEmpresa = e.nId
		WHERE et.nFlag = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresa_cargoData());
	}

	public function addTrabajador($idEmpresaCargo, $idPersona){
		$sql = "INSERT INTO `empresa_cargo_trabajador`(`nIdEmpresa_Cargo`, `nIdPersona`, `nFlag`) VALUES(".$idEmpresaCargo.", ".$idPersona.", 0)";
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

	
	
















	
	


}

?>
