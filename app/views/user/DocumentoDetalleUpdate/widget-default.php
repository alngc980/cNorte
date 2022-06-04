<?php

$dataVista = $data["dataVista"];

?>
<script>
   <?php
       echo  "var idArea =".$dataVista["datTarea"]->nId.";";
   ?>
    
</script>
<div class="col-xl-12 order-xl-2">

  <div class="card">

    <div class="card-header">

      <div class="row align-items-center">

        <div class="col-8">

          <h3 class="mb-0">Informe Técnico N° <?php echo $dataVista["NumInforme"] ?> </h3>

        </div>
        <div class="col-4">
          <a class="btn btn-sm btn-warning" style="float: right !important;" href="?r=user/ActualizaDocumento&id=<?php echo $dataVista["datakey"]?>">
            Modificar
          </a>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="progress-wrapper">
        <div class="progress-info">
          <div class="progress-label">
            <h2><?php echo  $dataVista["datTarea"]->cNombre ?></h2>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="col-xl-12 order-xl-2">
  <div class="nav-wrapper">
    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
      <?php foreach ($dataVista["datCumpliento"] as $dat) :
        if ($dat->cCodigo <> "") : ?>
          <li class="nav-item">
            <a class="nav-link mb-sm-3 mb-md-0 clsCumDet" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true" data="<?php echo $dat->nId ?>"><i class="ni ni-bold-right">
              </i><?php echo $dat->cCodigo ?>
            </a>
          </li>
      <?php
        endif;
      endforeach ?>
    </ul>
  </div>
  <div class="card shadow">
    <div class="card-body">
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
          <p class="description text-center" id="idSmsPres">Has click en los indicadores para visualizar los detalles</p>
          <div class="table-responsive">
            <table class="table align-items-center table-flush">
              <thead class="thead-light">
                <tr id="tblCabCumpliento"> </tr>
              </thead>
              <tbody class="list" id="tbldetCumpliento"> </tbody>
            </table>
          </div> <!-- Card header -->
          <div class="card-body" id="divAdjun1" style="display: none;">
            <div class="upload-div">
              <!-- File upload form -->

              <form id="uploadForm" enctype="multipart/form-data">

                <label>Adjuntar imagenes</label>

                <input type="hidden" name="informe" value=<?php echo $dataVista["datakey"] ?>></input>

                <input type="hidden" name="cumplimiento" id="cumplimiento" value=<?php echo $dataVista["datCumpliento"]->nId ?>></input>

                <input type="file" name="images[]" class="form-control" id="fileInput" multiple accept="image/*">

                <input type="submit" name="submit" class="form-control btn btn-success" value="UPLOAD" />

              </form>



              <!-- Display upload status -->

              <div id="uploadStatus"></div>
            </div>
            <hr>
            <div class="row shortcuts px-1" id="imgAdj"> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="nav-wrapper">

    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">

      <?php foreach ($dataVista["datCumpliento"] as $dat) :

        if ($dat->cCodigo == ""  && $dat->nModelo != 1) :

      ?>

          <li class="nav-item">

            <a class="nav-link mb-sm-3 mb-md-0 clsCumDet2" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true" data="<?php echo $dat->nId ?>"><i class="ni ni-bold-right">

              </i><?php echo $dat->cNombre ?>

            </a>

          </li>

      <?php

        endif;

      endforeach ?>

    </ul>

  </div>
  <div class="card shadow">
    <div class="card-body">
      <div class="tab-content" id="myTabContent2">
        <div class="tab-pane fade show active" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
          <p class="description text-center" id="idSmsPres2">Has click en los indicadores para visualizar los detalles</p>
          <div class="table-responsive">
            <table class="table align-items-center table-flush">
              <thead class="thead-light">

                <tr id="tblCabCumpliento2">
                </tr>

              </thead>
              <tbody class="list" id="tbldetCumpliento2">
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-body" id="divAdjun2_aux" style="display: none;">
            <div class="upload-div">
              <!-- File upload form -->

              <form id="uploadForm_aux" enctype="multipart/form-data">

                <label>Adjuntar imagenes</label>

                <input type="hidden" name="informe" value=<?php echo $dataVista["datakey"] ?>></input>

                <input type="hidden" name="cumplimiento" id="cumplimiento_aux" value=<?php echo $dataVista["datCumpliento"]->nId ?>></input>

                <input type="file" name="images[]" class="form-control" id="fileInput" multiple accept="image/*">

                <input type="submit" name="submit" class="form-control btn btn-success" value="UPLOAD" />

              </form>



              <!-- Display upload status -->

              <div id="uploadStatus_aux"></div>
            </div>
            <hr>
            <div class="row shortcuts px-1" id="imgAdj_aux"> </div>
          </div>
      </div>
    </div>

  </div>



  <?php if (count($dataVista["datCumpliento"]) == 11) { ?>

    <div class="nav-wrapper">

      <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">

        <?php foreach ($dataVista["datCumpliento"] as $dat) :

          if ($dat->cCodigo == ""  && $dat->nModelo == 1) :

        ?>

            <li class="nav-item">

              <a class="nav-link mb-sm-3 mb-md-0 clsCumDet3" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true" data="<?php echo $dat->nId ?>"><i class="ni ni-bold-right">

                </i><?php echo $dat->cNombre ?>

              </a>

            </li>



        <?php

          endif;

        endforeach ?>

      </ul>

    </div>
    <div class="card shadow">
      <div class="card-body">
        <div class="tab-content" id="myTabContent2">
          <div class="tab-pane fade show active" id="tabs-icons-text-3" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
            <p class="description text-center" id="idSmsPres3">Has click easdasn los indicadores para visualizar los detalles</p>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">

                  <tr id="tblCabCumpliento3">



                  </tr>

                </thead>

                <tbody class="list" id="tbldetCumpliento3">



                </tbody>

              </table>
            </div>
          </div>
        </div>
      </div>

    </div>

  <?php } ?>



  <div class="card">
    <!-- Card header -->
    <div class="card-header border-0">
      <h3 class="mb-0">Acta de Supervisión </h3>
    </div>
    <div class="card-body">
      <div class="upload-div">
        <!-- File upload form -->
        <form id="uploadFormActa" enctype="multipart/form-data">
          <label>Adjuntar Imagen</label>
          <input type="hidden" name="informe" value=<?php echo $dataVista["datakey"] ?>></input>
          <input type="hidden" name="cumplimiento" value="21"></input>
          <input type="file" name="images[]" class="form-control" id="fileInput" accept="image/*">
          <input id="EnviarActa" type="submit" name="submit" class="form-control btn btn-success" value="UPLOAD" />
        </form>

        <!-- Display upload status -->
        <div id="uploadStatusActa">


        </div>
      </div>
      <hr>
    </div>
  </div>
  <div class="row shortcuts px-1" id="imgAdjActa">
  </div>

