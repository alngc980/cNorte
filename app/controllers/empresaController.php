<?php

class empresaController
{
    public $default_layout = "layoutuser.php";
    public $cargando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

    public function obtenerOtrasEmpresasAction()
    {
        $empresa = new empresaData();
        // $datEmpresa = $empresa->getDatosMiEmpresa();
        // $datOtrasEmpresa = $empresa->getDatosOtrasEmpresa();
        $rep = $empresa->getDatosOtrasEmpresa();
        $myJSON = json_encode($rep);
        echo $myJSON;
    }

    public function AddEmpresaAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["Nombre"] != "" && $_POST["RazonSocial"] != "") {

                $nombreEmpresa = addslashes($_POST["Nombre"]);
                $razonSocial= addslashes($_POST["RazonSocial"]) ;

                $userDat = new empresaData();
                $valida = $userDat->AddEmpresa($nombreEmpresa, $razonSocial);

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

    public function UpdateEmpresaAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["idEmpresa"] != "" && $_POST["Nombre"] != "" && $_POST["RazonSocial"] != "") {

                $idEmpresa = $_POST["idEmpresa"];
                $nombreEmpresa = $_POST["Nombre"];
                $razonSocial= $_POST["RazonSocial"] ;

                $userDat = new empresaData();
                $valida = $userDat->UpdateEmpresa($idEmpresa, $nombreEmpresa, $razonSocial);

                if ($valida == true) {
                    $jsondata['success'] = true;
                    $jsondata['message'] = 'Actualización exitosa';
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

    public function deleteEmpresaAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["idEmpresa"] != "") {
                $userDat = new empresaData();
                $valida = $userDat->deleteEmpresa($_POST["idEmpresa"]);
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

    public function obtenerEmpresasIdAction()
    {
        $empresa = new empresaData();
        $rep = $empresa->getEmpresaXId($_POST["idEmpresa"]);
        $myJSON = json_encode($rep);
        echo $myJSON;
    }





}
