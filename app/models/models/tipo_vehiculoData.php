<?php
class tipo_vehiculoData {
	public static $tablename = "tipo_vehiculo";


	public	function __construct(){
		$this->cNombre = "";


	}

	public static function getTipo_Vehiculo(){
		$sql = "select * from ".self::$tablename."  where nFlag=0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new tipo_vehiculoData());
	}



}

?>
