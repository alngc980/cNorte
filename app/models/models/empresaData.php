<?php
class empresaData {
	public static $tablename = "empresa";


	public	function __construct(){
		$this->cNombre = "";
		$this->cRazonSocial = "";
		$this->nFlag = 0;
		$this->nTipo = 0;


	}

	public static function getDatosMiEmpresa(){
		$sql = "select * from ".self::$tablename."  where nTipo=1";
		$query = Executor::doit($sql);
		return Model::one($query[0],new empresaData());
	}
	public static function getDatosOtrasEmpresa(){
		$sql = "select * from ".self::$tablename."  where nTipo=0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresaData());
	}
	public static function getDatosAllEmpresas(){
		$sql = "select * from ".self::$tablename." where nFlag = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresaData());
	}

	//Added by TORE
	public function getEmpresaXId($id)
	{
		$sql = "SELECT * FROM ".self::$tablename." WHERE nId= ".$id." and nFlag = 0";
		$query = Executor::doit($sql);
		return Model::one($query[0],new empresaData());
	}

	public static function AddEmpresa($nombre, $razonSocial){
		$sql = "INSERT INTO ".self::$tablename."(`cNombre`, `cRazonSocial`, `nFlag`, `nTipo`) 
				VALUES('".$nombre."', '".$razonSocial."', 0, 0)";
		return Executor::doit($sql);
	}

	public static function UpdateEmpresa($id, $nombre, $razonSocial){
		$sql = "UPDATE ".self::$tablename." SET `cNombre` = '".$nombre."', `cRazonSocial` = '".$razonSocial."' WHERE `nId` = ".$id;
		return Executor::doit($sql);
	}

	public static function deleteEmpresa($id){
		$sql = "UPDATE ".self::$tablename." SET `nFlag` = 1 WHERE `nId` = ".$id;
		return Executor::doit($sql);
	}




}

?>
