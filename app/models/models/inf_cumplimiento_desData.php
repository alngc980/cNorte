<?php
class inf_cumplimiento_desData {
	public static $tablename = "inf_cumplimiento_des";


	public	function __construct(){
		$this->nId = "";
		$this->nIdInforme = "";
		$this->nIdCumplimiento = "";
		$this->nValor = "";
		$this->cDescripcion = "";
		$this->nIdEmpresa = "";
		$this->nFlag = "";


	}

	public function add(){
		$sql = "call spt_ins_documento_detalle";
		$sql .= "(
		\"$this->nIdInforme\",
		\"$this->nIdCumplimiento\",
		\"$this->nValor\",
		\"$this->nInc\",
		\"$this->cDescripcion\")";

		return Executor::doit($sql);
	
	}
	public function add_otro($idTipo){
		if($idTipo==1){
			$sql = "INSERT INTO inf_vehiculo_det (`nIdInforme`,`nIdEmp_Veh`,`nId_Emp_nor_obs`)
			VALUES($this->nIdInforme,$this->nValor,$this->cDescripcion)
			";
		}else{
			$sql = "INSERT INTO inf_trabajadoressupervisados_det (`nIdInforme`,`nId_E_C_T`,`nId_emp_nor_obs`)
			VALUES($this->nIdInforme,$this->nValor,$this->cDescripcion)
			";
		}
	

		return Executor::doit($sql);
	
	}

	public static function getDatosInforme(){
		$sql = "SELECT 	ROW_COUNT()+1 nFila,
			T.`cNombre` cNombre,
			i.`nId` nId,
			p.`cNombres` cNombres,
			IF(I.`nFlag`=0,'VIGENTE','ELIMINADO') nFlag,
			i.dregistro,
			i.dupdate
			FROM informe i
			JOIN persona p ON p.`nId`=i.`nIdUserRegistro`
			JOIN tipo_documento T ON T.`nId` = I.`nIdTipoDocumento`
		";
		$query = Executor::doit($sql);
		return Model::many($query[0],new inf_cumplimiento_desData());
	
	}
	public function getCumplimientoDesById()
	{
		$sql = "select * from ".self::$tablename."  where nFlag=0 and nId=$this->nId";
		$query = Executor::doit($sql);
		return Model::one($query[0],new informeData());
	}

	public function Delete()
	{
		$sql = "UPDATE ".self::$tablename." SET `nFlag` = 1 WHERE `nId` = $this->nId";
		return Executor::doit($sql);
	}

	public function Update()
	{
		$sql = "UPDATE ".self::$tablename." SET 
		`nValor` = $this->nValor, 
		`nValorInc` = $this->nInc, 
		`cDescripcion` = '$this->cDescripcion' WHERE `nId` = $this->nId";
		return Executor::doit($sql);
	}




}

?>