</div>

<div id="modalAddCumplimiento" class="modal" tabindex="-1" role="dialog">

  <div class="modal-dialog" role="document">

    <div class="modal-content">

      <div class="modal-header">

        <div class="col-10">

          <h3 class="mb-0 text-center" id="modalTitCumplimiento"></h3>

        </div>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

          <span aria-hidden="true">&times;</span>

        </button>

      </div>

      <div class="modal-body">

        <form role="form" class="form" id="fnRegistrarDetalleModal">



          <div class="pl-lg-4">



            <div class="row">

              <div class="col-lg-12">

                <div class="form-group">

                  <input type="hidden" name="informe" id="idInforme"></input>

                  <input type="hidden" name="cumplimiento" id="idCumplimiento"></input>

                  <label class="form-control-label" for="input-email">Tipo</label>

                  <select class="form-control idTipo" id="idTipo" name="tipo" required>
                  </select>

                </div>

              </div>
              <div class="col-lg-12 groupImcumplimiento" style="display: none;">

                <div class="form-group">

                  <label class="form-control-label" for="input-idTipo">Motivo Imcumplimiento</label>

                  <select class="mi-selector form-control" name="motivo" required>

                    <?php foreach ($dataVista["datImcumplimiento"] as $dat) : ?>

                      <option value="<?php echo $dat->cValor ?>"> <?php echo $dat->cDescripcion ?></option>

                    <?php endforeach ?>

                  </select>

                </div>
              </div>
            </div>

            <div class="row">

              <div class="col-lg-12">

                <div class="form-group">

                  <label class="form-control-label" for="input-username">Descripción</label>

                  <textarea rows="3" id="idDetalle" name="detalle" class="form-control" placeholder="Ingrese el detalle."></textarea>

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

            <button class="btn btn-primary my-4" type="submit" id="fnRegister">Guardar</button>

            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

          </div>

        </form>

      </div>

    </div>

  </div>

