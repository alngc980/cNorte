<?php
class codigosData {
	public static $tablename = "codigos";


	public	function __construct(){
		$this->nId = "";
		$this->cCodigo = "";
		$this->cValor = "";
		$this->cDescripcion = "";
		$this->nFlag = "";


	}

	public  function getCodigos(){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and cCodigo =$this->cCodigo  AND cvalor NOT IN ($this->cCodigo)";
		$query = Executor::doit($sql);
		return Model::many($query[0],new codigosData());
	}
	public  function getCodigosNI($parCod){
		$sql = "select * from ".self::$tablename."  where nFlag=0 and cCodigo =$parCod  AND cvalor NOT IN ($parCod)";
		$query = Executor::doit($sql);
		return Model::many($query[0],new codigosData());
	}
	public  function getCodigosModal(){
		$sql = "select * from ".self::$tablename."  
		where nFlag=0 and cCodigo =$this->nIdInicia  AND cvalor IN ($this->nValor) 
		union all
		select * from ".self::$tablename."  
		where nFlag=0 and cCodigo =$this->nIdInicia  AND cvalor not IN ($this->nValor,$this->nIdInicia)
		";
		$query = Executor::doit($sql);
		return Model::many($query[0],new codigosData());
	}



}

?>
