<?php

class cargosController
{
    public $default_layout = "layoutuser.php";
    public $cargando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';



    public function registroCargoAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["Empresa"] != "" && $_POST["Cargo"] != "") {

                $cargo = new empresa_cargoData();

                $cargo->nIdEmpresa = $_POST["Empresa"];
                $cargo->cCargo = $_POST["Cargo"];
                $valida = $cargo->add();

                if ($valida == true) {
                    $jsondata['success'] = true;
                    $jsondata['message'] = 'Registro exitoso';
                } else {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'Intente registrar nuevamente';
                }
            } else {
                $jsondata['success'] = false;
                $jsondata['message'] = 'No dejar campos vacíos';
            }
        } else {
            $jsondata['success'] = false;
            $jsondata['message'] = 'Intente registrar nuevamente, datos vacios';
        }

        header('Content-type: application/json; charset=utf-8');
        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);
        echo $val;
        exit();
    }


    public function EliminarCargoAction()   //angc20210704
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["codigoCargo"] != "") {
                $userDat = new empresa_cargoData();
                $valida = $userDat->DeleteEmpresaCargo($_POST["codigoCargo"]);
                if ($valida == true) {
                    $jsondata['success'] = true;
                    $jsondata['message'] = 'Registro eliminado!';
                } else {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'Intente nuevamente';
                }
            } else {
                $jsondata['success'] = false;
                $jsondata['message'] = 'No dejar campos vacíos';
            }
        } else {
            $jsondata['success'] = false;
            $jsondata['message'] = 'Intente nuevamente, datos vacios ';
        }

        header('Content-type: application/json; charset=utf-8');
        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);
        echo $val;
        exit();
    }


    public function obtenerCargosEmpresaIdAction()
    {
        $cargos = new empresa_cargoData();
        $rep =  $cargos->getCargosEmpresaId($_POST["idEmpresa"]);
        $myJSON = json_encode($rep);
        echo $myJSON;
    }


}
