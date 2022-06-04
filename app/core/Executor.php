<?php

class Executor {

	public static function doit($sql){

		$con = Database::getCon();
		if ($con->connect_errno) {
    		Module::errorLog('CDTAM0000', 'ERROR BD CONNECT',1,1,1); //angc (,1,1,1) cooregir error 
			exit();
		}else{
			$con->set_charset("utf8");
			$resultado = $con->query($sql);
			$temp = $resultado;
			$id_gen= $con->insert_id;
			if(!$resultado){
					Module::errorLog('CDTAM0001 ',$con->error,$sql,'lin:17', 'executor.php');
					exit();
			}
			Module::Logconsulta("succes"+$id_gen,$sql);
			Database::clearStoredResults();//mejoras jhobri
      		return array($temp,$id_gen);

				/* Usamos el resultado, asumiendo que, acto seguido, hemos terminado con él */

		}

	}
}
?>
