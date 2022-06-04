
<?php
include "core/Core.php";
include "core/View.php";
include "core/Module.php";
include "core/Database.php";
include "core/Model.php";
include "core/Executor.php";

include "core/Get.php";
include "core/Post.php";
include "core/Cookie.php";
include "core/Session.php";
include "core/LB.php";
include "core/class.phpmailer.php";
include "core/fpdf/fpdf.php";
include "core/fpdf/fpdf_protection.php";
include "core/fpdf/templates_fpdf.php";
include "core/Request.php";



set_error_handler('module::errorLog');

function __autoload($modelname){
	if(Model::exists($modelname)){
		include Model::getFullPath($modelname);
	}
}
?>