</div>
<div id="modalUpdCumplimiento" class="modal" tabindex="-1" role="dialog">

  <div class="modal-dialog" role="document">

    <div class="modal-content">

      <div class="modal-header">

        <div class="col-10">

          <h3 class="mb-0 text-center" id="modalTitUpdCumplimiento"></h3>

        </div>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

          <span aria-hidden="true">&times;</span>

        </button>

      </div>

      <div class="modal-body">

        <form role="form" class="form" id="fnUpdateDetalleModal">



          <div class="pl-lg-4">



            <div class="row">

              <div class="col-lg-12">

                <div class="form-group">

                  <input type="hidden" name="informe" id="idUpdInforme"></input>

                  <input type="hidden" name="cumplimiento" id="idUpdCumplimiento"></input>

                  <label class="form-control-label" for="input-email">Tipo</label>

                  <select class="form-control idTipo" id="idUpdTipo" name="tipo" required>

                  </select>

                </div>

              </div>
              <div class="col-lg-12 groupImcumplimiento" style="display: none;">

                <div class="form-group">

                  <label class="form-control-label" for="input-idTipo">Motivo Imcumplimiento</label>

                  <select class="mi-selector form-control" name="motivo" required>

                    <?php foreach ($dataVista["datImcumplimiento"] as $dat) : ?>

                      <option value="<?php echo $dat->cValor ?>"> <?php echo $dat->cDescripcion ?></option>

                    <?php endforeach ?>

                  </select>

                </div>
              </div>

            </div>

            <div class="row">

              <div class="col-lg-12">

                <div class="form-group">

                  <label class="form-control-label" for="input-username">Descripción</label>

                  <textarea rows="3" id="idDetalleUpd" name="detalle" class="form-control" placeholder="Ingrese el detalle."></textarea>

                </div>

              </div>

            </div>

          </div>

          <div class="custom-control custom-control-alternative custom-checkbox">

            <div class="imgLoad" style="display:none">

              <img src="res/img/load-espera.gif" style="width:30px; height:30px" />

            </div>

            <span class="advertencia text-center">

              <div class="text-success" id="smslogMUpd"></div>

            </span>

          </div>

          <div class="text-center">

            <button class="btn btn-primary my-4" type="submit" id="fnUpdateModal">Actualizar</button>

            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

          </div>

        </form>

      </div>

    </div>

  </div>

</div>
<!-- Otros modales estáticos-->

