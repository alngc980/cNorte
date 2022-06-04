<?php
class tareaData {
	public static $tablename = "tarea";


	public	function __construct(){
		$this->nId = "";
		$this->cNombre = "";
		$this->nFlag = "";

	}

	public static function getTareas(){
		$sql = "select * from ".self::$tablename."  where nFlag=0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new tareaData());
	}
	public function getTareaById(){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nId=$this->nId";
		$query = Executor::doit($sql);
		return Model::one($query[0],new tareaData());
	}



}

?>
