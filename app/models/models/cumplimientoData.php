<?php
class cumplimientoData {
	public static $tablename = "cumplimiento";


	public	function __construct(){
		$this->nId = "";
		$this->nIdTarea = "";
		$this->cCodigo = "";
		$this->cNombre = "";
		$this->nOrden = "";

	}

	public function getCumplimientoInicia(){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nidTarea=$this->nIdTarea
		ORDER BY norden ASC LIMIT 0,1";
		$query = Executor::doit($sql);
		return Model::one($query[0],new cumplimientoData());
	}
	public function getCumplimientoPosicion(){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nidTarea=$this->nIdTarea
		and nOrden in ($this->nOrden)
		ORDER BY norden ASC LIMIT 0,1";
		$query = Executor::doit($sql);
		return Model::one($query[0],new cumplimientoData());
	}
	public function getCumplimientoById(){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nidTarea=$this->nIdTarea
		and nId in ($this->nId)
		ORDER BY norden ASC LIMIT 0,1";
		$query = Executor::doit($sql);
		return Model::one($query[0],new cumplimientoData());
	}
	public function getCumplimientoByOnlyId(){
		$sql = "select * from ".self::$tablename."  where nFlag=0
		and nId in ($this->nId)
		ORDER BY norden ASC LIMIT 0,1";
		$query = Executor::doit($sql);
		return Model::one($query[0],new cumplimientoData());
	}
	public function getCumplimientoProximo(){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nidTarea=$this->nIdTarea
		and nId NOT IN ($this->nId) and nOrden >$this->nOrden
		ORDER BY norden ASC LIMIT 0,1";
		$query = Executor::doit($sql);
		return Model::one($query[0],new cumplimientoData());
	}
	public function getCumplimientoAnterior(){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nidTarea=$this->nIdTarea
		 and nOrden < $this->nOrden 
		ORDER BY norden desc LIMIT 0,1";
		$query = Executor::doit($sql);
		return Model::one($query[0],new cumplimientoData());
	}
	public function getTareaById(){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nId=$this->nId";
		$query = Executor::doit($sql);
		return Model::one($query[0],new cumplimientoData());
	}
	public function getCumplimientosRegistrados(){
		$sql = "
		SELECT  i.`nId`, i.`nIdInforme`, i.`nIdCumplimiento`,cod.`cValor` nValorTipo, c.`cNombre` Cumpliento, cod.`cDescripcion` descripcionTipo,i.`cDescripcion` detalle,i.`dCreate` 
		FROM `inf_cumplimiento_des` i
		JOIN `cumplimiento` c ON c.`nId`= i.`nIdCumplimiento`
		JOIN `codigos` cod ON cod.`cCodigo`=c.`nTipo` AND cod.`cValor`=i.`nValor`
 		WHERE `nIdInforme`=$this->nIdInforme AND i.`nIdCumplimiento`=$this->nIdCumplimiento
		AND i.nFlag = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new cumplimientoData());
	}
	public function getCumplimientosByInforme(){
		$sql = "SELECT c.nIdTarea, c.`nId`,c.`cCodigo`,c.`cNombre`,c.`nModelo`  FROM `informe` i
		JOIN `cumplimiento` c ON c.`nIdTarea`= i.`nIdTarea`
		WHERE i.nId=$this->nIdInforme AND c.nFlag = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new cumplimientoData());
	}
	public function getEmpleados(){
		$sql = "SELECT CONCAT(p.`cApellidos`,p.`cNombres`)'Descripcion',ec.`nIdEmpresa`,ect.`nId`,ec.`cCargo` FROM  
		`empresa_cargo_trabajador` ect
		JOIN `empresa_cargo` ec ON ec.`nId`=ect.`nIdEmpresa_Cargo`
		JOIN `persona` p ON p.`nId`=ect.`nIdPersona`
		";
		$query = Executor::doit($sql);
		return Model::many($query[0],new cumplimientoData());
	}
	public function getNormas(){
			$sql = 'SELECT eno.`nId`, CONCAT("(",eno.`cValor`,")",en.`cDescripcion`," / ", eno.`cObservacion`) cDescripcion,en.nTipo FROM `empresa_normas` en
			JOIN `empresa_normas_observacion` eno ON eno.`nId_empresa_norma`=en.nid
		';
		$query = Executor::doit($sql);
		return Model::many($query[0],new cumplimientoData());
	}
	public function getVehiculos(){
		$sql = "SELECT e.`nId`, CONCAT(cPlaca,' / ',cNombre) cDescripcion FROM `empresa_vehiculo` e
		JOIN `tipo_vehiculo` t ON e.`nTipoVehiculo`=t.`nId` AND IFNULL(e.nFlag, 0) = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new cumplimientoData());
	}


	public function getEmpleadosIdEmpresa($idEmpresa){
		$sql = "SELECT CONCAT(p.`cApellidos`, ' ',p.`cNombres`)'Descripcion',ec.`nIdEmpresa`,ect.`nId`, ec.`nId` nIdCargo, ec.`cCargo` FROM  
		`empresa_cargo_trabajador` ect
		JOIN `empresa_cargo` ec ON ec.`nId`=ect.`nIdEmpresa_Cargo`
		JOIN `persona` p ON p.`nId`=ect.`nIdPersona`
		WHERE ec.nIdEmpresa = ".$idEmpresa."
		";
		$query = Executor::doit($sql);
		return Model::many($query[0],new cumplimientoData());
	}

	public function getVehiculosEmpresa($idEmpresa){
		$sql = "SELECT e.`nId`, CONCAT(cPlaca,' / ',cNombre) cDescripcion FROM `empresa_vehiculo` e
		JOIN `tipo_vehiculo` t ON e.`nTipoVehiculo`=t.`nId`
		WHERE e.nIdEmpresa = ".$idEmpresa." AND IFNULL(e.nFlag, 0) = 0";
		$query = Executor::doit($sql);
		return Model::many($query[0],new cumplimientoData());
	}



}

?>