<div id="modalAddCumplimientoTS" class="modal" tabindex="-1" role="dialog">

  <div class="modal-dialog" role="document">

    <div class="modal-content">

      <div class="modal-header">

        <div class="col-10">

          <h3 class="mb-0 text-center">Trabajadores Supervisados</h3>

        </div>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

          <span aria-hidden="true">&times;</span>

        </button>

      </div>

      <div class="modal-body">

        <form role="form" class="form" id="fnRegistrarDetalleModalTS">

          <div class="pl-lg-4">



            <div class="row">

              <div class="col-lg-12">

                <div class="form-group">

                  <input type="hidden" name="informe" value="<?php echo $dataVista["datakey"] ?>"></input>

                  <input type="hidden" name="cumplimiento" value="10"> </input>

                  <label class="form-control-label" for="input-email">Trabajador</label>

                  <select class="form-control" id="selTrabajadores" name="tipo" required>

                    <?php foreach ($dataVista["datEmpleados"] as $dat) : ?>
                      <option value="<?php echo $dat->nId ?>"> <?php echo $dat->Descripcion . " (" . $dat->cCargo . ")" ?> </option>
                    <?php endforeach ?>

                  </select>

                </div>

              </div>

            </div>

            <div class="row">

              <div class="col-lg-12">

                <div class="form-group">

                  <label class="form-control-label" for="input-email">Normas Incumplidas</label>

                  <select class="form-control" id="idTipo" name="norma" required>

                    <?php foreach ($dataVista["datNormas"] as $dat) :

                      if ($dat->nTipo == 0) : ?>
                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cDescripcion ?></option>

                    <?php

                      endif;

                    endforeach ?>

                  </select>

                </div>

              </div>

            </div>

          </div>

          <div class="custom-control custom-control-alternative custom-checkbox">

            <div class="imgLoadTS" style="display:none">

              <img src="res/img/load-espera.gif" style="width:30px; height:30px" />

            </div>

            <span class="advertencia text-center">

              <div class="text-success" id="smslogMTS"></div>

            </span>

          </div>

          <div class="text-center">

            <button class="btn btn-primary my-4" type="submit">Guardar</button>

            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

          </div>

        </form>

      </div>

    </div>

  </div>

</div>

<div id="modalAddCumplimientoUM" class="modal" tabindex="-1" role="dialog">

  <div class="modal-dialog" role="document">

    <div class="modal-content">

      <div class="modal-header">

        <div class="col-10">

          <h3 class="mb-0 text-center">Unidades Móviles Supervisadas</h3>

        </div>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

          <span aria-hidden="true">&times;</span>

        </button>

      </div>

      <div class="modal-body">

        <form role="form" class="form" id="fnRegistrarDetalleModalUM">

          <div class="pl-lg-4">

            <div class="row">

              <div class="col-lg-12">

                <div class="form-group">

                  <input type="hidden" name="informe" value="<?php echo $dataVista["datakey"] ?>"></input>

                  <input type="hidden" name="cumplimiento" value="11"> </input>

                  <label class="form-control-label" for="input-email">Vehículo</label>

                  <select class="form-control" name="tipo" required>

                    <?php foreach ($dataVista["datVehiculos"] as $dat) : ?>

                      <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cDescripcion ?></option>

                    <?php endforeach ?>

                  </select>

                </div>

              </div>

            </div>

            <div class="row">

              <div class="col-lg-12">

                <div class="form-group">

                  <label class="form-control-label" for="input-username">Incumplimiento</label>

                  <select class="form-control" name="norma" required>

                    <?php foreach ($dataVista["datNormas"] as $dat) :

                      if ($dat->nTipo == 1) : ?>

                        <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cDescripcion ?></option>

                    <?php

                      endif;

                    endforeach ?>

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

              <div class="text-success" id="smslogMUM"></div>

            </span>

          </div>

          <div class="text-center">

            <!--<button class="btn btn-primary my-4" type="submit" id="fnRegister">Guardar</button>-->

            <button class="btn btn-primary my-4" type="submit">Guardar</button>

            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

          </div>

        </form>

      </div>

    </div>

  </div>

</div>

