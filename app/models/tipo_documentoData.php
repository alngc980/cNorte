<?php
class tipo_documentoData {
	public static $tablename = "tipo_documento";


	public	function __construct(){
		$this->cNombre = "";


	}

	public static function getTipo_Documento(){
		$sql = "select * from ".self::$tablename."  where nFlag=0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new tipo_documentoData());
	}



}

?>
