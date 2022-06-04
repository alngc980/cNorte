<?php
class programaData {
	public static $tablename = "programa";


	public	function __construct(){
		$this->cNombre = "";
		$this->cCodigoA = "";
		$this->cCodigoN = "";
		$this->cVersionA = "";
		$this->cVersionN = "";
		$this->userCreate = "";
		$this->userActualiza = "";
		



	}

	public static function getProgramas(){
		$sql = "select * from ".self::$tablename."  where nFlag=0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new programaData());
	}
	public function getProgramasById(){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nId=$this->nId";
		$query = Executor::doit($sql);
		return Model::one($query[0],new programaData());
	}


}

?>
