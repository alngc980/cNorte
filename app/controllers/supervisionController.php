<?php

class supervisionController
{
    public $default_layout = "layoutuser.php";
    public $cargando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

    public function AddSupervisionAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["NombreSupervision"] != "") {

                $nombre = $_POST["NombreSupervision"];

                $userDat = new supervisionData();
                $valida = $userDat->addSupervision($nombre);

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




    public function obtenerTipoSupervisionAction()
    {
        $supervision = new supervisionData();
        $rep =  $supervision->getSupervision();
        $myJSON = json_encode($rep);
        echo $myJSON;
    }


    public function UpdateSupervisionAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["idSupervision"] != "" && $_POST["NombreSupervision"] != "") {

                $id = $_POST["idSupervision"];
                $nombre = $_POST["NombreSupervision"];

                $userDat = new supervisionData();
                $valida = $userDat->updateSupervisionId($id, $nombre);

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

    public function deleteSupervisionAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["idSuper"] != "") {
                $userDat = new supervisionData();
                $valida = $userDat->deleteSupervisionId($_POST["idSuper"]);
                if ($valida == true) {
                    $jsondata['success'] = true;
                    $jsondata['message'] = 'Registro eliminado!';
                } else {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'Intente nuevamente';
                }
            } else {
                $jsondata['success'] = false;
                $jsondata['message'] = 'Problemas en obtener el ID de la empresa';
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

    public function obtenerTipoSupervisionIdAction()
    {
        $empresa = new supervisionData();
        $rep = $empresa->getSupervisionId($_POST["idSuper"]);
        $myJSON = json_encode($rep);
        echo $myJSON;
    }
}