<div id="modalAddPersonaCargoEmpresa" class="modal" tabindex="-1" role="dialog">

  <div class="modal-dialog" role="document">

    <div class="modal-content">

      <div class="modal-header">

        <div class="col-10">

          <h3 class="mb-0">Configuraci&oacute;n Persona - Cargo</h3>

        </div>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

          <span aria-hidden="true">&times;</span>

        </button>

      </div>

      <div class="modal-body">

        <form role="form" class="form" id="frmAddPersonaCargoEmpresa">

          <input type="hidden" name="Empresa" value="<?php echo $dataVista["dataInforme"]->nIdEmpresa ?>">

          <div class="col-lg-12">

            <div class="form-group">

              <label class="form-control-label" for="Nombre">Nombre(s)</label>

              <input type="text" name="NombrePersona" class="form-control" placeholder="Nombre del resposable" minlength="5" maxlength="30" required="" autocomplete="off">

            </div>

          </div>



          <div class="col-lg-12">

            <div class="form-group">

              <label class="form-control-label" for="Nombre">Apellido(s)</label>

              <input type="text" name="ApellidosPersona" class="form-control" placeholder="Nombre del resposable" minlength="5" maxlength="120" required="" autocomplete="off">

            </div>

          </div>



          <div class="col-lg-12">

            <div class="form-group">

              <label class="form-control-label" for="Nombre">DOI</label>

              <input type="text" name="DOIPersona" class="form-control" placeholder="Nombre del resposable" minlength="5" maxlength="8" required="" autocomplete="off">

            </div>

          </div>



          <div class="col-lg-12">

            <div class="form-group">

              <label class="form-control-label" for="Cargo" link-cargo="off">Nuevo Cargo <small><a for="Cargo" href="javascript:MostarCargosRegistrados(<?php echo $dataVista["dataInforme"]->nIdEmpresa ?>)">[Mostar Cargos]</a></span></label>

              <input type="text" name="Cargo" class="form-control" placeholder="Nombre del cargo" minlength="5" maxlength="120" autocomplete="off">

              <select class="mi-selector form-control" name="Cargo">

                <!-- <?php foreach ($dataVista["datVehiculos"] as $dat) : ?>

                      <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cDescripcion ?></option>

                    <?php endforeach ?> -->

              </select>

            </div>

          </div>



          <!-- <div class="custom-control custom-control-alternative custom-checkbox">

            <div class="imgLoad" style="display:none">

              <img src="res/img/load-espera.gif" style="width:30px; height:30px" />

            </div>

            <span class="advertencia text-center">

              <div class="text-success" id="smsMCargo"></div>

            </span>

          </div> -->

          <div class="text-center">

            <button class="btn btn-warning my-4" type="submit">Guardar</button>

            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

            <!-- <div class="text-success" id="smsMCargo"></div> -->

          </div>

        </form>

      </div>

    </div>

  </div>

</div>

<div id="modalAddVehiculoEmpresa" class="modal" tabindex="-1" role="dialog">

  <div class="modal-dialog" role="document">

    <div class="modal-content">

      <div class="modal-header">

        <div class="col-10">

          <h3 class="mb-0">Configuraci&oacute;n Vehiculo Empresa</h3>

        </div>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

          <span aria-hidden="true">&times;</span>

        </button>

      </div>

      <div class="modal-body">

        <form role="form" class="form" id="frmAddVehiculoEmpresa">

          <input type="hidden" name="EMPRESA" value="<?php echo $dataVista["dataInforme"]->nIdEmpresa ?>">

          <div class="col-lg-12">

            <div class="form-group">

              <label class="form-control-label" for="TIPO_VEHICULO">Tipo Vehiculo</label>

              <select class="mi-selector form-control" name="TIPO_VEHICULO">

                <?php foreach ($dataVista["dataVehiculo"] as $dat) : ?>

                  <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cNombre ?></option>

                <?php endforeach ?>

              </select>

            </div>

          </div>



          <div class="col-lg-12">

            <div class="form-group">

              <label class="form-control-label" for="PLACA">Placa</label>

              <input type="text" name="PLACA" class="form-control" placeholder="N° de Placa " minlength="5" maxlength="20" required="" autocomplete="off">

            </div>

          </div>



          <div class="text-center">

            <button class="btn btn-warning my-4" type="submit">Guardar</button>

            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

            <!-- <div class="text-success" id="smsMCargo"></div> -->

          </div>

        </form>

      </div>

    </div>

  </div>

</div>

<input type="hidden" value="<?php echo $dataVista["datakey"] ?>" id="idKeyDoc"></input>
<input type="hidden" value="<?php echo $dataVista["dataInforme"]->nIdEmpresa ?>" id="idKeyEmpresa"></input>

<script src="res/dtgsk/js/user/documento/updateDocumentoDetalle.js"></script>