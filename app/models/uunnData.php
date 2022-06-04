<?php
class uunnData
{
	public static $tablename = "uunn";


	public	function __construct()
	{
		$this->cNombre = "";
	}

	//Added by TORE
	public static function AddUUNN($nombre)
	{
		$sql = "INSERT INTO `uunn` (`cNombre`, `nFlag`) VALUES('".$nombre."', 0)";
		return Executor::doit($sql);
	}

	public static function getUUNN()
	{
		$sql = "select * from " . self::$tablename . "  where nFlag=0";
		$query = Executor::doit($sql);
		return Model::many($query[0], new uunnData());
	}

	public static function getUUNNId($id)
	{
		$sql = "select * from " . self::$tablename . " WHERE `nId` = ".$id." AND nFlag=0";
		$query = Executor::doit($sql);
		return Model::one($query[0], new uunnData());
	}

	public static function updateUUNN($id, $nombre)
	{
		$sql = "UPDATE ". self::$tablename ." SET `cNombre` = '".$nombre."' WHERE `nId` = ".$id."";
		return Executor::doit($sql);
	}
	public static function deleteUUNN($id)
	{
		$sql = "UPDATE ". self::$tablename ." SET `nFlag` = 1 WHERE `nId` = ".$id."";
		return Executor::doit($sql);
	}

}
