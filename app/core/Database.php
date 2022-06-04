<?php
/// evilnapsis.tk evilnaps 6RSk!IpTJ]vv
class Database {
	public static $db;
	public static $con;
	function Database(){
	//$this->user="root";$this->pass="";$this->host="localhost";$this->ddbb="gqouvkku_dbinterna";
	$this->user="gqouvkku_sitisafe";$this->pass="SitiS@fe123456";$this->host="23.111.160.170";$this->ddbb="gqouvkku_dbinterna";
	//$this->user="cavedyuser";$this->pass="123asd()CCJB11";$this->host="localhost";$this->ddbb="cavedy";
	//$this->user="minedeck_mduser";$this->pass="l00lapal00za";$this->host="localhost";$this->ddbb="minedeck_md";
	}

	function connect(){
		$con = new mysqli($this->host,$this->user,$this->pass,$this->ddbb);
		return $con;
	}

	public static function getCon(){
		if(self::$con==null && self::$db==null){
			self::$db = new Database();
			self::$con = self::$db->connect();
		}
		
		return self::$con;
	}
	//mejoras jhobri26
	public static function  clearStoredResults(){
		global $mysqli;
	
		do {
			 if ($res = self::$con->store_result()) {
			   $res->free();
			 }
			} while (self::$con->more_results() && self::$con->next_result());        
	
	}

}
?>
