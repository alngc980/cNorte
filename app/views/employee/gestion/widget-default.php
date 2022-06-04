<?php
$dataVista = $data["dataVista"];
?>

<div class="col-xl-12 order-xl-2">
    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-8">
                    <h3 class="mb-0">Lista de trabajadores</h3>
                </div>
                <div class="col-4 text-right">
                    <button type="button" class="btn btn-warning my-4 btnAddTrabajador">Nuevo trabajador</button>
                </div>
            </div>
        </div>
        <div class="card-body">
            <form role="form" class="form" id="frmPersonaEmpresa">
                <div class="pl-lg-4">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="idEmpresa">Empresa</label>
                                <select class="mi-selector form-control" id="idEmpresa" name="idEmpresa" required>
                                    <?php foreach ($dataVista["datOtrasEmpresa"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="idCargo">Cargo</label>
                                <select class="mi-selector form-control" id="idCargo" name="idCargo" required>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="idPersona">Persona</label>
                                <select class="mi-selector form-control" id="idPersona" name="idPersona" required>
                                    <?php foreach ($dataVista["datPersonaEmpresa"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombres . " " . $dat->cApellidos ?></option>
                                    <?php endforeach ?>
                                </select>
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
                    <button type="submit" class="btn btn-warning my-4">Guardar</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card">
        <!-- Card header -->

        <!-- <div class="card-header border-0">
            <h3 class="mb-0">Lista de Cargos</h3>
        </div> -->

        <!-- Light table -->
        <div class="table-responsive">
            <table class="table align-items-center table-flush">
                <thead class="thead-light">
                    <tr>
                        <th scope="col" class="sort" data-sort="name">Empresa</th>
                        <th scope="col" class="sort" data-sort="budget">Persona</th>
                        <th scope="col" class="sort" data-sort="budget">DOI</th>
                        <th scope="col" class="sort" data-sort="budget">Cargo</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody class="list" id="tbltrabajadoresCargos">
                    <?php foreach ($dataVista["datEmpresaCargos"] as $dat) : ?>
                        <tr>
                            <td class="budget"><?php echo $dat->cNombre ?></td>
                            <td class="budget"><?php echo $dat->cNombres." ".$dat->cApellidos?></td>
                            <td class="budget"><?php echo $dat->cDoi ?></td>
                            <td class="budget"><?php echo $dat->cCargo ?></td>
                            <td>
                                <div class="dropdown">
                                    <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v"> </i></a>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                        <a class="dropdown-item btnPass" href="?r=trabajadores/documentoUpdate&doc=<?php echo $dat->nId ?>"> Modificar </a>
                                        <a class="dropdown-item btnDeleteInforme" href="#" data="<?php echo $dat->nId ?>"> Eliminar </a>
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

<!--Modales-->
<div id="modalAddTrabajador" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-10">
                    <h3 class="mb-0">Nuevo Trabajador</h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="frmPersona">

                    <div class="pl-lg-4">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="idNombre">Nombre(s)</label>
                                    <input type="text" name="NombrePersona" class="form-control" placeholder="Nombre del trabajador" minlength="5" maxlength="30" required="">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="idApellidos">Apellidos</label>
                                    <input type="text" name="ApellidosPersona" class="form-control" placeholder="Apellidos del trabajador" minlength="5" maxlength="100" required="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="idDOI">DOI</label>
                                    <input type="text" name="DOIPersona" class="form-control" placeholder="N° de documento de identidad" minlength="8" maxlength="8" required="">
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
                        <button class="btn btn-primary my-4" type="submit">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <div class="text-success" id="smslog"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>




<script src="res/dtgsk/js/trabajadores/trabajadores.js"></script>