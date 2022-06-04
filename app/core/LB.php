<?php


class LB {

	public function Lb(){
		$this->get = new Get();
		$this->post = new Post();
		$this->request = new Request();
		$this->cookie = new Cookie();
		$this->session = new Session();
		$this->default_controller ="index";
		$this->default_view ="index";
		
	}

	public function loadModule($module){

			if(!isset($_GET['module']))
			{
				if(isset($_GET["r"])){
					$d = explode("/", $_GET["r"]);
					if(count($d)!=2){
						echo $p= "Invalid R parameters";

							if(Session::exists("user_id")){
								
									
										Core::redir("./?r=user/verificaReprogramacion");
								
							}else{
									Module::errorLog(1,$p,"LB",21,"");
									Core::redir("./?r=index/index");
							}
					}else{

							if($d[0]!=""&&$d[1]!=""){
								$this->default_controller = $d[0];
								$this->default_view = $d[1];
							}

					}
				}
				$this->default_controller = $this->default_controller."Controller";
				if (!file_exists("app/controllers/".$this->default_controller.".php")){
					if(Session::exists("user_id")){
						
							Core::redir("./?r=user/verificaReprogramacion");
						
					}else{
							Module::errorLog(1,$p,"LB".$this->default_controller,45,"");
							Core::redir("./?r=index/index");
					}


				}else{
						require_once "app/controllers/".$this->default_controller.".php";
						$controller = new $this->default_controller;
						$method = $this->default_view."Action";
						if(method_exists($controller, $method)){
							
							$data = call_user_func(array($controller, $method));
						}else{
							$msg= "<b>".$method."</b> not found ind".$controller;

							if(Session::exists("user_id")){

										Core::redir("./?r=user/error");
							
									
							}else{
								Module::errorLog(1,$p,"LB".$msg,45,"");
									Core::redir("./?r=index/index");
							}
						}
					}

			}else{
				Module::errorLog(1,"ErorLB","LB",79,"");
				Core::redir("./?r=index/index");

			}

	}

}

?>
