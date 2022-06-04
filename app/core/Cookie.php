<?php


class Cookie {
	function __get($value){
		if(!$this->exist($value)){
			$message = "<b>COOKIE ERROR</b> El parametro <b>$value</b> que intentas llamar no existe!";
			Module::errorLog('error cookie', $message);
			die();
		}
		return $_COOKIE[$value];
	}

	function  exist($value){
		$found = false;
		if(isset($_COOKIE[$value])){
			$found=true;
		}
		return $found;
	}
}



?>
