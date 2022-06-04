<?php

class trabajadoresController
{
    public $default_layout = "layoutuser.php";
    public $smsbot = "";
    public $nestadoDoi = 0;
    public $nestadoSMS = 0;
    public $nestadoCalendario = 0;
    public $creditocab = array();
    public $cuser = array();
    public $creditodet = array();
    public $codigo = "";
    public $nestado = 0;
    public $nEstadoLogueo = 0;
    public $cCargo = "";
    public $cargando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';


    public function errorAction()
    {
        $meta = array("title" => "CONSORCIO NORTE | No encontrado");
        View::render($this, "user/error", array("meta" => $meta));
    }
    public function existeSesionAction()
    {
        if (Session::exists("user_id")) {
            $this->usuario = Session::get("user_id");
        } else {
            Module::errorLog(1, "verifcasesion", "user Controller", 1218, "");
            $this->processlogoutAction();
            Core::redir("./");
        }
    }
    public function processlogoutAction()
    {
        Session::delete("user_id");
        session_destroy();
        Core::redir("./");
    }

    //******************************   TRABAJADORES CONTROLLER - By TORE     ************************************/
    public function gestionAction()
    {
        $this->existeSesionAction();

        $empresa = new empresaData();
        $datOtrasEmpresa = $empresa->getDatosAllEmpresas();

        $persona = new personaData();
        $datPersonaEmpresa = $persona->getDatosPersona();

        $empresaCargos = new trabajadoresData();
        $datEmpresaCargos = $empresaCargos->getPersonalCargosEmpresa();

        $dataVista = array(
            "datOtrasEmpresa"  => $datOtrasEmpresa,
            "datPersonaEmpresa" => $datPersonaEmpresa,
            "datEmpresaCargos" => $datEmpresaCargos
        );

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Trabajadores | Gestión de Trabajadores", "menu" => 5, "newHeader" => "0");
        View::render($this, "employee/gestion", array("meta" => $meta, "dataVista" => $dataVista));
    }


