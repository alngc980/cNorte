<?php
class empresa_cargoData {
	public static $tablename = "empresa_cargo";


	public	function __construct(){
		$this->cCargo = "";
		$this->nFlag = "";
	}
	public function add(){
		$sql="insert into ".self::$tablename." (nIdEmpresa,cCargo) values ($this->nIdEmpresa,'$this->cCargo');";
		return Executor::doit($sql);
	}

	public static function getEmpresaCargo(){
		$sql ="SELECT EC.nId, E.`cNombre`,EC.`cCargo` FROM `empresa` E
		JOIN `empresa_cargo` EC ON E.`nId`=EC.`nIdEmpresa`
		WHERE EC.`nFlag` = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresa_cargoData());
	}

	public static function UpdateEmpresaCargo($nId,$Cargo){
		$sql ="UPDATE `empresa_cargo` SET cCargo = '".$Cargo."' WHERE `nId` = ".$nId."";
		$query= Executor::doit($sql);
		return $query;
	}

	public static function DeleteEmpresaCargo($nId){
		$sql ="UPDATE `empresa_cargo` SET nFlag = 1 WHERE `nId` = ".$nId."";
		$query= Executor::doit($sql);
		return $query;
	}

	public static function getEmpresaCargoDat($nid){
		$sql ="SELECT EC.`nId`, E.`cNombre`,EC.`cCargo` FROM `empresa` E
		JOIN `empresa_cargo` EC ON E.`nId`=EC.`nIdEmpresa`
		WHERE EC.`nId` = ". $nid. "";
		$query = Executor::doit($sql);
		return Model::one($query[0],new empresa_cargoData());
	}
	

	public static function getDatosMisCargosEmpresa(){
		$sql = "SELECT ec.* FROM empresa e
		INNER JOIN ".self::$tablename." ec ON e.`nId`= ec.`nIdEmpresa`
		WHERE e.`nTipo` =1";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresa_cargoData());
	}

	public static function getTodosCargos(){
		$sql = "SELECT * FROM ".self::$tablename." WHERE nFlag = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresa_cargoData());
	}

	public static function getCargosEmpresaId($idEmpresa){
		$sql = "SELECT EC.`nId`, E.`cNombre`,EC.`cCargo` FROM `empresa` E 
		INNER JOIN `empresa_cargo` EC ON E.`nId`=EC.`nIdEmpresa` 
		WHERE E.`nId` = ".$idEmpresa. " ";

		$query = Executor::doit($sql);
		return Model::many($query[0],new empresa_cargoData());
	}

	public static function getUltimoCargosEmpresaId($idEmpresa){
		$sql = "SELECT MAX(EC.`nId`) nId, E.`cNombre`,EC.`cCargo` FROM `empresa` E 
		INNER JOIN `empresa_cargo` EC ON E.`nId`=EC.`nIdEmpresa` 
		WHERE E.`nId` = ".$idEmpresa." AND EC.nFlag = 0";

		$query = Executor::doit($sql);
		return Model::one($query[0],new empresa_cargoData());
	}






}

?>
