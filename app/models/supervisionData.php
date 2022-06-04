<?php
class supervisionData {
	public static $tablename = "supervision";


	public	function __construct(){
		$this->cNombre = "";
		$this->nFlag = "";

	}

	public static function getSupervision(){
		$sql = "select * from ".self::$tablename."  where nFlag=0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new supervisionData());
	}

	public static function addSupervision($nombre){
		$sql = "INSERT INTO ".self::$tablename." (cNombre, nFlag) VALUES('".$nombre."', 0)";
		return Executor::doit($sql);
	}


	public static function updateSupervisionId($id, $nombre){
		$sql = "UPDATE ".self::$tablename." SET `cNombre` = '".$nombre."' WHERE `nId` = ".$id."";
		return Executor::doit($sql);
	}

	public static function deleteSupervisionId($id){
		$sql = "UPDATE ".self::$tablename." SET `nFlag` = 1 WHERE `nId` = ".$id."";
		return Executor::doit($sql);
	}

	public function getSupervisionId($id){
		$sql = "select * from ".self::$tablename." where nId = ".$id." AND nFlag=0";
		$query = Executor::doit($sql);
		return Model::one($query[0],new supervisionData());
	}


}

?>
