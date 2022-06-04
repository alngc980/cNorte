<?php
class empresavehiculoData {
	public static $tablename = "empresa_vehiculo";


	public	function __construct(){
		$this->cPlaca = "";


	}
	public function add(){
		$sql="insert into ".self::$tablename." (nIdEmpresa,nTipoVehiculo,cPlaca,nFlag) values ($this->nIdEmpresa,$this->nTipo,'$this->cPlaca',0);";
		$query= Executor::doit($sql);
		return $query;
	}

	public function updateUm($umID,$cPlaca){
		$sql="UPDATE ".self::$tablename." SET cPlaca = '".$cPlaca."' WHERE `nId` = ".$umID."";
		$query= Executor::doit($sql);
		return $query;
	}

	public function DeleteUm($umID){
		$sql="UPDATE ".self::$tablename." SET nFlag = 1 WHERE `nId` = ".$umID."";
		$query= Executor::doit($sql);
		return $query;
	}

	public static function getAll(){
		$sql = "SELECT ev.`nId`,  e.`cNombre` empresa,tv.`cNombre` tipo, ev.`cPlaca`  FROM `empresa` e
		JOIN `empresa_vehiculo` ev ON e.`nId`=ev.`nIdEmpresa` AND ev.`nFlag` = 0
		JOIN `tipo_vehiculo` tv ON tv.`nId`=ev.`nTipoVehiculo`";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresavehiculoData());
	}

	public static function getDatUpd($nId){
		$sql = "SELECT ev.`nId`,  e.`cNombre` empresa,tv.`cNombre` tipo, ev.`cPlaca`  FROM `empresa` e
		JOIN `empresa_vehiculo` ev ON e.`nId`=ev.`nIdEmpresa`
		JOIN `tipo_vehiculo` tv ON tv.`nId`=ev.`nTipoVehiculo`
		WHERE ev.`nId` = ".$nId."";
		$query = Executor::doit($sql);
		return Model::one($query[0],new empresavehiculoData());
	}

	public static function getVehiculosEmpresaId($nIdEmpresa){
		$sql = "SELECT e.nId AS nIdEmpresa, ve.nId AS nIdVehiculo, tv.cNombre, ve.cPlaca
		FROM `empresa` e
		INNER JOIN `empresa_vehiculo` ve ON e.nId = ve.nIdEmpresa
		INNER JOIN `tipo_vehiculo` tv ON ve.nTipoVehiculo = tv.nId
		WHERE e.nId = ".$nIdEmpresa." AND ve.nFlag = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new empresavehiculoData());
	}

}

?>
