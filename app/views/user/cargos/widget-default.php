<?php 
    $dataVista = $data["dataVista"]; 
?>
<div class="col-xl-12 order-xl-2">
    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-8">
                    <h3 class="mb-0">Nuevo Cargo </h3>
                </div>

            </div>
        </div>
        <div class="card-body">
            <form role="form" class="form" id="fnRegister">
                <h6 class="heading-small text-muted mb-4">Datos básicos del cargo</h6>
                <div class="pl-lg-4">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">Empresa</label>
                                <select class="mi-selector form-control" id="idEmpresa" name="empresa" required>
                                    <?php foreach ($dataVista["datOtrasEmpresa"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                </select>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-email">Cargo</label>
                                <input type="text" name="cargo" class="form-control" placeholder="" minlength="4" maxlength="320" required />
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
                    <button class="btn btn-primary my-4" type="submit" id="fnRegister">Guardar</button>
                </div>
            </form>
        </div>
    </div>
    <div class="card">
        <!-- Card header -->
        <div class="card-header border-0">
            <h3 class="mb-0">Lista de Cargos</h3>
        </div>
        <!-- Light table -->
        <div class="table-responsive">
            <table class="table align-items-center table-flush">
                <thead class="thead-light">
                    <tr>
                        <th scope="col" class="sort" data-sort="name">Empresa</th>
                        <th scope="col" class="sort" data-sort="budget">Cargo</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody class="list" id="tblCargos">


                </tbody>
            </table>
        </div>

    </div>
</div>

<div id="modalUpdCargo" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-8">
                    <h3 class="mb-0">Actualizar Cargo </h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="fnUpdateCargo">
                    <div class="pl-lg-4">
                        <div class="row" style="display: none;">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-email">ID</label>
                                    <input type="text" id="CargoId" name="CargoId" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label"  for="input-email">Empresa</label>
                                    <input type="text" id="Empresa" name="Empresa" class="form-control" readonly/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-username">Cargo</label>
                                    <input type="text" id="Cargo" name="Cargo" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="custom-control custom-control-alternative custom-checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                        </div>
                        <span class="advertencia text-center">
                            <div class="text-success" id="smslogMod"></div>
                        </span>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-primary my-4" type="submit" id="btnUpdateCargo">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="modalDelCargo" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="fnDelCargo">
                    <div class="pl-lg-4">
                        <div class="row" style="display: none;">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-email">ID</label>
                                    <input type="text" id="IdCargo" name="IdCargo" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group" id="CargoDel" name="CargoDel">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="custom-control custom-control-alternative custom-checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                        </div>
                        <span class="advertencia text-center">
                            <div class="text-success" id="smslogEliminarCargo"></div>
                        </span>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-danger my-4" id="fnDeleteCargo" name="fnDeleteCargo">Eliminar</button>
                        <button type="button" class="btn btn-secondary" id="fnDeleteSalir" name="fnDeleteSalir" data-dismiss="modal">Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="res/dtgsk/js/user/cargo.js"></script>