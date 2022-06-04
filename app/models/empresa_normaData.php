<?php
class empresa_normaData {
	public static $tablename = "empresa_normas";


	public	function __construct(){
		$this->cNombre = "";


	}
	public function add_obs(){
		$sql="insert into empresa_normas_observacion (`nId_empresa_norma`,cValor,`cObservacion`)
		 values ($this->control,'$this->codigo','$this->observacion');";
		$query= Executor::doit($sql);
		return $query;
	}

	public static function getNormas(){
		$sql = "select * from ".self::$tablename."  where nFlag=0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresa_normaData());
	}
	public static function getAllNormasObs(){
		$sql = "SELECT o.`nId`, n.`cDescripcion` control,o.`cValor`,o.`cObservacion` FROM  `empresa_normas` n
		JOIN empresa_normas_observacion o ON n.`nId`=o.`nId_empresa_norma`
		AND o.nFlag = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresa_normaData());
	}

	public static function getNormaObs($nId){
		$sql = "SELECT o.`nId` nId, n.`cDescripcion` cDescripcion,o.`cValor` Valor,o.`cObservacion` cObservacion FROM  `empresa_normas` n
		JOIN `empresa_normas_observacion` o ON n.`nId`=o.`nId_empresa_norma`
		WHERE o.`nId` = ".$nId."";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresa_normaData());
	}

	public static function DeleteNorma($nId){
		$sql ="UPDATE `empresa_normas_observacion` SET nFlag = 1 WHERE `nId` = ".$nId."";
		$query= Executor::doit($sql);
		return $query;
	}

	
	public static function UpdateNormadb($nId, $valor, $observacion){
		$sql ="UPDATE empresa_normas_observacion C 
		SET C.`cValor`= '$valor', C.`cObservacion` = '$observacion'
		WHERE C.`nId` = ".$nId;
		$query= Executor::doit($sql);
		return $query;
	}

}

?>
