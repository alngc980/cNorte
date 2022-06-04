<?php


// 13 de Octubre del 2014
// Post.php
// @brief esto es algo mucho mas magico

class Post {
	function __get($value){
		if(!$this->exist($value)){
			$message="<b>POST ERROR</b> El parametro <b>$value</b> que intentas llamar no existe!";
			Module::errorLog(1,"Error POST".$message,"POST",12,"");
			die();
		}
		return $_POST[$value];
	}

	function  exist($value){
		$found = false;
		if(isset($_POST[$value])){
			$found=true;
		}
		return $found;
	}
}



?>
