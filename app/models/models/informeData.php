<?php
class informeData {
	public static $tablename = "informe";


	public	function __construct(){
		$this->nId = "";
		$this->nIdUserRegistro = "";
		$this->nIdPrograma = "";
		$this->nIdTarea = "";
		$this->nIdTipoDocumento = "";
		$this->nIdEmpresa = "";
		$this->nIdUUNN = "";
		$this->nIdCargo = "";
		$this->nIdResponsable = "";
		$this->nIdSupervision = "";
		$this->cNombreInforme = "";
		$this->cActividad = "";
		$this->cObra = "";
		$this->cLugar = "";
		$this->cArea = "";
		$this->cFecha = "";
		$this->nActa = "";
		$this->cESAS = "";


	}

	public function add(){
		$sql = "call spt_ins_documento";
		$sql .= "(
		\"$this->nIdUserRegistro\",
		\"$this->nIdPrograma\",
		\"$this->nIdTarea\",
		\"$this->nIdTipoDocumento\",
		\"$this->nIdEmpresa\",
		\"$this->nIdUUNN\",
		\"$this->nIdCargo\",
		\"$this->nIdResponsable\",
		\"$this->nIdSupervision\",
		\"$this->cActividad\",
		\"$this->cObra\",
		\"$this->cLugar\",
		\"$this->cArea\",
		\"$this->cFecha\",
		\"$this->nActa\",
		\"$this->cESAS\")";

		$query= Executor::doit($sql);
		return Model::one($query[0],new informeData());
	}

	public function update(){
		$sql = "UPDATE `informe` SET 
		`nIdCargo` = $this->nIdCargo,
		`nIdResponsable` = $this->nIdResponsable,
		`nIdSupervision` = $this->nIdSupervision,
		`cActividad` = '".$this->cActividad."',
		`cObra` = '".$this->cObra."',
		`cLugar` = '".$this->cLugar."',
		`cArea` = '".$this->cArea."',
		`nActa` = $this->nActa,
		`cFecha` = '".$this->cFecha."'	
		WHERE `nId` = $this->nId";
		
		return Executor::doit($sql);
	}

	public static function getDatosInforme($nIdUser){
		$sql = "call spt_sel_obtienedocumento ($nIdUser)";
		$query = Executor::doit($sql);
		return Model::many($query[0],new informeData());
	
	}
	public static function getReporteInspeccion(){
		$sql = "call spt_sel_inspeciones (2021)";
		$query = Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}
	public static function getReporteNICab(){
		$sql = "SELECT nid, cnombre FROM `empresa` WHERE ntipo=0
		ORDER BY nid ASC";
		$query = Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}
	public static function getReporteNICod(){
		$sql = "SELECT * FROM codigos WHERE ccodigo=500 AND cValor NOT IN (500)";
		$query = Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}
	public static function getReporteDatoNI($idEmp,$nValorInc){
		$sql = "SELECT COUNT(*) tot FROM `informe` i
		JOIN `inf_cumplimiento_des` ides ON i.`nId`=ides.`nIdInforme`
		JOIN `empresa` e ON e.`nId`=i.`nIdEmpresa`
		JOIN codigos c ON c.`cValor` = ides.`nValorInc` AND c.`cCodigo`=500
		WHERE ides.`nValor`  =2 AND e.`nId`=$idEmp AND ides.`nValorInc`=$nValorInc
		";
		$query = Executor::doit($sql);
		return Model::one($query[0],new informeData());
	}
	
	public function getInformeById()
	{
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nId=$this->nId";
		$query = Executor::doit($sql);
		return Model::one($query[0],new informeData());
	}
	public function getGrafico()
	{
		$sql = "CALL stp_sel_resumen_informe2 ($this->nId);";
		$query = Executor::doit($sql);
		return Model::one($query[0],new informeData());
	}

	public function DeleteInforme($nIdInforme)
	{
		$sql = "update ".self::$tablename." set nFlag = 2 where nId=$nIdInforme";
		return Executor::doit($sql);
	}

