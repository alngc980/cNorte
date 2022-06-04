<?php

class uunnController
{
    public $default_layout = "layoutuser.php";
    public $cargando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

    public function AddUUNNAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["Nombre"] != "") {

                $nombre = $_POST["Nombre"];

                $userDat = new uunnData();
                $valida = $userDat->AddUUNN($nombre);

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


    public function obtenerUUNNAction()
    {
        $uunn = new uunnData();
        $rep = $uunn->getUUNN();
        $myJSON = json_encode($rep);
        echo $myJSON;
    }

    public function obtenerUUNNIdAction()
    {
        $uunn = new uunnData();
        $rep = $uunn->getUUNNId($_POST["idUUNN"]);
        $myJSON = json_encode($rep);
        echo $myJSON;
    }


    public function UpdateUUNNAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["idUUNN"] != "" && $_POST["Nombre"] != "") {

                $id = $_POST["idUUNN"];
                $nombre = $_POST["Nombre"];

                $userDat = new uunnData();
                $valida = $userDat->updateUUNN($id, $nombre);

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

    public function deleteUUNNAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["idUUNN"] != "") {
                $userDat = new uunnData();
                $valida = $userDat->deleteUUNN($_POST["idUUNN"]);
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
}
