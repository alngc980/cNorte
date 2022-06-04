<?php
$dataVista = $data["dataVista"];
?>
<script>
    var gInforme = <?php echo json_encode($dataVista["datInforme"]); ?>
</script>
<div class="col-xl-12 order-xl-2">
    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-8">
                    <h3 class="mb-0">
                        <?php if ($dataVista["datInforme"]->nId == "") {
                            echo  "Nuevo Documento";
                        } else {
                            echo "Actualizar Informe " . $dataVista["datInforme"]->nIdAux;
                        } ?>
                    </h3>
                </div>

            </div>
        </div>
        <div class="card-body">
            <form role="form" class="form" id="fnRegisterDocumentoCab">
                <h6 class="heading-small text-muted mb-4">Datos del Programa</h6>
                <input type="hidden" name="KEYINFORME" value="<?php echo $dataVista["datInforme"]->nId; ?>">
                <input type="hidden" name="KEYPROCESACAB" value="<?php echo $dataVista["KeyProcesaCab"]; ?>">
                <div class="pl-lg-4">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-idTipo">Tipo</label>
                                <select class="form-control" id="idTipo" name="tipo" required>
                                    <option value="0">Seleccione opci&oacute;n</option>
                                    <?php foreach ($dataVista["datTipo_documento"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-idInputPrograma">Programa</label>
                                <select class="form-control" id="idInputPrograma" name="programa" required>
                                    <option value="0">Seleccione opci&oacute;n</option>
                                    <?php foreach ($dataVista["datPrograma"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-idInputCodigo">Código</label>
                                <input type="text" name="codigo" id="idInputCodigo" class="form-control" placeholder="Ingrese el código" readOnly>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-idInputVersion">Versión Actual</label>
                                <input type="text" id="idInputVersion" class="form-control" placeholder="Ingrese la Versión" readOnly>
                            </div>
                        </div>

                    </div>

                </div>
                <h6 class="heading-small text-muted mb-4">Datos de Evaluación</h6>
                <div class="pl-lg-4">
                    <div class="row">

                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">Tarea</label>
                                <select class="form-control" id="idTarea" name="tarea" required>
                                    <option value="0">Seleccione opci&oacute;n</option>
                                    <?php foreach ($dataVista["datTarea"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>

                                </select>

                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-empresa">Empresa</label>
                                <button class="btn btn-sm btn-icon btn-warning btn-orange btn-add-empresa" type="button">
                                    <span class="btn-inner--icon"><i class="ni ni-fat-add"></i></span>
                                </button>
                                <select class="mi-selector form-control" id="idEmpresa" name="empresa" required>
                                    <option value="0">Seleccione opci&oacute;n</option>
                                    <?php foreach ($dataVista["datOtrasEmpresa"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">UUNN</label>
                                <button class="btn btn-sm btn-icon btn-warning btn-add-un" type="button">
                                    <span class="btn-inner--icon"><i class="ni ni-fat-add"></i></span>
                                </button>
                                <select class="form-control" id="iduunn" name="uunn" required>
                                    <option value="0">Seleccione opci&oacute;n</option>
                                    <?php foreach ($dataVista["datUUNN"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>


                    </div>
                    <div class="row">

                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" id="lblTareaActividad">Actividad</label>
                                <textarea rows="3" id="idActividad" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" name="actividad" class="form-control" placeholder="Ingrese la Actividad."></textarea>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label">Obra</label>
                                <textarea rows="3" id="idObra" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" name="obra" class="form-control" placeholder="Ingrese el detalle de la obra"></textarea>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-lugar">Lugar</label>
                                <input type="text" id="idLugar" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" name="lugar" class="form-control" placeholder="Ingrese Lugar" maxlength="500" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="col-lg-3" id="gArea">
                            <div class="form-group">
                                <label class="form-control-label" for="input-area">Area</label>
                                <input type="text" id="idArea" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" name="area" class="form-control" placeholder="Ingrese el área" maxlength="220" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-responsable">Responsable</label>
                                <button class="btn btn-sm btn-icon btn-warning btn-add-responsable" type="button">
                                    <span class="btn-inner--icon"><i class="ni ni-fat-add"></i></span>
                                </button>
                                <select class="mi-selector form-control" id="idInputResponsable" name="responsable" required>
                                    <!-- <?php foreach ($dataVista["datEmpleados"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombres . " " . $dat->cApellidos ?></option>
                                    <?php endforeach ?> -->
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-cargo">Cargo</label>
                                <button class="btn btn-sm btn-icon btn-warning btn-add-cargo" type="button">
                                    <span class="btn-inner--icon"><i class="ni ni-fat-add"></i></span>
                                </button>
                                <select class="form-control" id="idCargo" name="cargo" required>
                                    <!-- <?php foreach ($dataVista["datCargos"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cCargo ?></option>
                                    <?php endforeach ?> -->
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-acta">Fecha</label>
                                <input type="date" id="idFecha" name="fecha" class="form-control" placeholder="dd/mm/yyyy" required>
                            </div>
                        </div>
                        <div class="col-lg-3" id="gSupervision">
                            <div class="form-group">
                                <label class="form-control-label" for="input-supervision">Tipo de Supervisión</label>
                                <button class="btn btn-sm btn-icon btn-warning btn-add-tipo-super" type="button">
                                    <span class="btn-inner--icon"><i class="ni ni-fat-add"></i></span>
                                </button>
                                <select class="form-control" id="idSupervision" name="supervision" required>
                                    <option value="0">Seleccione opci&oacute;n</option>
                                    <?php foreach ($dataVista["datSupervision"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3" id="gActa">
                            <div class="form-group">
                                <label class="form-control-label" for="input-acta">N° Acta</label>
                                <input type="number" id="idActa" name="acta" class="form-control" placeholder="Ingrese númerp de acta" required>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label class="form-control-label" for="input-sasd">Em. Superv. al Servicio de</label>
                                <input type="text" id="idSasd" name="sasd" class="form-control" readonly value="ENSA" maxlength="250" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="custom-control custom-control-alternative custom-checkbox">
                    <div class="imgLoad" style="display:none">
                        <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                    </div>
                    <span class="advertencia text-center">
                        <div class="text-success" id="smslog"></div>
                        <div class="text-danger" id="smslogerror"></div>
                    </span>
                </div>
                <div class="text-center">
                    <button class="btn btn-warning my-4" type="submit">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--Modales-->
<div id="modalAddEmpresa" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-10">
                    <h3 class="mb-0">Agregar Empresa</h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="frmAddEmpresa">
                    <div class="pl-lg-12">
                        <!-- <div class="row"> -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="form-control-label" for="Nombre">Nombre Empresa</label>
                                <input type="text" name="Nombre" class="form-control" placeholder="Nombre" minlength="4" maxlength="250" required="" autocomplete="off">
                            </div>
                        </div>
                        <!-- </div> -->
                        <!-- <div class="row"> -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="form-control-label" for="RazonSocial">Raz&oacute;n Social</label>
                                <input type="text" name="RazonSocial" class="form-control" placeholder="Razón social" minlength="5" maxlength="500" required="" autocomplete="off">
                            </div>
                        </div>
                        <!-- </div> -->
                    </div>
                    <div class="custom-control custom-control-alternative custom-checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                        </div>
                        <span class="advertencia text-center">
                            <div class="text-success" id="smslogM"></div>
                        </span>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-warning my-4" type="submit">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <div class="text-success" id="smslogM"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="modalAddUUNN" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-10">
                    <h3 class="mb-0">Agregar UUNN</h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="frmAddUUNN">
                    <div class="pl-lg-12">
                        <!-- <div class="row"> -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="form-control-label" for="Nombre">Descripci&oacute;n</label>
                                <input type="text" name="Nombre" class="form-control" placeholder="Nombre de UUNN" minlength="5" maxlength="30" required="" autocomplete="off">
                            </div>
                        </div>
                        <!-- </div> -->
                    </div>
                    <div class="custom-control custom-control-alternative custom-checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                        </div>
                        <span class="advertencia text-center">
                            <div class="text-success" id="smslogMUNN"></div>
                        </span>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-warning my-4" type="submit">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <div class="text-success" id="smslogMUNN"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="modalAddResponsable" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-10">
                    <h3 class="mb-0">Agregar Responsable</h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="frmResponsable">
                    <input type="hidden" name="Empresa" id="idEmpresaResponsable">
                    <div class="pl-lg-12">
                        <div class="alert alert-info" data-m-empresa="">
                            <strong>Debes Saber, </strong>
                            que al agregar otro responsable, este se suma a la empresa <strong id="alert-responsable"></strong>
                        </div>
                        <!-- <div class="row"> -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="form-control-label" for="Nombre">Nombre(s)</label>
                                <input type="text" name="NombrePersona" class="form-control" placeholder="Nombre del resposable" minlength="5" maxlength="30" required="">
                            </div>
                        </div>
                        <!-- </div> -->

                        <!-- <div class="row"> -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="form-control-label" for="Apellido">Apellido(s)</label>
                                <input type="text" name="ApellidosPersona" class="form-control" placeholder="Apellidos del resposable" minlength="5" maxlength="30" required="">
                            </div>
                        </div>
                        <!-- </div> -->

                        <!-- <div class="row"> -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="form-control-label" for="idDOI">DOI</label>
                                <input type="text" name="DOIPersona" class="form-control" placeholder="N° de documento de identidad" minlength="8" maxlength="8" required="">
                            </div>
                        </div>
                        <!-- </div> -->
                    </div>
                    <div class="custom-control custom-control-alternative custom-checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                        </div>
                        <span class="advertencia text-center">
                            <div class="text-success" id="smsMResponsable"></div>
                        </span>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-warning my-4" type="submit">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <div class="text-success" id="smsMResponsable"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="modalAddCargo" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-10">
                    <h3 class="mb-0">Nuevo Cargo</h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="frmAddEmpresaCargo">
                    <div class="pl-lg-12">
                        <div class="alert alert-info">
                            <strong>Debes Saber, </strong>
                            que al agregar otro cargo, este se suma a la empresa <strong id="alert-cargo"></strong>
                        </div>
                        <!-- <div class="row"> -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <input type="hidden" name="Empresa" id="idEmpresaCargo">
                                <label class="form-control-label" for="cargo">Cargo</label>
                                <input type="text" name="Cargo" class="form-control" placeholder="Nombre del cargo" minlength="5" maxlength="30" required="" autocomplete="off">
                            </div>
                        </div>
                        <!-- </div> -->
                    </div>
                    <div class="custom-control custom-control-alternative custom-checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                        </div>
                        <span class="advertencia text-center">
                            <div class="text-success" id="smsMCargo"></div>
                        </span>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-warning my-4" type="submit">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <div class="text-success" id="smsMCargo"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="modalAddTipoSupervision" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-10">
                    <h3 class="mb-0">Agregar Tipo de Supervisi&oacute;n</h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="frmAddSupervision">
                    <div class="pl-lg-12">
                        <!-- <div class="row"> -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="form-control-label" for="NombreSuper">Nombre</label>
                                <input type="text" name="NombreSupervision" class="form-control" placeholder="Nombre del tipo de supervisión" minlength="5" maxlength="30" required="" autocomplete="off">
                            </div>
                        </div>
                        <!-- </div> -->
                    </div>
                    <div class="custom-control custom-control-alternative custom-checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                        </div>
                        <span class="advertencia text-center">
                            <div class="text-success" id="smsMSupervidor"></div>
                        </span>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-warning my-4" type="submit">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <div class="text-success" id="smsMSupervidor"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<script src="res/dtgsk/js/user/registroDocumento.js"></script>