<?php
class vehiculoController
{
    public $default_layout = "layoutuser.php";
    public $cargando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

    public function registroVehiculoAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["EMPRESA"] != "" && $_POST["TIPO_VEHICULO"] != "" && $_POST["PLACA"] != "") {

                $vehiculo = new empresavehiculoData();
                $vehiculo->nIdEmpresa = $_POST["EMPRESA"];
                $vehiculo->nTipo = $_POST["TIPO_VEHICULO"];
                $vehiculo->cPlaca = $_POST["PLACA"];

                $registrado = $vehiculo->add();

                if ($registrado == true) {
                    $jsondata['success'] = true;
                    $jsondata['message'] = 'Registro exitoso';
                } else {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'Intente registrar nuevamente';
                }
            } else {
                $jsondata['success'] = false;
                $jsondata['message'] = '¡Verificar!. Todos los campos son obligatorios';
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

    public function getVehiculosEmpresaIdAction()
    {
        $vehiculo = new empresavehiculoData();
        $rep =  $vehiculo->getVehiculosEmpresaId($_POST["idEmpresa"]);
        $myJSON = json_encode($rep);
        echo $myJSON;
    }


    // public function EliminarCargoAction()   //angc20210704
    // {
    //     $jsondata = array();
    //     if (!empty($_POST)) {
    //         if ($_POST["codigoCargo"] != "") {
    //             $userDat = new empresa_cargoData();
    //             $valida = $userDat->DeleteEmpresaCargo($_POST["codigoCargo"]);
    //             if ($valida == true) {
    //                 $jsondata['success'] = true;
    //                 $jsondata['message'] = 'Registro eliminado!';
    //             } else {
    //                 $jsondata['success'] = false;
    //                 $jsondata['message'] = 'Intente nuevamente';
    //             }
    //         } else {
    //             $jsondata['success'] = false;
    //             $jsondata['message'] = 'No dejar campos vacíos';
    //         }
    //     } else {
    //         $jsondata['success'] = false;
    //         $jsondata['message'] = 'Intente nuevamente, datos vacios ';
    //     }

    //     header('Content-type: application/json; charset=utf-8');
    //     $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);
    //     echo $val;
    //     exit();
    // }


    
}
