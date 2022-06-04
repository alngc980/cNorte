<?php
$dataVista = $data["dataVista"];
?>
<div class="col-xl-12 order-xl-2">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <!-- Card header -->
                <div class="card-header border-0">
                    <h3 class="mb-0">Empresas</h3>
                </div>
                <!-- Light table -->
                <div class="table-responsive">
                    <table class="table align-items-center table-flush">
                        <tbody class="list" id="tblSupervision">
                            <?php foreach ($dataVista["datOtrasEmpresa"] as $dat) : ?>
                                <tr>
                                    <td><?php echo $dat->cNombre ?></td>
                                    <td class="text-right">
                                        <div class="dropdown">
                                            <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v"> </i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                <a class="dropdown-item btnPass" href="javascript:ActualizarEmpreza(<?php echo $dat->nId ?>)">
                                                    Modificar </a>
                                                <a class="dropdown-item btnDelete" href="javascript:EliminarEmpresa(<?php echo $dat->nId ?>)">
                                                    Eliminar </a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach ?>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <!-- Card header -->
                <div class="card-header border-0">
                    <h3 class="mb-0">Superivisión</h3>
                </div>
                <!-- Light table -->
                <div class="table-responsive">
                    <table class="table align-items-center table-flush">
                        <tbody class="list" id="tblSupervision">
                            <?php foreach ($dataVista["datsupervision"] as $dat) : ?>
                                <tr>
                                    <td><?php echo $dat->cNombre ?></td>
                                    <td class="text-right">
                                        <div class="dropdown">
                                            <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v"> </i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                <a class="dropdown-item btnPass" href="javascript:ActualizarSupervision(<?php echo $dat->nId ?>)">
                                                    Modificar </a>
                                                <a class="dropdown-item btnDelete" href="javascript:EliminarSupervision(<?php echo $dat->nId ?>)">
                                                    Eliminar </a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach ?>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <!-- Card header -->
                <div class="card-header border-0">
                    <h3 class="mb-0">UUNN</h3>
                </div>
                <!-- Light table -->
                <div class="table-responsive">
                    <table class="table align-items-center table-flush">
                        <tbody class="list" id="tblNN">
                            <?php foreach ($dataVista["datUUNN"] as $dat) : ?>
                                <tr>
                                    <td><?php echo $dat->cNombre ?></td>
                                    <td class="text-right">
                                        <div class="dropdown">
                                            <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v"> </i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                <a class="dropdown-item btnPass" href="javascript:ActualizarUUNN(<?php echo $dat->nId ?>)">
                                                    Modificar </a>
                                                <a class="dropdown-item btnDelete" href="javascript:EliminarUUNN(<?php echo $dat->nId ?>)">
                                                    Eliminar </a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach ?>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

<!--Modales Actualizacion-->
<div id="modalActualizaEmpresa" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-10">
                    <h3 class="mb-0">Actualiza Datos de la Empresa</h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="frmEmpresa">
                    <div class="pl-lg-4">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="NombreEmpresa">Nombre Empresa</label>
                                    <input type="text" name="Nombre" class="form-control" placeholder="Nombre" minlength="4" maxlength="30" required="">
                                    <input type="hidden" name="idEmpresa">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="RazonSocial">Raz&oacute;n Social</label>
                                    <input type="text" name="RazonSocial" class="form-control" placeholder="Razón social" minlength="5" maxlength="100" required="">
                                </div>
                            </div>
                        </div>
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
                    <h3 class="mb-0">Actualizar UUNN</h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="frmUUNN">
                    <div class="pl-lg-4">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="Nombre">Descripci&oacute;n</label>
                                    <input type="text" name="Nombre" class="form-control" placeholder="Nombre de UUNN" minlength="5" maxlength="30" required="" autocomplete="off">
                                    <input type="hidden" name="idUUNN">
                                </div>
                            </div>
                        </div>
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

<div id="modalAddTipoSupervision" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-10">
                    <h3 class="mb-0">Actualizar Tipo de Supervisi&oacute;n</h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="frmSupervision">
                    <div class="pl-lg-4">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="NombreSuper">Nombre</label>
                                    <input type="text" name="NombreSupervision" class="form-control" placeholder="Nombre del tipo de supervisión" minlength="5" maxlength="30" required="" autocomplete="off">
                                    <input type="hidden" name="idSupervision">
                                </div>
                            </div>
                        </div>
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


<script src="res/dtgsk/js/admin/admin.js"></script>