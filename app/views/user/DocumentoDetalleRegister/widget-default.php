<?php
$dataVista = $data["dataVista"];
?>
<div class="col-xl-12 order-xl-2">
  <div class="card">
    <div class="card-header">
      <div class="row align-items-center">
        <div class="col-8">
          <h3 class="mb-0">Informe N° <?php echo $dataVista["NumInforme"] ?> </h3>
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
  <div id="idDetalles" class="card shadow" style="display: none;">
    <div class="card-body">

      <div class="tab-content" id="myTabContent2">
        <div class="tab-pane fade show active" id="tabs-icons-text-3" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
          <p class="description text-center" id="idSmsPres3">Has click en los indicadores para visualizar los detalles</p>

          <div class="table-responsive">

            <table class="table align-items-center table-flush" id="tbl-data">
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



  <div class="card">
    <!-- Card header -->
    <?php 

    if ($dataVista["datTarea"]->nId == 3): ?>

      <div class="card-header border-0">
        <h3 class="mb-0">REGISTRO DE PERSONAL ASISTENTE A CHARLA</h3>
      </div>
    <?php endif; ?>
    
    <?php if ($dataVista["datTarea"]->nId !=3): echo $dataVista["datCumpliento"]->nIdTarea ?>

      <div class="card-header border-0">
        <h3 class="mb-0">Acta de Supervisión (Anverso)</h3>
      </div>
    <?php endif; ?>

    <div class="card-body">
      <div class="upload-div">
        <!-- File upload form -->
        <form id="uploadFormActa" enctype="multipart/form-data">
          <label>Adjuntar Imagen</label>
          <input type="hidden" name="informe" value=<?php echo $dataVista["datakey"] ?>></input>
          <input type="hidden" name="cumplimiento" value="21"></input>
          <input type="file" name="images[]" class="form-control" id="fileInput" accept="image/*">
          <input type="submit" name="submit" class="form-control btn btn-success" value="UPLOAD" />
        </form>

        <!-- Display upload status -->
        <div id="uploadStatusActa"></div>
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
                  <select class="form-control" id="idTipo" name="tipo" required>

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

<!-- Otros modales estáticos-->
<div id="modalAddCumplimientoTS" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="col-12">
          <h3 class="mb-0">Trabajadores Supervisados</h3>
        </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form role="form" class="form" id="fnRegistrarDetalleModalTS">
          <div class="pl-lg-12">

            <!-- <div class="row">
              <div class="col-lg-12"> -->
            <div class="form-group">
              <input type="hidden" name="informe" value="<?php echo $dataVista["datakey"] ?>"></input>
              <input type="hidden" name="cumplimiento" value="10"> </input>
              <label class="form-control-label" for="input-email">Trabajador</label>
              <select class="mi-selector form-control" id="selTrabajadores" name="tipo" required>
                <?php foreach ($dataVista["datEmpleados"] as $dat) : ?>
                  <option value="<?php echo $dat->nId ?>"> <?php echo $dat->Descripcion . " (" . $dat->cCargo . ")" ?></option>
                <?php endforeach ?>
              </select>
            </div>
          </div>
          <!-- </div>
            </div> -->
          <!-- <div class="row">
            <div class="col-lg-12"> -->
          <div class="pl-lg-12">
            <div class="form-group">
              <label class="form-control-label" for="input-email">Normas Incumplidas</label>
              <select class="mi-selector form-control" id="idTipo" name="norma" required>
                <?php foreach ($dataVista["datNormas"] as $dat) :
                  if ($dat->nTipo == 0) : ?>
                    <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cDescripcion ?></option>
                <?php
                  endif;
                endforeach ?>
              </select>
            </div>
          </div>
          <!-- </div>
          </div> -->
          <!-- </div> -->
          <!-- <div class="custom-control custom-control-alternative custom-checkbox">
            <div class="imgLoadTS" style="display:none">
              <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
            </div>
            <span class="advertencia text-center">
              <div class="text-success" id="smslogMTS"></div>
            </span>
          </div> -->
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

          <div class="pl-lg-12">

            <!-- <div class="row"> -->
            <div class="col-lg-12">
              <div class="form-group">
                <input type="hidden" name="informe" value="<?php echo $dataVista["datakey"] ?>"></input>
                <input type="hidden" name="cumplimiento" value="11"> </input>
                <label class="form-control-label" for="input-email">Vehículo</label>
                <select class="mi-selector form-control" name="tipo" required>
                  <?php foreach ($dataVista["datVehiculos"] as $dat) : ?>
                    <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cDescripcion ?></option>
                  <?php endforeach ?>
                </select>
              </div>
            </div>
            <!-- </div> -->
            <!-- <div class="row"> -->
            <div class="col-lg-12">
              <div class="form-group">
                <label class="form-control-label" for="input-username">Incumplimiento</label>
                <select class="mi-selector form-control" name="norma" required>
                  <?php foreach ($dataVista["datNormas"] as $dat) :
                    if ($dat->nTipo == 1) : ?>

                      <option value="<?php echo $dat->nId ?>"> <?php echo $dat->cDescripcion ?></option>
                  <?php
                    endif;
                  endforeach ?>
                </select>
              </div>
            </div>
            <!-- </div> -->
          </div>
          <!-- <div class="custom-control custom-control-alternative custom-checkbox">
            <div class="imgLoad" style="display:none">
              <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
            </div>
            <span class="advertencia text-center">
              <div class="text-success" id="smslogM"></div>
            </span>
          </div> -->
          <div class="text-center">
            <button class="btn btn-primary my-4" type="submit" id="fnRegister">Guardar</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
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
          <h3 class="mb-0">Agregar Persona</h3>
        </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form role="form" class="form" id="frmResponsable">
          <input type="hidden" name="Empresa" id="idEmpresaResponsable" value="<?php echo $dataVista["dataInforme"]->nIdEmpresa ?>">
          <div class="pl-lg-4">
            <!-- <div class="alert alert-info" data-m-empresa="">
                            <strong>Debes Saber, </strong>
                            que al agregar otro responsable, este se suma a la empresa <strong id="alert-responsable"></strong>
                        </div> -->
            <div class="row">
              <div class="col-lg-12">
                <div class="form-group">
                  <label class="form-control-label" for="Nombre">Nombre(s)</label>
                  <input type="text" name="NombrePersona" class="form-control" placeholder="Nombre del resposable" minlength="5" maxlength="30" required="">
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-lg-12">
                <div class="form-group">
                  <label class="form-control-label" for="Apellido">Apellido(s)</label>
                  <input type="text" name="ApellidosPersona" class="form-control" placeholder="Apellidos del resposable" minlength="5" maxlength="30" required="">
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
<script src="res/dtgsk/js/user/documento/updateDocumentoDetalle.js"></script>