<?php

class indexController
{
    public $default_layout = "layout.php";
    public $smsbot = "";
    public $nestadoDoi = 0;
    public $nestadoSMS = 0;
    public $nestadoCalendario = 0;
    public $creditocab = array();
    public $creditodet = array();
    public $codigo = "";
    public $nestado = 0;
    public $cargando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';
  
    public function indexAction()
    {
        $meta = array("title" => "SisInfo - Tec");
        View::render($this, "index/index", array("meta" => $meta));
    }

}
