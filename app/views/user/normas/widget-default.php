<?php 
    $dataVista = $data["dataVista"]; 
?>
<div class="col-xl-12 order-xl-2">
    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-8">
                    <h3 class="mb-0">Nuevas normas </h3>
                </div>
            </div>
        </div>
        <div class="card-body">
            <form role="form" class="form" id="fnRegister">
                <h6 class="heading-small text-muted mb-4">Datos básicos</h6>
                <div class="pl-lg-4">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">Empresa</label>
                                <select class="mi-selector form-control" name="empresa" required>
                                    <?php foreach ($dataVista["datOtrasEmpresa"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-email">Control</label>
                                <select class="mi-selector form-control" name="control" required>
                                    <?php foreach ($dataVista["datnormas"] as $dat) : ?>
                                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cDescripcion ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-email">Observación</label>
                                <input type="text" name="observacion" class="form-control" placeholder="" minlength="4" maxlength="320" required />
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-email">Código</label>
                                <input type="text" name="codigo" class="form-control" placeholder="" minlength="2" maxlength="8" required />
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
            <h3 class="mb-0">Lista Normas</h3>
        </div>
        <!-- Light table -->
        <div class="table-responsive">
            <table class="table align-items-center table-flush">
                <thead class="thead-light">
                    <tr>
                        <th scope="col" class="sort" data-sort="name">Control</th>
                        <th scope="col" class="sort" data-sort="budget">Valor</th>
                        <th scope="col" class="sort" data-sort="budget">Observación</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody class="list" id="tblNormas">


                </tbody>
            </table>
        </div>

    </div>
</div>

<div id="modalUpdNorma" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-8">
                    <h3 class="mb-0">Actualizar Norma </h3>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="fnUpdateNorma">
                    <div class="pl-lg-4">
                        <div class="row" style="display: none;">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-email">ID</label>
                                    <input type="text" id="NormaId" name="NormaId" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label"  for="input-email">Control</label>
                                    <input type="text" id="Control" name="Control" class="form-control" readonly/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-username">Valor</label>
                                    <input type="text" id="Valor" name="Valor" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-username">Observación</label>
                                    <input type="text" id="Observacion" name="Observacion" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="custom-control custom-control-alternative custom-checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                        </div>
                        <span class="advertencia text-center">
                            <div class="text-success" id="smslogMod55"></div>
                        </span>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-primary my-4" id="btnActualizazNorma">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="modalDelNorma" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" class="form" id="fnDelNorma">
                    <div class="pl-lg-4">
                        <div class="row" style="display: none;">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-email">ID</label>
                                    <input type="text" id="IdNorma" name="IdNorma" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group" id="NormaDel" name="NormaDel">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="custom-control custom-control-alternative custom-checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                        </div>
                        <span class="advertencia text-center">
                            <div class="text-success" id="smslogEliminarNorma"></div>
                        </span>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-danger my-4" id="fnDeleteNorma" name="fnDeleteNorma">Eliminar</button>
                        <button type="button" class="btn btn-secondary" id="fnDeleteSalir" name="fnDeleteSalir" data-dismiss="modal">Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="res/dtgsk/js/user/normas.js"></script>