	public function getInformeDatos()
	{
		$sql = "call stp_sel_resumen_informe($this->nId)";
		$query = Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}

	
	public function getTrabajadoresSupervisados(){
		$sql ="SELECT p.`cNombres`,p.`cApellidos`,ec.`cCargo`,eno.`cValor` cCodigo FROM `informe` i
		JOIN `inf_trabajadoressupervisados_det` it ON it.`nIdInforme`=i.`nId`
		JOIN `empresa_cargo_trabajador` ect ON ect.`nId`=it.`nId_E_C_T`
		JOIN `empresa_cargo` ec ON ect.`nIdEmpresa_Cargo`=ec.`nId`
		JOIN persona p ON p.`nId`=ect.`nIdPersona`
		JOIN `empresa_normas` en ON en.`nIdEmpresa`=2
		JOIN `empresa_normas_observacion` eno ON eno.`nId_empresa_norma`=en.`nId` AND eno.`nId`=it.`nId_emp_nor_obs`";
		$query= Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}

	public function DeleteInfoTrabajadorSupervisado()
	{
		$sql = "update inf_trabajadoressupervisados_det set nFlag = 1 where nId =$this->nId";
		return Executor::doit($sql);
	}

	//Added by TORE
	public function getTrabajadoresSupervisadosInforme($idInforme){
		$sql ="SELECT it.`nId`, p.`cNombres`,p.`cApellidos`,ec.`cCargo`, IF(eno.`nId` IS NULL, '', eno.`nId`) nCodigo, IF(eno.`cValor` IS NULL, '', eno.`cValor`) cCodigo FROM `informe` i
		JOIN `inf_trabajadoressupervisados_det` it ON it.`nIdInforme`=i.`nId`
		JOIN `empresa_cargo_trabajador` ect ON ect.`nId`=it.`nId_E_C_T`
		JOIN `empresa_cargo` ec ON ect.`nIdEmpresa_Cargo`=ec.`nId`
		JOIN persona p ON p.`nId`=ect.`nIdPersona`
		INNER JOIN `empresa_normas` en ON en.`nIdEmpresa`= en.`nIdEmpresa`
		INNER JOIN `empresa_normas_observacion` eno ON eno.`nId_empresa_norma`=en.`nId` AND eno.`nId`=it.`nId_emp_nor_obs`
		WHERE it.nIdInforme = ".$idInforme." AND it.nFlag = 0 /*AND eno.nFlag = 0*/";

		$query= Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}
	public function getTrabajadoresSupervisadosInforme_REPORTE($idInforme){
		$sql ="SELECT DISTINCT p.`cNombres`,p.`cApellidos`,ec.`cCargo`, GROUP_CONCAT(DISTINCT eno.`cValor`) cCodigo 
		FROM `informe` i JOIN `inf_trabajadoressupervisados_det` it ON it.`nIdInforme`=i.`nId` 
		JOIN `empresa_cargo_trabajador` ect ON ect.`nId`=it.`nId_E_C_T` 
		JOIN `empresa_cargo` ec ON ect.`nIdEmpresa_Cargo`=ec.`nId` 
		JOIN persona p ON p.`nId`=ect.`nIdPersona` 
		JOIN `empresa_normas` en ON en.`nIdEmpresa`= en.`nIdEmpresa` 
		JOIN `empresa_normas_observacion` eno ON eno.`nId_empresa_norma`=en.`nId` AND eno.`nId`=it.`nId_emp_nor_obs`
		WHERE it.nIdInforme = ".$idInforme." AND it.nFlag = 0 
		GROUP BY p.`cNombres`,p.`cApellidos`,ec.`cCargo`
		/*AND eno.nFlag = 0*/";

		$query= Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}
	public function getTrabajadoresSupervisadosInforme_REPORTE_LEYENDA($idInforme){
		$sql ="SELECT distinct  eno.`cValor` cCodigo,en.cDescripcion,eno.cObservacion FROM `informe` i
		JOIN `inf_trabajadoressupervisados_det` it ON it.`nIdInforme`=i.`nId`
		JOIN `empresa_cargo_trabajador` ect ON ect.`nId`=it.`nId_E_C_T`
		JOIN `empresa_cargo` ec ON ect.`nIdEmpresa_Cargo`=ec.`nId`
		JOIN persona p ON p.`nId`=ect.`nIdPersona`
		INNER JOIN `empresa_normas` en ON en.`nIdEmpresa`= en.`nIdEmpresa`
		INNER JOIN `empresa_normas_observacion` eno ON eno.`nId_empresa_norma`=en.`nId` AND eno.`nId`=it.`nId_emp_nor_obs`
		WHERE it.nIdInforme = ".$idInforme." AND it.nFlag = 0 
		/*AND eno.nFlag = 0*/";

		$query= Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}
	