    public function AddNewPersonaAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["NombrePersona"] != "" && $_POST["ApellidosPersona"] != "" && $_POST["DOIPersona"] != "") {

                $personaData = new personaData();

                $Nombres = $_POST["NombrePersona"];
                $cApellidos = $_POST["ApellidosPersona"];
                $cDoi =  $_POST["DOIPersona"];

                $validaPersona = $personaData->getByDni($cDoi);
                if ($validaPersona->nEstado == 1) {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'La persona ya existe';
                } else {
                    $valida = $personaData->addPersona($cDoi, $Nombres, $cApellidos);
                    if ($valida) {
                        $jsondata['success'] = true;
                        $jsondata['ruta'] = '?r=trabajadores/gestion';
                        $jsondata['message'] = 'Registro exitoso';
                    } else {
                        $jsondata['success'] = false;
                        $jsondata['message'] = 'Intente registrar nuevamente';
                    }
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

    public function AddNewPersonaEmpresaAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["idEmpresa"] != "" && $_POST["idCargo"] != "" && $_POST["idPersona"] != "") {

                $personaData = new trabajadoresData();

                $idEmpresa = $_POST["idEmpresa"];
                $idCargo = $_POST["idCargo"];
                $idPersona =  $_POST["idPersona"];

                //$validaPersona = $personaData->getByDni($cDoi);
                //if($validaPersona->nEstado == 1){
                //    $jsondata['success'] = false;
                //    $jsondata['message'] = 'La persona ya existe';
                //}else{
                $valida = $personaData->addTrabajador($idCargo, $idPersona);
                if ($valida) {
                    $jsondata['success'] = true;
                    $jsondata['ruta'] = '?r=trabajadores/gestion';
                    $jsondata['message'] = 'Registro exitoso';
                } else {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'Intente registrar nuevamente';
                }
                //}
            } else {
                $jsondata['success'] = false;
                $jsondata['message'] = 'Seleccione todas las opciones';
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

    public function obtenerCargoEmpresaAction()
    {
        $data = new trabajadoresData();
        $rep = $data->getCargosEmpresa($_POST["IdCargo"]);
        $myJSON = json_encode($rep);
        echo $myJSON;
    }

    public function AddNewResponsableAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["NombrePersona"] != "" && $_POST["ApellidosPersona"] != "" && $_POST["DOIPersona"] != "" && $_POST["Empresa"] != "") {

                $personaData = new personaData();
                $trabajadoData = new trabajadoresData();

                $Nombres = $_POST["NombrePersona"];
                $cApellidos = $_POST["ApellidosPersona"];
                $cDoi =  $_POST["DOIPersona"];
                $idEmpresa = $_POST["Empresa"];

                $validaPersona = $personaData->getByDni($cDoi);
                if ($validaPersona->nEstado == 1) {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'La persona ya existe';
                } else {
                    //$valida = $personaData->addPersona($cDoi, $Nombres, $cApellidos);
                    $valida = $personaData->addPersonaResponsable($cDoi, $Nombres, $cApellidos, $idEmpresa);
                    if ($valida) {
                        // if (                                     //COMENTA ANGC20210915

                        $jsondata['success'] = true;
                        $jsondata['message'] = 'Registro exitoso';
                            
                        //$getPersona = $personaData->getByDni($cDoi); //) {
                        //$idPersona = $getPersona->nId;
                        //$exito = $trabajadoData->addResponsable($idPersona, $idEmpresa);
                        //if ($exito == true) {
                        //    $jsondata['success'] = true;
                        //    $jsondata['message'] = 'Registro exitoso';
                        //} else {
                        //    $jsondata['success'] = false;
                        //    $jsondata['message'] = 'Intente registrar nuevamente';
                        //}
                        // }
                    } else {
                        $jsondata['success'] = false;
                        $jsondata['message'] = 'Intente registrar nuevamente';
                    }
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

    public function AddPersonaCargoEmpresaAction()
    {
        $jsondata = array();
        if (!empty($_POST)) {
            if (
                $_POST["NombrePersona"] != "" && $_POST["ApellidosPersona"] != "" &&
                $_POST["DOIPersona"] != "" && $_POST["Empresa"] != "" && $_POST["Cargo"]
            ) {

                $personaData = new personaData();
                $trabajadorData = new trabajadoresData();
                $cargoData = new empresa_cargoData();

                $Nombres = $_POST["NombrePersona"];
                $cApellidos = $_POST["ApellidosPersona"];
                $cDoi =  $_POST["DOIPersona"];
                $idEmpresa = $_POST["Empresa"];

                $validaPersona = $personaData->getByDni($cDoi);
                if ($validaPersona->nEstado == 1) {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'La persona ya existe';
                } else {
                    //$valida = $personaData->addPersona($cDoi, $Nombres, $cApellidos);
                    $valida = $personaData->addPersonaResponsable($cDoi, $Nombres, $cApellidos, $idEmpresa);
                    if ($valida) {
                        //$getPersona = $personaData->getByDni($cDoi);
                        $idPersona = $valida->nIdPersona;
                        //$exito = $trabajadorData->addResponsable($idPersona, $idEmpresa);

                        //Grabar si el cargo es nuevo
                        if (is_numeric($_POST["Cargo"])) {
                            $reg_trabajador = $trabajadorData->addTrabajador($_POST["Cargo"],  $idPersona);
                            if ($reg_trabajador == true) {
                                $jsondata['success'] = true;
                                $jsondata['message'] = 'Registro exitoso';
                            }else{
                                $jsondata['success'] = false;
                                $jsondata['message'] = 'Problemas con el registro del trabajador.';
                            }
                        } else {
                            $cargoData->nIdEmpresa = $_POST["Empresa"];
                            $cargoData->cCargo = $_POST["Cargo"];
                            $reg_cargo = $cargoData->add();

                            if ($reg_cargo == true) {
                                $reg_trabajador = $trabajadorData->addTrabajador($cargoData->getUltimoCargosEmpresaId($idEmpresa)->nId,  $idPersona);
                                if ($reg_trabajador == true) {
                                    $jsondata['success'] = true;
                                    $jsondata['message'] = 'Registro exitoso';
                                }else{
                                    $jsondata['success'] = false;
                                    $jsondata['message'] = 'Problemas con el registro del trabajador.';
                                }
                            }else{
                                $jsondata['success'] = false;
                                $jsondata['message'] = 'Problemas con el registro del cargo.';
                            }
                        }
                    } else {
                        $jsondata['success'] = false;
                        $jsondata['message'] = 'Problemas con el registro de la persona';
                    }
                }
            } else {
                $jsondata['success'] = false;
                $jsondata['message'] = '¡Verificar!. Todos los campos son obligatórios';
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

    public function getResponsablesAction()
    {
        $responsables = new personaData();
        $rep = $responsables->getDatosEmpleados($_POST["idEmpresa"]);
        $myJSON = json_encode($rep);
        echo $myJSON;
    }

    public function getEmpleadosCargoEmpresaAction()
    {
        $empleados = new cumplimientoData();
        $rep = $empleados->getEmpleadosIdEmpresa($_POST["idEmpresa"]);
        $myJSON = json_encode($rep);
        echo $myJSON;
    }

}
