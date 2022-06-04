<?php
// 13 de Abril del 2014
// revisado y modificado por jhobri26 28/09/2018
// View.php
// @brief Una vista corresponde a cada componente visual dentro de un modulo.

class View {
	public static $content;
	public static $params;
	/**
	* @function load
	* @brief la funcion load carga una vista correspondiente a un modulo
	**/
	public static function render($cntrllr,$view,$data= array()){
		// Module::$module;
		self::$content = "";

		if (file_exists("app/views/".$view."/widget-default.php")){
		if(!isset($_GET['view'])){
			self::$content= "app/views/".$view."/widget-default.php";
		}else{
			if(View::isValid()){
			self::$content= "app/views/".$view."/widget-default.php";
			}else{
		
				View::Error("<b>404 NOT FOUND</b> View <b>".$view."</b> folder  !!");
			
				
			}
		}
		if($cntrllr->default_layout!=""){
			include "app/layouts/".$cntrllr->default_layout;
		}else{
			Module::errorLog('error', 'verifica el view linea 32',"view",34,"no hay layout");
			Core::redir("./?r=index/index");
		}
		}else{
		Core::redir("./?r=index/index");
		}


	}


	/**
	* @function isValid
	* @brief valida la existencia de una vista
	**/
	public static function isValid(){
		$valid=false;
		if(isset($_GET["view"])){
			if(file_exists($file = "core/modules/".Module::$module."/view/".$_GET['view']."/widget-default.php")){
				$valid = true;
			}
		}
		return $valid;
	}

	public static function Error($message){
		Module::errorLog(1,"erro view","View".$message,59,"");
	
	}

}



?>
