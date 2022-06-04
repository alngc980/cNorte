<?php



class userController

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



    public function processloginAction()

    {

        $jsondata = array();

        $jsondata['success'] = true;

        $jsondata['message'] = 'Intente nuevamente';



        if ($_POST["idUser"] !== "" && $_POST["idPass"] !== "") {

            if ($user = personaData::getByDni($_POST["idUser"])) {

                if ($user->nEstado == "1") {

                    if (md5($_POST["idPass"]) == $user->cPassword) {

                        Session::set("user_id", $user->nId);

                        Session::set("name", $user->cNombres);

                        Session::set("bAdmin", $user->bAdmin);

                        Session::set("REMOTE_ADDR", $_SERVER['REMOTE_ADDR']);

                        Session::set("HTTP_USER_AGENT", $_SERVER['HTTP_USER_AGENT']);

                        $jsondata['success'] = true;

                        $jsondata['message'] = 'Iniciando sesión';

                        $jsondata['ruta'] = '?r=user/index';
                    } else {

                        $jsondata['success'] = false;

                        $jsondata['message'] = 'Contraseña incorrecta';

                        $jsondata['ruta'] = '';
                    }
                } else {

                    $jsondata['success'] = false;

                    $jsondata['message'] = 'usuario se encuentra desactivado o no es administrador' . $_POST["idUser"];

                    $jsondata['ruta'] = '';
                }
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'usuario no se encuentra registrado';

                $jsondata['ruta'] = '';
            }
        } else {

            $jsondata['success'] = false;

            $jsondata['message'] = 'error datos vacios';

            $jsondata['ruta'] = '';
        }



        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }

    public function onOFFAction()

    {

        $jsondata = array();

        if ($_POST["xUser"] != "") {

            if (Session::get("bAdmin") == 1) {

                $UltimoAdmin = $this->EsUltimoAdmin($_POST["xUser"]);

                if ($UltimoAdmin == true) {

                    $jsondata['success'] = false;

                    $jsondata['message'] = ' Debe quedar al menos un Administrador';
                } else {

                    if (strtoupper(Session::get("user_id")) != strtoupper($_POST["xUser"])) {

                        $jsondata['success'] = true;

                        $jsondata['message'] = 'Correcto';



                        $userDat = new personaData();

                        $userDat->onOFF($_POST["xUser"]);
                    } else {

                        $jsondata['success'] = false;

                        $jsondata['message'] = 'No puedes desactivar a tu propio usuario';
                    }
                }
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'Usted no es administrador';
            }
        } else {

            $jsondata['success'] = false;

            $jsondata['message'] = 'Intente Nuevamente';
        }

        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }

    public function onOFFRootAction()

    {

        $jsondata = array();

        $nIdUser = $_POST["xUser"];

        if ($nIdUser != "") {

            if (Session::get("bAdmin") == 1) {

                $UltimoAdmin = $this->EsUltimoAdmin($nIdUser);

                // $UltimoAdmin = false;

                if ($UltimoAdmin == true) {

                    $jsondata['success'] = false;

                    $jsondata['message'] = ' Debe quedar al menos un Administrador';
                } else {

                    if (strtoupper(Session::get("user_id")) != strtoupper($nIdUser)) {

                        $jsondata['success'] = true;

                        $jsondata['message'] = 'Correcto';



                        $userDat = new personaData();

                        $userDat->onOFFRoot($nIdUser);
                    } else {

                        $jsondata['success'] = false;

                        $jsondata['message'] = 'No puedes quitar el acceso de administrador a tu propio usuario';
                    }
                }
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'Usted no es administrador';
            }
        } else {

            $jsondata['success'] = false;

            $jsondata['message'] = 'Intente Nuevamente';
        }

        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }

    public function deleteUserAction()

    {

        $jsondata = array();

        if ($_POST["xUser"] != "") {

            if (Session::get("bAdmin") == 1) {

                if (Session::get("user_id") != $_POST["xUser"]) {

                    $jsondata['success'] = true;

                    $jsondata['message'] = 'Correcto';



                    $userDat = new personaData();

                    $userDat->deleteUser($_POST["xUser"]);
                } else {

                    $jsondata['success'] = false;

                    $jsondata['message'] = 'No puedes autoeliminarte';
                }
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'Usted no es administrador';
            }
        } else {

            $jsondata['success'] = false;

            $jsondata['message'] = 'Intente Nuevamente';
        }

        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }

    public function updPassAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["txtPass"] !== "" && $_POST["userPass"] !== "") {

                if ($user = personaData::getByUser(Session::get("user_id"))) {

                    if ($user->nEstado == 1) {

                        if (md5($_POST["txtPass"]) == $user->cPassword) {

                            $userDat = new personaData();

                            $newPass =  md5($_POST["userPass"]);

                            $user = Session::get("user_id");



                            $valida = $userDat->addUpdPass($user, $newPass);



                            if ($valida == true) {

                                $jsondata['success'] = true;

                                $jsondata['message'] = 'Se actualizó la contraseña';
                            } else {

                                $jsondata['success'] = false;

                                $jsondata['message'] = 'Intente registrar nuevamente';
                            }
                        } else {

                            $jsondata['success'] = false;

                            $jsondata['message'] = 'Contraseña incorrecta';

                            $jsondata['ruta'] = '';
                        }
                    } else {

                        $jsondata['success'] = false;

                        $jsondata['message'] = 'usuario se encuentra desactivado';

                        $jsondata['ruta'] = '';
                    }
                } else {

                    $jsondata['success'] = false;

                    $jsondata['message'] = 'usuario no encontrado';

                    $jsondata['ruta'] = '';
                }
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'Intente nuevamente, datos vacios';

                $jsondata['ruta'] = '';
            }
        } else {

            $jsondata['success'] = false;

            $jsondata['message'] = 'Intente nuevamente, datos vacios';
        }

        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }





    public function updateUserPersonAction()  //angc2021

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["userCodigo"] != "" && $_POST["userDoi"] != "" && $_POST["userNombre"] != ""  && $_POST["userApellido"] != "" && $_POST["userUser"] != "") {

                $sms = "";

                $userDat = new personaData();

                // if ($_POST["userNombre"] == Session::get("user_id")) {

                //     $userDat->nombre = $_POST["userName"];

                //     $userDat->dni =  $_POST["userDOI"];

                //     $userDat->user = $_POST["User"];

                //     $valida = $userDat->UpdUserAdmin();

                //     $sms = "Se actualizaron los datos, para actualziar su contraseña ingrese al enlace de seguridad";

                // } else {

                // if($_POST["userClave"]!="") {

                //     $pass = md5($_POST["userClave"]);

                // } else{

                //     $pass = "";

                // }

                $pass = md5($_POST["userClave"]);

                $codigo = $_POST["userCodigo"];

                $userDat->cDoi = $_POST["userDoi"];

                $userDat->cNombres =  $_POST["userNombre"];

                $userDat->cApellidos = $_POST["userApellido"];

                $userDat->cUsuario = $_POST["userUser"];

                $userDat->cPassword = $pass;



                $valida = $userDat->UpdUser($codigo);

                $sms = "Actualización exitosa";

                // }

                if ($valida == true) {

                    $jsondata['success'] = true;

                    $jsondata['message'] = $sms;
                } else {

                    $jsondata['success'] = false;

                    $jsondata['message'] = 'Intente actualizar nuevamente';
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



    // public function updateUserAction()

    // {

    //     $jsondata = array();

    //     if (!empty($_POST)) {

    //         if ($_POST["userName"] != "" && $_POST["User"] != "" && $_POST["userDOI"] != ""  && $_POST["userPass"] != "") {

    //             $sms = "";

    //             $userDat = new personaData();

    //             if ($_POST["User"] == Session::get("user_id")) {

    //                 $userDat->nombre = $_POST["userName"];

    //                 $userDat->dni =  $_POST["userDOI"];

    //                 $userDat->user = $_POST["User"];

    //                 $valida = $userDat->UpdUserAdmin();

    //                 $sms = "Se actualizaron los datos, para actualziar su contraseña ingrese al enlace de seguridad";

    //             } else {

    //                 $pass = md5($_POST["userPass"]);

    //                 $userDat->nombre = $_POST["userName"];

    //                 $userDat->dni =  $_POST["userDOI"];

    //                 $userDat->user = $_POST["User"];

    //                 $userDat->pass = $pass;

    //                 $valida = $userDat->UpdUser();

    //                 $sms = "Actulización exitosa";

    //             }



    //             if ($valida == true) {

    //                 $jsondata['success'] = true;

    //                 $jsondata['message'] = $sms;

    //             } else {

    //                 $jsondata['success'] = false;

    //                 $jsondata['message'] = 'Intente actualizar nuevamente';

    //             }

    //         } else {

    //             $jsondata['success'] = false;

    //             $jsondata['message'] = 'No dejar campos vacíos';

    //         }

    //     } else {

    //         $jsondata['success'] = false;

    //         $jsondata['message'] = 'Intente registrar nuevamente, datos vacios';

    //     }

    //     header('Content-type: application/json; charset=utf-8');

    //     $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

    //     echo $val;

    //     exit();

    // }



    public function DeleteUserPersAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["codigoUsuario"] != "") {

                $userDat = new personaData();



                $UltimoAdmin = $this->EsUltimoAdmin($_POST["codigoUsuario"]);

                if ($UltimoAdmin == true) {

                    $jsondata['success'] = false;

                    $jsondata['message'] = ' Debe quedar al menos un Administrador';
                } else {

                    $valida = $userDat->deleteUser($_POST["codigoUsuario"]);

                    if ($valida == true) {

                        $jsondata['success'] = true;

                        $jsondata['ruta'] = '?r=user/index';

                        $jsondata['message'] = 'Registro eliminado!';
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

            $jsondata['message'] = 'Intente registrar nuevamente, datos vacios ';
        }



        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }



    public function registroUserAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["userDOI"] != "" && $_POST["userPass"] != "") {



                $userDat = new personaData();



                $pass = md5($_POST["userPass"]);



                $userDat->cNombres = $_POST["userName"];

                $userDat->cApellidos = $_POST["LastName"];

                $userDat->cDoi =  $_POST["userDOI"];

                $userDat->cPassword = $pass;

                $valida = $userDat->add();



                if ($valida == true) {

                    $jsondata['success'] = true;

                    $jsondata['ruta'] = '?r=user/index';

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

    public function registroCargoAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["empresa"] != "" && $_POST["cargo"] != "") {



                $cargo = new empresa_cargoData();





                $cargo->nIdEmpresa = $_POST["empresa"];

                $cargo->cCargo = $_POST["cargo"];

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

    public function registroUmAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["empresa"] != "" && $_POST["tipo"] != "" && $_POST["placa"] != "") {



                $vehiculo = new empresavehiculoData();





                $vehiculo->nIdEmpresa = $_POST["empresa"];

                $vehiculo->nTipo = $_POST["tipo"];

                $vehiculo->cPlaca = $_POST["placa"];



                $valida = $vehiculo->add();



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

    public function registroNormaAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["empresa"] != "" && $_POST["control"] != "" && $_POST["observacion"] != "" && $_POST["codigo"] != "") {

                $norma = new empresa_normaData();

                $norma->empresa = $_POST["empresa"];

                $norma->control = $_POST["control"];

                $norma->observacion = $_POST["observacion"];

                $norma->codigo = $_POST["codigo"];



                $valida = $norma->add_obs();



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



    public function datNormaUpdAction()

    {

        $data = new empresa_normaData();

        $rep = $data->getNormaObs($_POST["xnIdNorma"]);

        $myJSON = json_encode($rep);

        echo $myJSON;
    }



    public function UpdateNormaAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["NormaId"] != "" && $_POST["Control"] != "" && $_POST["Valor"] != "" && $_POST["Observacion"] != "") {

                $norma = new empresa_normaData();

                $NormaId = $_POST["NormaId"];

                $Valor = $_POST["Valor"];

                $Observacion = $_POST["Observacion"];



                $valida = $norma->UpdateNormadb($NormaId, $Valor, $Observacion);



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



    public function EliminarNormaAction()   //angc20210704

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["codigoNorma"] != "") {

                $userDat = new empresa_normaData();

                $valida = $userDat->DeleteNorma($_POST["codigoNorma"]);

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



    public  function allEmpresaCargoAction()

    {

        $data = new empresa_cargoData();

        $rep = $data->getEmpresaCargo();

        $myJSON = json_encode($rep);

        echo $myJSON;
    }



    public function datCargoUpdAction()

    {

        $data = new empresa_cargoData();

        $rep = $data->getEmpresaCargoDat($_POST["xnIdCargo"]);

        $myJSON = json_encode($rep);

        echo $myJSON;
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



    public function CargoUpdAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["CargoId"] != "" && $_POST["Cargo"] != "") {

                $sms = "";

                $EmpresaCargo = new empresa_cargoData();



                $valida = $EmpresaCargo->UpdateEmpresaCargo($_POST["CargoId"], $_POST["Cargo"]);

                $sms = "Actualización exitosa";

                // }

                if ($valida == true) {

                    $jsondata['success'] = true;

                    $jsondata['message'] = $sms;
                } else {

                    $jsondata['success'] = false;

                    $jsondata['message'] = 'Intente actualizar nuevamente';
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





    public  function allUmAction()

    {

        $data = new empresavehiculoData();

        $rep = $data->getAll();

        $myJSON = json_encode($rep);

        echo $myJSON;
    }



    public function datUmUpdAction()

    {

        $data = new empresavehiculoData();

        $rep = $data->getDatUpd($_POST["xnIdUm"]);

        $myJSON = json_encode($rep);

        echo $myJSON;
    }



    public function UMUpdateAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["umId"] != "" && $_POST["Placa"] != "") {

                $sms = "";

                $EmpresaCargo = new empresavehiculoData();



                $valida = $EmpresaCargo->updateUm($_POST["umId"], $_POST["Placa"]);

                $sms = "Actualización exitosa";

                // }

                if ($valida == true) {

                    $jsondata['success'] = true;

                    $jsondata['message'] = $sms;
                } else {

                    $jsondata['success'] = false;

                    $jsondata['message'] = 'Intente actualizar nuevamente';
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





    public function EliminarUMAction()   //angc20210704

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["codigoUM"] != "") {

                $userDat = new empresavehiculoData();

                $valida = $userDat->DeleteUm($_POST["codigoUM"]);

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



    public  function allNormaAction()

    {

        $data = new empresa_normaData();

        $rep = $data->getAllNormasObs();

        $myJSON = json_encode($rep);

        echo $myJSON;
    }





    public function registroDocumentoAction()

    {
        $this->existeSesionAction();
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["KEYINFORME"] == "" && $_POST["programa"] != 0) {
                $documento = new informeData();
                $documento->nIdUserRegistro = Session::get("user_id"); // $datUsuario->nId;
                $documento->nIdPrograma = $_POST["programa"];
                $documento->nIdTarea = $_POST["tarea"];
                $documento->nIdTipoDocumento = $_POST["tipo"];
                $documento->nIdEmpresa =  $_POST["empresa"];
                $documento->nIdUUNN = $_POST["uunn"];
                $documento->nIdCargo = $_POST["cargo"];
                $documento->nIdResponsable = $_POST["responsable"];
                $documento->nIdSupervision = $_POST["supervision"];
                $documento->cActividad = addslashes($_POST["actividad"]);
                $documento->cObra  = addslashes($_POST["obra"]);
                $documento->cLugar = addslashes($_POST["lugar"]);
                $documento->cArea  = addslashes($_POST["area"]);
                $documento->nActa  = $_POST["acta"];
                $documento->cFecha  = $_POST["fecha"];
                $documento->cESAS  = $_POST["sasd"];

                $valida = $documento->add();

                $TotaSecc = 0;
                if ($documento->nIdTarea == 1 || $documento->nIdTarea == 2) {
                    $TotaSecc = 9;
                } else {
                    $TotaSecc = 4;
                }

                if ($valida == true) {
                    $jsondata['success'] = true;
                    $jsondata['ruta'] = '?r=user/DocumentoDetalle';
                    $jsondata['message'] = 'Registro exitoso';
                    $jsondata['datakey'] = $valida->IDKEY;
                    $jsondata['dataInicia'] = 1;
                    $jsondata['dataTotal'] = $TotaSecc; //falta trabajar
                } else {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'Intente registrar nuevamente sd' . $_POST["programa"];
                }
            } else if ($_POST["KEYINFORME"] != "" && $_POST["programa"] != 0 && ($_POST["KEYPROCESACAB"] == 2 || $_POST["KEYPROCESACAB"] == 3)) {
                $documento = new informeData();
                $documento->nId = $_POST["KEYINFORME"];
                $documento->nIdCargo = $_POST["cargo"];
                $documento->nIdResponsable = $_POST["responsable"];
                $documento->nIdSupervision = $_POST["supervision"];
                $documento->cActividad = $_POST["actividad"];
                $documento->cObra  = $_POST["obra"];
                $documento->cLugar = $_POST["lugar"];
                $documento->cArea  = $_POST["area"];
                $documento->nActa  = $_POST["acta"];
                $documento->cFecha  = $_POST["fecha"];

                $valida = $documento->update();

                $TotaSecc = 0;

                if ($_POST["tarea"] == 1 || $_POST["tarea"] == 2) {
                    $TotaSecc = 9;
                } else {
                    $TotaSecc = 4;
                }
                $ruta = "";
                if ($_POST["KEYPROCESACAB"] == 2) {
                    $ruta = "?r=user/DocumentoDetalle";
                } else if ($_POST["KEYPROCESACAB"] == 3) {
                    $ruta = "?r=user/documentoUpdate&doc=" . $_POST["KEYINFORME"];
                }
                if ($valida == true) {
                    $jsondata['success'] = true;
                    $jsondata['ruta'] = $ruta; //'?r=user/DocumentoDetalle';
                    $jsondata['message'] = 'Registro actualizado';
                    $jsondata['datakey'] = $_POST["KEYINFORME"];
                    $jsondata['dataInicia'] = 1;
                    $jsondata['dataTotal'] = $TotaSecc;
                } else {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'Intente registrar nuevamente sd' . $_POST["programa"];
                }
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



    public function DocumentoDetalleAction()
    {
        $this->existeSesionAction();
        $idInforme = $_REQUEST["datakey"];
        $nSeccion = $_REQUEST["dataInicia"];
        $nTotalSeccion = $_REQUEST["dataTotal"];
        if ($idInforme != "" && $nSeccion != "") {
            $bInicia = 1;
            $bFinaliza = 0;

            $informe = new informeData();
            $informe->nId =  $idInforme;

            $datInforme = $informe->getInformeById();

            $DatNumMostrar = $datInforme->nIdAux;

            $idTarea = $datInforme->nIdTarea;
            $tarea = new tareaData();
            $tarea->nId =  $idTarea;
            $datTarea = $tarea->getTareaById();

            $cumpliento = new cumplimientoData();
            $cumpliento->nIdTarea = $idTarea;

            if ($nSeccion == 0) {

                $datCumpliento =  $cumpliento->getCumplimientoInicia();
                $bInicia = 1;
            } else {
                $cumpliento->nOrden = $nSeccion;
                $datCumpliento = $cumpliento->getCumplimientoPosicion();
                $bInicia = 0;
                // exit;
            }

            if ($nSeccion == $nTotalSeccion) {
                $bFinaliza = 1;
            }

            $codigos   =  new codigosData();
            $codigos->cCodigo = $datCumpliento->nTipo;

            $dataCodigos = $codigos->getCodigos();
            $dataImcumplimineto =  $codigos->getCodigosNI(500);

            $cumpliento->nId = $datCumpliento->nId;
            $cumpliento->nOrden = $nSeccion;

            $cumplientoProx = $cumpliento->getCumplimientoProximo();
            $proximoCumpliento = $cumplientoProx->nOrden;
            //exit;
            $cumplientoRegistrados = new cumplimientoData();
            $cumplientoRegistrados->nIdInforme = $idInforme;

            $cumplientoRegistrados->nIdCumplimiento = $datCumpliento->nId;
            $datCumplientoRegistrados = $cumplientoRegistrados->getCumplimientosRegistrados();

            $cumplientoAnt = $cumpliento->getCumplimientoAnterior();
            $anteriorCumpliento =  $cumplientoAnt->nOrden;

            if ($nSeccion < $nTotalSeccion) {
                $dataVista = array(
                    "datakey" => $idInforme,
                    "dataTotal" => $nTotalSeccion,
                    "datTarea" => $datTarea,
                    "datCumpliento" => $datCumpliento,
                    "datImcumplimiento" => $dataImcumplimineto,
                    "dataCodigos" => $dataCodigos,
                    "nInicia" => $bInicia,
                    "nAnterior" => $anteriorCumpliento,
                    "nProximo" => $proximoCumpliento,
                    "dataTable" => $datCumplientoRegistrados,
                    "nFin" => $bFinaliza,
                    "NumInforme" => $DatNumMostrar
                );
                $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Documento | Detalle", "menu" => 3, "newHeader" => 0);
                View::render($this, "user/DocumentoDetalle", array("meta" => $meta, "dataVista" => $dataVista));
            } else {

                $informe = new informeData();
                $informe->nId =  $idInforme;
                $datInforme = $informe->getInformeById();

                $cumplientoRegistrados = new cumplimientoData();
                $cumplientoRegistrados->nIdInforme = $idInforme;

                $vehiculo = new tipo_vehiculoData();
                $datvehiculo = $vehiculo->getTipo_Vehiculo();
                $informe = new informeData();
                $informe->nId =  $idInforme;
    
                $datInforme = $informe->getInformeById();
    
                $DatNumMostrar = $datInforme->nIdAux;
    
                $idTarea = $datInforme->nIdTarea;
                if ($idTarea == 1) {
                    $datCumplientoRegistrados = $cumplientoRegistrados->getCumplimientosByInforme();
                }
                if ($idTarea == 3) {
                   
                //    $cumpliento = new cumplimientoData();
                 //   $datCumplientoRegistrados = $cumpliento->getCumplimientoInicia();
                }
                //$datEmpleados = $cumplientoRegistrados->getEmpleados();
                $datEmpleados = $cumplientoRegistrados->getEmpleadosIdEmpresa($datInforme->nIdEmpresa);
                $datNormas = $cumplientoRegistrados->getNormas();
                //$datVehiculos = $cumplientoRegistrados->getVehiculos();

                $datVehiculos = $cumplientoRegistrados->getVehiculosEmpresa($datInforme->nIdEmpresa);
                //$vehiculo = new empresavehiculoData();
                //$datVehiculos =  $vehiculo->getVehiculosEmpresaId($datInforme->nIdEmpresa);

                $dataVista = array(
                    "dataInforme" => $datInforme,
                    "dataVehiculo" => $datvehiculo,
                    "datakey" => $idInforme,
                    "dataTotal" => $nTotalSeccion,
                    "datTarea" => $datTarea,
                    "datCumpliento" => $datCumplientoRegistrados,
                    "dataCodigos" => $dataCodigos,
                    "nInicia" => $bInicia,
                    "nProximo" => $proximoCumpliento,
                    "datEmpleados" => $datEmpleados,
                    "datNormas" => $datNormas,
                    "dataTable" => $datCumplientoRegistrados,
                    "datVehiculos" => $datVehiculos,
                    "nFin" => $bFinaliza,
                    "NumInforme" => $DatNumMostrar
                );

                $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Documento | Detalle", "menu" => 3, "newHeader" => 0);
                View::render($this, "user/DocumentoDetalleRegister", array("meta" => $meta, "dataVista" => $dataVista));
            }
        } else if ($idInforme != "" && $nSeccion == "") {

            $informe = new informeData();
            $informe->nId =  $idInforme;
            $datInforme = $informe->getInformeById();

            $cumplientoRegistrados = new cumplimientoData();
            $cumplientoRegistrados->nIdInforme = $idInforme;

            $empresa = new empresaData();
            $datEmpresa = $empresa->getDatosMiEmpresa();
            $datOtrasEmpresa = $empresa->getDatosOtrasEmpresa();

            $tipo_documento = new tipo_documentoData();
            $datTipo_documento = $tipo_documento->getTipo_Documento();

            $tarea = new tareaData();
            $datTarea = $tarea->getTareas();

            $uunn = new uunnData();
            $datUUNN = $uunn->getUUNN();

            $supervision = new supervisionData();
            $datSupervision = $supervision->getSupervision();

            $programa = new programaData();
            $datPrograma = $programa->getProgramas();

            $datEmpleados = $cumplientoRegistrados->getEmpleadosIdEmpresa($datInforme->nIdEmpresa);
            $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Documecto | Actualizar", "menu" => 1, "newHeader" => "1");

            $dataVista = array(
                "KeyProcesaCab" => 2,
                "datTipo_documento" => $datTipo_documento,
                "datTarea" => $datTarea,
                "datOtrasEmpresa" => $datOtrasEmpresa,
                "datUUNN" => $datUUNN,
                "datPrograma" => $datPrograma,
                "datSupervision" => $datSupervision,
                "datInforme" => $datInforme,
            );
            //aqui
            //View::render($this, "user/registerDocumento", array("meta" => $meta, "datEmpresa" => $datEmpresa, "dataVista" => $dataVista));
            View::render($this, "user/registerDocumento", array("meta" => $meta, "datEmpresa" => $datEmpresa, "dataVista" => $dataVista));
        }
    }




    public function registroDocumentoDetalleAction()
    {

        $this->existeSesionAction();

        $jsondata = array();

        if (!empty($_POST)) {



            $documentodes = new inf_cumplimiento_desData();

            $documentodes->nId = $_POST["keycumplimiento"];

            $documentodes->nIdInforme = $_POST["informe"];

            $documentodes->nIdCumplimiento = $_POST["cumplimiento"];

            $documentodes->nValor = $_POST["tipo"];
            if ($_POST["tipo"] == 2 or $_POST["tipo"] == 5) {
                $documentodes->nInc = $_POST["motivo"];
            } else {
                $documentodes->nInc = 0;
            }

            $documentodes->cDescripcion = $_POST["detalle"];



            $mensaje  = "";

            if ($_POST["keycumplimiento"] == 0) {

                $valida = $documentodes->add();

                $mensaje = "Registro exitoso";
            } else {



                $valida = $documentodes->Update();

                $mensaje = "Actualización exitoso";
            }



            //$valida = $documentodes->add();



            $datosRegistros = new cumplimientoData();

            $datosRegistros->nIdInforme = $_POST["informe"];

            $datosRegistros->nIdCumplimiento = $_POST["cumplimiento"];

            $datDatosRegistros = $datosRegistros->getCumplimientosRegistrados();



            if ($valida == true) {

                $jsondata['success'] = true;

                $jsondata['message'] = $mensaje;

                $jsondata['data'] = $datDatosRegistros;
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'Intente registrar nuevamente';
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
    public function updateDocumentoDetalleAction()
    {

        $this->existeSesionAction();

        $jsondata = array();

        if (!empty($_POST)) {

            $documentodes = new inf_cumplimiento_desData();

            $documentodes->nId = $_POST["cumplimiento"];

            $documentodes->nIdInforme = $_POST["informe"];

            $documentodes->nIdCumplimiento = $_POST["cumplimiento"];

            $documentodes->nValor = $_POST["tipo"];
            if ($_POST["tipo"] == 2 or $_POST["tipo"] == 5) {
                $documentodes->nInc = $_POST["motivo"];
            } else {
                $documentodes->nInc = 0;
            }

            $documentodes->cDescripcion = $_POST["detalle"];



            $mensaje  = "";


            $valida = $documentodes->Update();

            $mensaje = "Actualización exitoso";

            //$valida = $documentodes->add();

            $datosRegistros = new cumplimientoData();

            $datosRegistros->nIdInforme = $_POST["informe"];

            $datosRegistros->nIdCumplimiento = $_POST["cumplimiento"];

            $datDatosRegistros = $datosRegistros->getCumplimientosRegistrados();



            if ($valida == true) {

                $jsondata['success'] = true;

                $jsondata['message'] = $mensaje;

                $jsondata['data'] = $datDatosRegistros;
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'Intente registrar nuevamente';
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


    public function DeleteCumplimientoAction()

    {

        $this->existeSesionAction();

        $jsondata = array();

        if (!empty($_POST)) {

            $documentodes = new inf_cumplimiento_desData();

            $documentodes->nId = $_POST["keyCumplimiento"];

            $valida = $documentodes->delete();



            $datosRegistros = new cumplimientoData();

            $datosRegistros->nIdInforme = $_POST["informe"];

            $datosRegistros->nIdCumplimiento = $_POST["cumplimiento"];

            $datDatosRegistros = $datosRegistros->getCumplimientosRegistrados();



            if ($valida == true) {

                $jsondata['success'] = true;

                $jsondata['message'] = 'Registro Eliminado';

                $jsondata['data'] = $datDatosRegistros;
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'Intente registrar nuevamente';
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







    public function registroDocumentoDetalleTSAction()

    {

        $this->existeSesionAction();

        $jsondata = array();

        if (!empty($_POST)) {



            $documentodes = new inf_cumplimiento_desData();

            $documentodes->nIdInforme = $_POST["informe"];

            $documentodes->nIdCumplimiento = $_POST["cumplimiento"];

            $documentodes->nValor = $_POST["tipo"];

            $documentodes->cDescripcion = $_POST["norma"];

            $valida = $documentodes->add_otro(2);





            if ($valida == true) {

                $jsondata['success'] = true;

                $jsondata['message'] = 'Registro exitoso';
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'Intente registrar nuevamente';
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

    public function registroDocumentoDetalleUMAction()

    {

        $this->existeSesionAction();

        $jsondata = array();

        if (!empty($_POST)) {



            $documentodes = new inf_cumplimiento_desData();

            $documentodes->nIdInforme = $_POST["informe"];

            $documentodes->nIdCumplimiento = $_POST["cumplimiento"];

            $documentodes->nValor = $_POST["tipo"];

            $documentodes->cDescripcion = $_POST["norma"];

            $valida = $documentodes->add_otro(1);



            if ($valida == true) {

                $jsondata['success'] = true;

                $jsondata['message'] = 'Registro exitoso';
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = 'Intente registrar nuevamente';
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

    public function obtieneDetalleCumpliminetoAction()
    {
        $this->existeSesionAction();
        $jsondata = array();
        if (!empty($_POST)) {
            if ($_POST["keyModalidad"] == 1) {
                $datosRegistros = new cumplimientoData();
                $datosRegistros->nIdInforme = $_POST["keyInforme"];
                $datosRegistros->nIdCumplimiento = $_POST["keyCumplimiento"];
                $datDatosRegistros = $datosRegistros->getCumplimientosRegistrados();

                if ($datDatosRegistros == true) {
                    $jsondata['success'] = true;
                    $jsondata['message'] = 'Se obtuvieron los datos';
                    $jsondata['data'] = $datDatosRegistros;
                } else {
                    $jsondata['success'] = false;
                    $jsondata['message'] = 'No se encontraron datos';
                }
            } else {
                $informe = new informeData();
                switch ($_POST["keyCumplimiento"]){
                    case 10:
                        $dataTra = $informe->getTrabajadoresSupervisadosInforme($_POST["keyInforme"]);
                        if ($dataTra == true) {
                            $jsondata['success'] = true;
                            $jsondata['message'] = 'Se obtuvieron los datos con éxito';
                            $jsondata['detalle'] = $dataTra;
                        } else {
                            $jsondata['success'] = false;
                            $jsondata['message'] = 'No se encontraron datos de los trabajadores supervisados';
                        }
                        break;
                    case 11:
                        $dataTra = $informe->getUnidadesMovilesSupervisadosInforme($_POST["keyInforme"]);
                        if ($dataTra == true) {
                            $jsondata['success'] = true;
                            $jsondata['message'] = 'Se obtuvieron los datos con éxito';
                            $jsondata['detalle'] = $dataTra;
                        } else {
                            $jsondata['success'] = false;
                            $jsondata['message'] = 'No se encontraron datos de los vehículos registrados';
                        }  
                        break;
                    case 22:
                        $datosRegistros = new cumplimientoData();
                        $datosRegistros->nIdInforme = $_POST["keyInforme"];
                        $datosRegistros->nIdCumplimiento = $_POST["keyCumplimiento"];
                        $datDatosRegistros = $datosRegistros->getCumplimientosRegistrados();
        
                        if ($datDatosRegistros == true) {
                            $jsondata['success'] = true;
                            $jsondata['message'] = 'Se obtuvieron los datos';
                            $jsondata['data'] = $datDatosRegistros;
                        } else {
                            $jsondata['success'] = false;
                            $jsondata['message'] = 'No se encontraron datos';
                        } 
                        break;
                }
               
            }
        } else {
            $jsondata['success'] = false;
            $jsondata['message'] = 'Ocurrio un error, intente nuevamente';
        }

        header('Content-type: application/json; charset=utf-8');
        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);
        echo $val;
        exit();
    }



    public function EliminarInformeAction()   //angc20210704

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["codigoInforme"] != "") {

                $userDat = new informeData();

                $valida = $userDat->DeleteInforme($_POST["codigoInforme"]);

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



    public function EliminarTrabajadorSupervisadoAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["idTrabajadorSupervisado"] != "") {

                $trabajadorSupervisado = new informeData();

                $trabajadorSupervisado->nId = $_POST["idTrabajadorSupervisado"];

                $valida = $trabajadorSupervisado->DeleteInfoTrabajadorSupervisado();

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



    public function EliminarInfoVehiculoInformeAction()

    {

        $jsondata = array();

        if (!empty($_POST)) {

            if ($_POST["Id"] != "") {

                $vehiculo = new informeData();

                $vehiculo->nId = $_POST["Id"];

                $valida = $vehiculo->DeleteInfoVehiculoInforme();

                if ($valida == true) {

                    $jsondata['success'] = true;

                    $jsondata['message'] = 'Registro eliminado';
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



    // public function gurdarDatosAction()

    // {

    //     $jsondata = array();

    //     $jsondata['success'] = false;

    //     $jsondata['message'] = '...';



    //     if (!empty($_POST)) {

    //         if ($_POST["dataadd"] <> "") {

    //             clienteData::guardarResultado(

    //                 $_POST['idphpTipo'],

    //                 $_POST['plataforma'],

    //                 $_POST['Ipdis'],

    //                 $_POST['latitude'],

    //                 $_POST['longitude'],

    //                 $_POST['dataadd'],

    //                 $_POST['coderror']

    //             );

    //         }

    //     }



    //     header('Content-type: application/json; charset=utf-8');

    //     $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

    //     echo $val;

    // }



    public function reporteHomeAction()

    {

        $data = new personaData();

        $rep = $data->reporte();

        $myJSON = json_encode($rep);

        echo $myJSON;
    }

    public function datUserAction()

    {

        $data = new personaData();

        // $rep = $data->datUser(strtoupper(Session::get("user_id")));

        $valor = Session::get("user_id");

        $rep = $data->datUser($valor);

        $myJSON = json_encode($rep);

        echo $myJSON;
    }

    public function datUserUpdAction() //ANGC-CARGA
    {
        $this->existeSesionAction();
        $data = new personaData();
        $rep = $data->datUser($_POST["xUser"]);
        $myJSON = json_encode($rep);
        echo $myJSON;
    }



    public function EsUltimoAdmin($nIdUser)      //ANGC-CARGA

    {

        $this->existeSesionAction();

        $data = new personaData();

        $rep = $data->EsultimoAdminQ($nIdUser);



        $total = $rep->Cant;

        if ($total == 1) {

            return true;
        } else {

            return false;
        }
    }



    // public function obtenerNuevoUserAction()

    // {

    //     $data = new personaData();

    //     $rep = $data->newUserCod();

    //     $myJSON = json_encode($rep);

    //     echo $myJSON;

    // }





    public function allUserAction()

    {

        $data = new personaData();

        $rep = $data->allUser(Session::get("user_id"));

        $myJSON = json_encode($rep);

        echo $myJSON;
    }

    public function indexAction()

    {

        $this->existeSesionAction();

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Inicio", "menu" => 1, "newHeader" => 1);
    
        View::render($this, "user/index", array("meta" => $meta));
    }

    public function documentoAction()

    {

        $this->existeSesionAction(); //ANGC
        $user = Session::get("user_id");
        $informe = new informeData();

        $datInforme = $informe->getDatosInforme($user);



        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Documentos", "menu" => 3, "newHeader" => 0);



        $dataVista = array("datInforme" => $datInforme);

        View::render($this, "user/documento", array("meta" => $meta, "dataVista" => $dataVista));
    }





    public function NuevoAction()

    {

        $this->existeSesionAction();

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Inicio | Nuevo usuario", "menu" => 1, "newHeader" => 0);

        View::render($this, "user/registerPersona", array("meta" => $meta));
    }



    public function graficoAction()

    {

        $inf = new informeData();

        $inf->nId = $_REQUEST["idKey"];

        if ($_REQUEST["idKey"] != "") {

            $rep = $inf->getGrafico();

            $myJSON = json_encode($rep);

            echo $myJSON;
        } else {

            echo "jb";
        }
    }

    public function obtineDatosModalAction()
    {

        $this->existeSesionAction();

        $jsondata = array();

        $idInforme = $_POST["keyInforme"];

        $nSeccion = $_POST["keyCumplimiento"];


        if ($idInforme != "") {

            $informe = new informeData();

            $informe->nId =  $idInforme;

            $datInforme = $informe->getInformeById();

            $idTarea = $datInforme->nIdTarea;

            $tarea = new tareaData();

            $tarea->nId =  $idTarea;

            $datTarea = $tarea->getTareaById();


            $cumpliento = new cumplimientoData();

            $cumpliento->nIdTarea = $idTarea;


            $cumpliento->nId = $nSeccion;

            $datCumpliento = $cumpliento->getCumplimientoById();


            $codigos   =  new codigosData();

            $codigos->cCodigo = $datCumpliento->nTipo;

            $dataCodigos = $codigos->getCodigos();

            $cumpliento->nId = $datCumpliento->nId;

            $cumpliento->nOrden = $nSeccion;


            $dataVista = array(

                "datTarea" => $datTarea,

                "datCumpliento" => $datCumpliento,

                "dataCodigos" => $dataCodigos,


            );

            $jsondata['success'] = true;

            $jsondata['message'] = 'Se obtuvieron los datos';

            $jsondata['data'] = $dataVista;
        } else {

            $jsondata['success'] = false;

            $jsondata['message'] = 'Ocurrio un error';

            $jsondata['data'] = null;
        }

        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }
    public function obtineDatosModalUpdateAction()
    {

        $this->existeSesionAction();

        $jsondata = array();

        $idInforme = $_POST["keyInforme"];

        $nKeyDes = $_POST["keyCumplimientoDes"];


        if ($idInforme != "") {

            $informe = new informeData();

            $informe->nId =  $idInforme;

            $datInforme = $informe->getInformeById();

            $cumplientodes = new inf_cumplimiento_desData();

            $cumplientodes->nId = $nKeyDes;

            $datCumplientodes = $cumplientodes->getCumplimientoDesById();

            $cumplimineto   =  new cumplimientoData();

            $cumplimineto->nId = $datCumplientodes->nIdCumplimiento;

            $dataPreCodigos = $cumplimineto->getCumplimientoByOnlyId();

            $codigos = new codigosData();
            $codigos->nIdInicia = $dataPreCodigos->nTipo;
            $codigos->nValor = $datCumplientodes->nValor;
            $dataCodigos = $codigos->getCodigosModal();





            $dataVista = array(

                "datTarea" => $dataPreCodigos,

                "datCumpliento" => $dataPreCodigos,

                "dataCodigos" => $dataCodigos,

                "dataDescripcion" => $datCumplientodes


            );

            $jsondata['success'] = true;

            $jsondata['message'] = 'Se obtuvieron los datos';

            $jsondata['data'] = $dataVista;
        } else {

            $jsondata['success'] = false;

            $jsondata['message'] = 'Ocurrio un error';

            $jsondata['data'] = null;
        }

        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }
    public function documentoUpdateAction()
    {
        $this->existeSesionAction(); //ANGC
        $idInforme = $_GET["doc"];
        if ($idInforme != "") {
            $informe = new informeData();
            $informe->nId =  $idInforme;
            $datInforme = $informe->getInformeById();

            $DatNumMostrar = $datInforme->nIdAux;
            $idTarea = $datInforme->nIdTarea;

            $tarea = new tareaData();
            $tarea->nId =  $idTarea;
            $datTarea = $tarea->getTareaById();

            $vehiculo = new tipo_vehiculoData();
            $datvehiculo = $vehiculo->getTipo_Vehiculo();

            $cumplientoRegistrados = new cumplimientoData();
            $cumplientoRegistrados->nIdInforme = $idInforme;
            $datCumplientoRegistrados = $cumplientoRegistrados->getCumplimientosByInforme();

            $datEmpleados = $cumplientoRegistrados->getEmpleadosIdEmpresa($datInforme->nIdEmpresa);
            $datNormas = $cumplientoRegistrados->getNormas();

            $datVehiculos = $cumplientoRegistrados->getVehiculosEmpresa($datInforme->nIdEmpresa);

            $codigos   =  new codigosData();
            $dataImcumplimineto =  $codigos->getCodigosNI(500);
            $dataVista = array(
                "datakey" => $idInforme,
                "dataVehiculo" => $datvehiculo,
                "dataInforme" => $datInforme,
                "datCumpliento" => $datCumplientoRegistrados,
                "datTarea" => $datTarea,
                "datEmpleados" => $datEmpleados,
                "datNormas" => $datNormas,
                "datVehiculos" => $datVehiculos,
                "NumInforme" => $DatNumMostrar,
                "datImcumplimiento" => $dataImcumplimineto
            );
            $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Documentos", "menu" => 3, "newHeader" => 0);

            View::render($this, "user/DocumentoDetalleUpdate", array("meta" => $meta, "dataVista" => $dataVista));
        } else {
            Core::redir("./?r=user/index");
        }
    }

    public function documentoResumenAction()

    {

        $this->existeSesionAction(); //ANGC

        $idInforme = $_GET["doc"];



        if ($idInforme != "") {





            $informe = new informeData();

            $informe->nId =  $idInforme;

            $datInforme = $informe->getInformeDatos();





            $datInformeX = $informe->getInformeById();



            $DatNumMostrar = $datInformeX->nIdAux;



            $dataVista = array(

                "datakey" => $idInforme,

                "datInforme" => $datInforme,

                "NumInforme" => $DatNumMostrar



            );

            $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Documentos", "menu" => 3, "newHeader" => 0);



            View::render($this, "user/DocumentoResumen", array("meta" => $meta, "dataVista" => $dataVista));
        } else {

            Core::redir("./?r=user/index");
        }
    }

    public function UploadArchivoSegAction()
    {

        $jsondata = array();

        if (!empty($_FILES['images'])) {

            $informeImg = new informeData();

            // File upload configuration

            $targetDir = "uploads/" . $_REQUEST["informe"];

            if (!file_exists($targetDir)) {

                mkdir($targetDir, 0777, true);
            }

            $targetDir = $targetDir . '/' . $_REQUEST["cumplimiento"] . "/";

            //$targetDir = $targetDir . '/' . $_REQUEST["cumplimiento"];

            if (!file_exists($targetDir)) {

                mkdir($targetDir, 0777, true);
            }

            $allowTypes = array('jpg', 'png', 'jpeg', 'gif');



            $max_ancho = 600;

            $max_alto = 600;



            $images_arr = array();

            foreach ($_FILES['images']['name'] as $key => $val) {

                $image_name = $_FILES['images']['name'][$key];

                $tmp_name   = $_FILES['images']['tmp_name'][$key];

                $size       = $_FILES['images']['size'][$key];

                $type       = $_FILES['images']['type'][$key];

                $error      = $_FILES['images']['error'][$key];



                // File upload path

                $fileName = basename($_FILES['images']['name'][$key]);

                $targetFilePath = $targetDir . $fileName;



                // Check whether file type is valid

                $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION);

                if (in_array($fileType, $allowTypes)) {

                    //$medidasimagen= getimagesize($_FILES['images']['tmp_name'][$key]);

                    $medidasimagen = getimagesize($tmp_name);

                    if ($medidasimagen[0] < 1280 && $size < 100000) {

                        if (move_uploaded_file($tmp_name, $targetFilePath)) {

                            $images_arr[] = $targetFilePath;



                            $idInforme = $_REQUEST["informe"];
                            $nSeccion = $_REQUEST["cumplimiento"];



                            $informeImg->key = $idInforme;

                            $informeImg->nSeccion = $nSeccion;

                            $informeImg->cRuta = $targetFilePath;

                            $informeImg->cName = $fileName;

                            $informeImg->AddImagenes();

                            $data = $informeImg->getImagenes();
                        }
                    } else {

                        $nombrearchivo = $image_name;

                        //Redimensionar

                        $rtOriginal = $tmp_name;



                        if ($type == 'image/jpeg') {

                            $original = imagecreatefromjpeg($rtOriginal);
                        } else if ($type == 'image/png') {

                            $original = imagecreatefrompng($rtOriginal);
                        } else if ($type == 'image/gif') {

                            $original = imagecreatefromgif($rtOriginal);
                        }





                        list($ancho, $alto) = getimagesize($rtOriginal);



                        $x_ratio = $max_ancho / $ancho;

                        $y_ratio = $max_alto / $alto;





                        if (($ancho <= $max_ancho) && ($alto <= $max_alto)) {

                            $ancho_final = $ancho;

                            $alto_final = $alto;
                        } elseif (($x_ratio * $alto) < $max_alto) {

                            $alto_final = ceil($x_ratio * $alto);

                            $ancho_final = $max_ancho;
                        } else {

                            $ancho_final = ceil($y_ratio * $ancho);

                            $alto_final = $max_alto;
                        }

                        $lienzo = imagecreatetruecolor($ancho_final, $alto_final);

                        imagecopyresampled($lienzo, $original, 0, 0, 0, 0, $ancho_final, $alto_final, $ancho, $alto);

                        //imagedestroy($original);

                        $cal = 8;

                        if ($type == 'image/jpeg') {

                            imagejpeg($lienzo, $targetFilePath);
                        } else if ($type == 'image/png') {

                            imagepng($lienzo, $targetFilePath);
                        } else if ($type == 'image/gif') {

                            imagegif($lienzo, $targetFilePath);
                        }



                        $images_arr[] = $targetFilePath;



                        $idInforme = $_REQUEST["informe"];

                        $nSeccion = $_REQUEST["cumplimiento"];



                        $informeImg->key = $idInforme;

                        $informeImg->nSeccion = $nSeccion;

                        $informeImg->cRuta = $targetFilePath;

                        $informeImg->cName = $fileName;

                        $informeImg->AddImagenes();

                        $data = $informeImg->getImagenes();
                    }
                }
            }

            // Generate gallery view of the images

            if (!empty($images_arr)) {

                $jsondata['success'] = true;

                $jsondata['message'] = 'correcto';

                $jsondata['data'] = $data;
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = "Error";

                $jsondata['data'] = "";
            }
        }



        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }
    public function cargarArchivoSegAction()
    {

        $jsondata = array();



        $informeImg = new informeData();

        $idInforme = $_REQUEST["informe"];

        $nSeccion = $_REQUEST["cumplimiento"];


        $informeImg->key = $idInforme;

        $informeImg->nSeccion = $nSeccion;


        $data = $informeImg->getImagenes();


        $jsondata['success'] = true;
        $jsondata['message'] = 'correcto';
        $jsondata['data'] = $data;


        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }
    public function DeleteImagenCumplimientoAction()
    {

        $jsondata = array();


        $informeImg = new informeData();
        $nId = $_REQUEST["nIdImg"];
        $nSeccion = $_REQUEST["nIdInforme"];


        $informeImg->key = $nId;
        $informeImg->nIdInforme = $nSeccion;
        $data = $informeImg->delImagenes();


        $jsondata['success'] = true;
        $jsondata['message'] = 'se eliminó la imagen';



        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }



    public function UploadArchivoActaAction()

    {

        $jsondata = array();

        if (!empty($_FILES['images'])) {

            $informeImg = new informeData();

            // File upload configuration

            $targetDir = "uploads/" . $_REQUEST["informe"];

            if (!file_exists($targetDir)) {

                mkdir($targetDir, 0777, true);
            }

            //$targetDir = $targetDir . '/' . $_REQUEST["cumplimiento"] . "/";

            $targetDir = $targetDir . '/' . $_REQUEST["cumplimiento"];

            if (!file_exists($targetDir)) {

                mkdir($targetDir, 0777, true);
            }

            $allowTypes = array('jpg', 'png', 'jpeg', 'gif');



            $max_ancho = 600;

            $max_alto = 600;



            $images_arr = array();

            foreach ($_FILES['images']['name'] as $key => $val) {

                $image_name = $_FILES['images']['name'][$key];

                $tmp_name   = $_FILES['images']['tmp_name'][$key];

                $size       = $_FILES['images']['size'][$key];

                $type       = $_FILES['images']['type'][$key];

                $error      = $_FILES['images']['error'][$key];



                // File upload path

                $fileName = basename($_FILES['images']['name'][$key]);

                $targetFilePath = $targetDir . $fileName;



                // Check whether file type is valid

                $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION);

                if (in_array($fileType, $allowTypes)) {

                    //$medidasimagen= getimagesize($_FILES['images']['tmp_name'][$key]);

                    $medidasimagen = getimagesize($tmp_name);

                    if ($medidasimagen[0] < 1280 && $size < 100000) {

                        if (move_uploaded_file($tmp_name, $targetFilePath)) {

                            $images_arr[] = $targetFilePath;



                            $idInforme = $_REQUEST["informe"];
                            $nSeccion = $_REQUEST["cumplimiento"];

                            $informeImg->key = $idInforme;

                            $informeImg->nSeccion = $nSeccion;

                            $informeImg->cRuta = $targetFilePath;

                            $informeImg->cName = $fileName;

                            $informeImg->AddImagenes();

                            $data = $informeImg->getImagenes();
                        }
                    } else {

                        $nombrearchivo = $image_name;

                        //Redimensionar

                        $rtOriginal = $tmp_name;



                        if ($type == 'image/jpeg') {

                            $original = imagecreatefromjpeg($rtOriginal);
                        } else if ($type == 'image/png') {

                            $original = imagecreatefrompng($rtOriginal);
                        } else if ($type == 'image/gif') {

                            $original = imagecreatefromgif($rtOriginal);
                        }





                        list($ancho, $alto) = getimagesize($rtOriginal);



                        $x_ratio = $max_ancho / $ancho;

                        $y_ratio = $max_alto / $alto;





                        if (($ancho <= $max_ancho) && ($alto <= $max_alto)) {

                            $ancho_final = $ancho;

                            $alto_final = $alto;
                        } elseif (($x_ratio * $alto) < $max_alto) {

                            $alto_final = ceil($x_ratio * $alto);

                            $ancho_final = $max_ancho;
                        } else {

                            $ancho_final = ceil($y_ratio * $ancho);

                            $alto_final = $max_alto;
                        }



                        $lienzo = imagecreatetruecolor($ancho_final, $alto_final);



                        imagecopyresampled($lienzo, $original, 0, 0, 0, 0, $ancho_final, $alto_final, $ancho, $alto);



                        //imagedestroy($original);



                        $cal = 8;



                        if ($type == 'image/jpeg') {

                            imagejpeg($lienzo, $targetFilePath);
                        } else if ($type == 'image/png') {

                            imagepng($lienzo, $targetFilePath);
                        } else if ($type == 'image/gif') {

                            imagegif($lienzo, $targetFilePath);
                        }



                        $images_arr[] = $targetFilePath;



                        $idInforme = $_REQUEST["informe"];
                        $nSeccion = $_REQUEST["cumplimiento"];

                        $informeImg->key = $idInforme;

                        $informeImg->nSeccion = $nSeccion;

                        $informeImg->cRuta = $targetFilePath;

                        $informeImg->cName = $fileName;

                        $informeImg->AddImagenes();

                        $data = $informeImg->getImagenes();
                    }
                }
            }

            // Generate gallery view of the images

            if (!empty($images_arr)) {

                $jsondata['success'] = true;

                $jsondata['message'] = 'correcto';

                $jsondata['data'] = $data;
            } else {
                $informeImg2 = new informeData();
                $informeImg2->key = $_REQUEST["informe"];
                $informeImg2->nSeccion = 21;
                $data = $informeImg2->getImagenes();


                $jsondata['success'] = false;

                $jsondata['message'] = "Error";

                $jsondata['data'] =  $data;
            }
        }



        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }



    public function UploadArchivoActaReversoAction()

    {

        $jsondata = array();

        if (!empty($_FILES['images'])) {

            $informeImg = new informeData();

            // File upload configuration

            $targetDir = "uploads/" . $_REQUEST["informe"];

            if (!file_exists($targetDir)) {

                mkdir($targetDir, 0777, true);
            }

            //$targetDir = $targetDir . '/' . $_REQUEST["cumplimiento"] . "/";

            $targetDir = $targetDir . '/' . $_REQUEST["cumplimiento"];

            if (!file_exists($targetDir)) {

                mkdir($targetDir, 0777, true);
            }

            $allowTypes = array('jpg', 'png', 'jpeg', 'gif');



            $max_ancho = 600;

            $max_alto = 600;



            $images_arr = array();

            foreach ($_FILES['images']['name'] as $key => $val) {

                $image_name = $_FILES['images']['name'][$key];

                $tmp_name   = $_FILES['images']['tmp_name'][$key];

                $size       = $_FILES['images']['size'][$key];

                $type       = $_FILES['images']['type'][$key];

                $error      = $_FILES['images']['error'][$key];



                // File upload path

                $fileName = basename($_FILES['images']['name'][$key]);

                $targetFilePath = $targetDir . $fileName;



                // Check whether file type is valid

                $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION);

                if (in_array($fileType, $allowTypes)) {

                    //$medidasimagen= getimagesize($_FILES['images']['tmp_name'][$key]);

                    $medidasimagen = getimagesize($tmp_name);

                    if ($medidasimagen[0] < 1280 && $size < 100000) {

                        if (move_uploaded_file($tmp_name, $targetFilePath)) {

                            $images_arr[] = $targetFilePath;



                            $idInforme = $_REQUEST["informe"];

                            $nSeccion = $_REQUEST["cumplimiento"];



                            $informeImg->nId = $idInforme;

                            $informeImg->nSeccion = $nSeccion;

                            $informeImg->cRuta = $targetFilePath;

                            $informeImg->cName = $fileName;

                            $informeImg->AddActaReversoImagenes();

                            $data = $informeImg->getInformeById();
                        }
                    } else {

                        $nombrearchivo = $image_name;

                        //Redimensionar

                        $rtOriginal = $tmp_name;



                        if ($type == 'image/jpeg') {

                            $original = imagecreatefromjpeg($rtOriginal);
                        } else if ($type == 'image/png') {

                            $original = imagecreatefrompng($rtOriginal);
                        } else if ($type == 'image/gif') {

                            $original = imagecreatefromgif($rtOriginal);
                        }





                        list($ancho, $alto) = getimagesize($rtOriginal);



                        $x_ratio = $max_ancho / $ancho;

                        $y_ratio = $max_alto / $alto;





                        if (($ancho <= $max_ancho) && ($alto <= $max_alto)) {

                            $ancho_final = $ancho;

                            $alto_final = $alto;
                        } elseif (($x_ratio * $alto) < $max_alto) {

                            $alto_final = ceil($x_ratio * $alto);

                            $ancho_final = $max_ancho;
                        } else {

                            $ancho_final = ceil($y_ratio * $ancho);

                            $alto_final = $max_alto;
                        }



                        $lienzo = imagecreatetruecolor($ancho_final, $alto_final);



                        imagecopyresampled($lienzo, $original, 0, 0, 0, 0, $ancho_final, $alto_final, $ancho, $alto);



                        //imagedestroy($original);



                        $cal = 8;



                        if ($type == 'image/jpeg') {

                            imagejpeg($lienzo, $targetFilePath);
                        } else if ($type == 'image/png') {

                            imagepng($lienzo, $targetFilePath);
                        } else if ($type == 'image/gif') {

                            imagegif($lienzo, $targetFilePath);
                        }



                        $images_arr[] = $targetFilePath;



                        $idInforme = $_REQUEST["informe"];

                        $nSeccion = $_REQUEST["cumplimiento"];



                        $informeImg->nId = $idInforme;

                        $informeImg->nSeccion = $nSeccion;

                        $informeImg->cRuta = $targetFilePath;

                        $informeImg->cName = $fileName;

                        $informeImg->AddActaReversoImagenes();

                        $data = $informeImg->getInformeById();
                    }
                }
            }

            // Generate gallery view of the images

            if (!empty($images_arr)) {

                $jsondata['success'] = true;

                $jsondata['message'] = 'correcto';

                $jsondata['data'] = $data;
            } else {

                $jsondata['success'] = false;

                $jsondata['message'] = "Error";

                $jsondata['data'] = "";
            }
        }



        header('Content-type: application/json; charset=utf-8');

        $val = json_encode($jsondata, JSON_UNESCAPED_UNICODE);

        echo $val;

        exit();
    }



    public function NuevoDocumentoAction()
    {

        $this->existeSesionAction();
        $empresa = new empresaData();
        $datEmpresa = $empresa->getDatosMiEmpresa();
        $datOtrasEmpresa = $empresa->getDatosOtrasEmpresa();

        $tipo_documento = new tipo_documentoData();
        $datTipo_documento = $tipo_documento->getTipo_Documento();

        $tarea = new tareaData();
        $datTarea = $tarea->getTareas();

        $uunn = new uunnData();
        $datUUNN = $uunn->getUUNN();

        // $cargos = new empresa_cargoData();
        // $datCargos =  $cargos->getTodosCargos();
        //$datCargos =  $cargos->getDatosMisCargosEmpresa();

        //$persona = new personaData();
        //$datPersona = $persona->getDatosEmpleados();

        $programa = new programaData();
        $datPrograma = $programa->getProgramas();

        $supervision = new supervisionData();
        $datSupervision = $supervision->getSupervision();

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Documecto | Registrar", "menu" => 1, "newHeader" => "1");
        $dataVista = array(
            "datTipo_documento" => $datTipo_documento,
            "datTarea"         => $datTarea,
            "datOtrasEmpresa"  => $datOtrasEmpresa,
            "datUUNN" => $datUUNN,
            "datPrograma" => $datPrograma,
            //"datCargos" => $datCargos,
            //"datEmpleados" => $datPersona,
            "datSupervision" => $datSupervision
        );

        View::render($this, "user/registerDocumento", array("meta" => $meta, "datEmpresa" => $datEmpresa, "dataVista" => $dataVista));
    }

    public function ActualizaDocumentoAction()
    {
        $this->existeSesionAction();

        $idInforme = $_REQUEST["id"];

        $informe = new informeData();
        $informe->nId =  $idInforme;
        $datInforme = $informe->getInformeById();

        $cumplientoRegistrados = new cumplimientoData();
        $cumplientoRegistrados->nIdInforme = $idInforme;

        $empresa = new empresaData();
        $datEmpresa = $empresa->getDatosMiEmpresa();
        $datOtrasEmpresa = $empresa->getDatosOtrasEmpresa();

        $tipo_documento = new tipo_documentoData();
        $datTipo_documento = $tipo_documento->getTipo_Documento();

        $tarea = new tareaData();
        $datTarea = $tarea->getTareas();

        $uunn = new uunnData();
        $datUUNN = $uunn->getUUNN();

        $supervision = new supervisionData();
        $datSupervision = $supervision->getSupervision();

        $programa = new programaData();
        $datPrograma = $programa->getProgramas();

        $datEmpleados = $cumplientoRegistrados->getEmpleadosIdEmpresa($datInforme->nIdEmpresa);
        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Documecto | Actualizar", "menu" => 1, "newHeader" => "1");

        $dataVista = array(
            "KeyProcesaCab" => 3,
            "datTipo_documento" => $datTipo_documento,
            "datTarea" => $datTarea,
            "datOtrasEmpresa" => $datOtrasEmpresa,
            "datUUNN" => $datUUNN,
            "datPrograma" => $datPrograma,
            "datSupervision" => $datSupervision,
            "datInforme" => $datInforme,
        );
        //aqui
        //View::render($this, "user/registerDocumento", array("meta" => $meta, "datEmpresa" => $datEmpresa, "dataVista" => $dataVista));
        View::render($this, "user/registerDocumento", array("meta" => $meta, "datEmpresa" => $datEmpresa, "dataVista" => $dataVista));
    }

    public function obtenerProgamasAction()

    {

        $this->existeSesionAction();



        $data = new programaData();

        $rep = $data->getProgramas();

        $myJSON = json_encode($rep);



        echo $myJSON;
    }



    public function obtenerProgamasIdAction()

    {

        $this->existeSesionAction();



        $data = new programaData();

        $data->nId = $_POST["programa"];

        $rep = $data->getProgramasById();



        $myJSON = json_encode($rep);

        echo $myJSON;
    }

    public function PerfilAction()

    {

        $this->existeSesionAction();



        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Inicio | Nuevo usuario", "menu" => 9, "newHeader" => 0);

        View::render($this, "user/perfil", array("meta" => $meta));
    }

    public function UsuariosAction()

    {

        $this->existeSesionAction();

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Inicio | Nuevo usuario", "menu" => 2);

        View::render($this, "user/usuarios", array("meta" => $meta));
    }

    public function TrabajadoresAction()

    {

        $this->existeSesionAction();

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Trabajadores | Gestión", "menu" => 5);

        View::render($this, "user/trabajadores", array("meta" => $meta));
    }

    public function cargosAction()

    {

        $this->existeSesionAction();

        $empresa = new empresaData();

        $datOtrasEmpresa = $empresa->getDatosAllEmpresas();



        $dataVista = array(

            "datOtrasEmpresa"  => $datOtrasEmpresa

        );

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Cargos | Gestión", "menu" => 6, "newHeader" => "0");

        View::render($this, "user/cargos", array("meta" => $meta, "dataVista" => $dataVista));
    }

    public function umAction()

    {

        $this->existeSesionAction();

        $empresa = new empresaData();

        $datOtrasEmpresa = $empresa->getDatosAllEmpresas();



        $vehiculo = new tipo_vehiculoData();

        $datvehiculo = $vehiculo->getTipo_Vehiculo();





        $dataVista = array(

            "datOtrasEmpresa"  => $datOtrasEmpresa,

            "datTipoMovil"  => $datvehiculo

        );

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Unidades Móviles | Gestión", "menu" => 7, "newHeader" => "0");

        View::render($this, "user/um", array("meta" => $meta, "dataVista" => $dataVista));
    }

    public function normasAction()

    {

        $this->existeSesionAction();

        $empresa = new empresaData();

        $datOtrasEmpresa = $empresa->getDatosAllEmpresas();



        $normas = new empresa_normaData();

        $datnormas = $normas->getNormas();





        $dataVista = array(

            "datOtrasEmpresa"  => $datOtrasEmpresa,

            "datnormas"  => $datnormas

        );

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Normas | Gestión", "menu" => 8, "newHeader" => "0");

        View::render($this, "user/normas", array("meta" => $meta, "dataVista" => $dataVista));
    }

    public function administrarAction()

    {

        $this->existeSesionAction();

        $empresa = new empresaData();

        $datOtrasEmpresa = $empresa->getDatosAllEmpresas();



        $supervision = new supervisionData();

        $datsupervision = $supervision->getSupervision();



        $uunn = new uunnData();

        $datUUNN = $uunn->getUUNN();



        $dataVista = array(

            "datOtrasEmpresa"  => $datOtrasEmpresa,

            "datsupervision"  => $datsupervision,

            "datUUNN" => $datUUNN

        );

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Administración | Gestión", "menu" => 4, "newHeader" => "0");

        View::render($this, "user/administrar", array("meta" => $meta, "dataVista" => $dataVista));
    }

    public function SolicitarAction()

    {

        $this->existeSesionAction();

        $dataCliente = array("credito" => $_POST['cred'], "Doi" => $_POST['doi'], "name" => $_POST['name']);

        $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Inicio | Solicitar Reversión", "menu" => 1);

        View::render($this, "user/solicitar", array("meta" => $meta, "datacliente" => $dataCliente));
    }





    public function validaBotAction($cap)

    {

        // Build POST request:

        $recaptcha_url = 'https://www.google.com/recaptcha/api/siteverify';

        $recaptcha_secret = '6LfYSvcUAAAAAKnS3AW102YetP-WrAefSBfG4cQ2';

        $recaptcha_response = $cap;



        // Make and decode POST request:

        $recaptcha = file_get_contents($recaptcha_url . '?secret=' . $recaptcha_secret . '&response=' . $recaptcha_response);

        $recaptcha = json_decode($recaptcha);

        if ($recaptcha->success == true) {

            // Take action based on the score returned:

            if ($recaptcha->score >= 0.5) {

                $this->smsbot = "";

                $this->nestado = 1;
            } else {

                $this->smsbot = "Error Form";

                $this->nestado = 1;



                // Not verified - show form error

            }
        } else {

            // there is an error /

            ///  timeout-or-duplicate meaning you are submit the  form

            $this->smsbot = "Por favor Intente Nuevamente";

            $this->nestado = 1;
        }
    }



    public function PDFDOCAction($varAreglo)

    {

        $pdf = new FPDF();

        $pdf->SetFont('Arial', '', 11);

        $pdf->AddPage('P');

        $pdf->FancyTableDoc($varAreglo);

        $pdf->Output("Calendarios_CMACM.pdf", "D");
    }



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
}
