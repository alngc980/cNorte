<?php


// 13 de Abril del 2014
// Module.php
// @brief tareas que se realizan con modulos.

class Module {
	public static $module;
	public static $view;
	public static $message;

	public  function setModule($module){
		self::$module = $module;
	}

	public static function loadLayout(){
		include "app/layouts/layout.php";
	}

	// validacion del modulo
	public static function isValid(){
		$valid = false;
		$folder = "app/modules/".Module::$module;

			if(is_dir($folder)){
				$valid=true;

			}else {
				self::$message= "<b>404 NOT FOUND</b> Module <b>".Module::$module."</b> folder  !!";
				Module::errorLog('error post', self::$message,1,1,1); //angc 1,1,1
			}


		return $valid;
	}

	public static function Error(){
		echo self::$message;
		Module::errorLog('error post', self::$message,1,1,1); //angc 1,1,1
		die();
	}

	public static function errorLog($numeroDeError, $descripcion, $fichero, $linea, $contexto){
	
		$year=date("Y");
		$mes=date("m");
		$dia=date("d");
		$hora=date("H");
		$carpeta = './res/log/'.$year;

		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$carpeta=$carpeta.'/'.$mes;
		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$carpeta=$carpeta.'/'.$dia;
		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$carpeta=$carpeta.'/'.$hora;
		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$carpeta=$carpeta.'/error';
		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$varContexto=json_encode($contexto);
		 $ddf = fopen($carpeta.'/errorLog.log','a');
		 fwrite($ddf,"[***INICIO: $numeroDeError ***]\r\n");
		 fwrite($ddf,"[".date("d/m/y H:i a")."] [1. FIC] :$fichero\r\n");
		 fwrite($ddf,"[".date("d/m/y H:i a")."] [2. LIN] : $linea\r\n");
		 fwrite($ddf,"[".date("d/m/y H:i a")."] [3. DES] : $descripcion\r\n");
		 fwrite($ddf,"[".date("d/m/y H:i a")."] [4. CON] : $varContexto\r\n");
		 fwrite($ddf,"[***FIN***]\r\n");
		 fclose($ddf);
	 }
	 public static function Logconsulta($numero,$texto){
		$year=date("Y");
		$mes=date("m");
		$dia=date("d");
		$hora=date("H");
		$carpeta = './res/log/'.$year;


		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$carpeta=$carpeta.'/'.$mes;
		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$carpeta=$carpeta.'/'.$dia;
		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$carpeta=$carpeta.'/'.$hora;
		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$carpeta=$carpeta.'/succes';
		if (!file_exists($carpeta)) {
			mkdir($carpeta, 0777, true);
		}
		$ddf = fopen($carpeta.'/succesLog.log','a');
		fwrite($ddf,"[".date("r")."] succes $numero: $texto\r\n");
		fclose($ddf);
	}



}



?>