	//End Added

	public function getUnidadesMovilesSupervisados(){
		$sql ="SELECT T.`cNombre`,tv.`cPlaca`, ENO.`cValor` FROM `informe` i
		JOIN `inf_vehiculo_det` iv ON i.`nId`=iv.`nIdInforme`
		JOIN `empresa_normas_observacion` ENO ON ENO.`nId`=iv.`nId_Emp_nor_obs`
		JOIN `empresa_vehiculo` tv ON tv.`nIdEmpresa`=2
		JOIN `tipo_vehiculo` T ON T.`nId` =tv.`nTipoVehiculo`
		";
		$query= Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}
	
	//Added by TORE
	public function getUnidadesMovilesSupervisadosInforme($idInforme){
		$sql ="SELECT iv.`nId`, T.`cNombre`,tv.`cPlaca`, ENO.`cValor` FROM `informe` i
		JOIN `inf_vehiculo_det` iv ON i.`nId`=iv.`nIdInforme`
		JOIN `empresa_normas_observacion` ENO ON ENO.`nId`=iv.`nId_Emp_nor_obs`
		JOIN `empresa_vehiculo` tv ON tv.`nIdEmpresa`=  i.nIdEmpresa AND iv.nIdEmp_Veh = tv.nId
		JOIN `tipo_vehiculo` T ON T.`nId` =tv.`nTipoVehiculo`
		WHERE iv.nIdInforme = ".$idInforme." AND iv.nFlag = 0 AND IFNULL(tv.nFlag, 0) = 0";
		$query= Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}

	public function DeleteInfoVehiculoInforme()
	{
		$sql = "update inf_vehiculo_det set nFlag = 1 where nId =$this->nId";
		return Executor::doit($sql);
	}
	//Added by TORE

	public function AddImagenes(){
		$sql ="INSERT INTO inf_cumplimiento_img(`nIdInforme`,`nIdCumplimiento`,cruta,cNombre)
		VALUES($this->key,$this->nSeccion,'$this->cRuta','$this->cName')";
		Executor::doit($sql);
	}
	public function AddActaImagenes(){
		$sql ="UPDATE `informe` SET crutaActa ='$this->cRuta' WHERE nid =$this->nId";
		Executor::doit($sql);
	}
	public function AddActaReversoImagenes(){
		$sql ="UPDATE `informe` SET cRutaActaReverso ='$this->cRuta' WHERE nid =$this->nId";
		Executor::doit($sql);
	}
	public function getImagenes(){
		$sql ="select * from inf_cumplimiento_img
		where nIdInforme= $this->key and nIdCumplimiento= $this->nSeccion";
		$query=Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}
	public function delImagenes(){
		$sql ="DELETE FROM inf_cumplimiento_img
		where nIdInforme= $this->nIdInforme and nId= $this->key";
		Executor::doit($sql);
		
	}
	public function getActaImagenes(){
		$sql ="select * from inf_cumplimiento_img
		where nIdInforme= $this->key and nIdCumplimiento= $this->nSeccion";
		$query=Executor::doit($sql);
		return Model::many($query[0],new informeData());
	}

}

?>
