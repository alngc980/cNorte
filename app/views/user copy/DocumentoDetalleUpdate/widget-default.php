<?php
$dataVista = $data["dataVista"];
?>
<div class="col-xl-12 order-xl-2">
  <div class="card">
    <div class="card-header">
      <div class="row align-items-center">
        <div class="col-8">
          <h3 class="mb-0">Nuevo Documento </h3>
        </div>

      </div>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-xl-3 col-md-6">
          <div class="card card-stats">

            <!-- Card body -->
            <div class="card-body">

              <div class="row">
                <div class="col">
                  <h5 class="card-title text-uppercase text-muted mb-0">Total <br>Usuarios</h5>
                  <span class="h2 font-weight-bold mb-0" id="idTot">00</span>
                </div>
                <div class="col-auto">
                  <div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">
                    <i class="ni user-run"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-md-6">
          <div class="card card-stats">
            <!-- Card body -->
            <div class="card-body">
              <div class="row">
                <div class="col">
                  <h5 class="card-title text-uppercase text-muted mb-0">Usuarios<BR> Desactivados</h5>
                  <span class="h2 font-weight-bold mb-0" id="idTotD">00</span>
                </div>
                <div class="col-auto">
                  <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                    <i class="ni ni-chart-pie-35"></i>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
        <div class="col-xl-3 col-md-6">
          <div class="card card-stats">
            <!-- Card body -->
            <div class="card-body">
              <div class="row">
                <div class="col">
                  <h5 class="card-title text-uppercase text-muted mb-0">Usuarios<BR> Activados</h5>
                  <span class="h2 font-weight-bold mb-0" id="idTotA">00</span>
                </div>
                <div class="col-auto">
                  <div class="icon icon-shape bg-gradient-green text-white rounded-circle shadow">
                    <i class="ni ni-chart-pie-35"></i>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
      <div class="progress-wrapper">
        <div class="progress-info">
          <div class="progress-label">
            <h2><?php echo  $dataVista["datTarea"]->cNombre ?></h2>
          </div>
          <div class="progress-percentage">
            <span>50%</span>
          </div>
        </div>
        <div class="progress">
          <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>
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
                <tr id="tblCabCumpliento">

                </tr>
              </thead>
              <tbody class="list" id="tbldetCumpliento">
                <!-- <tr>
                      <td class="budget"><?php echo $dat->descripcionTipo ?></td>
                      <td class="budget"><?php echo $dat->detalle ?></td>
                      <td>
                        <div class="dropdown">
                          <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v"> </i></a>
                          <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                            <a class="dropdown-item btnOnOff" href="#" data="undefined"> Imprimir </a>
                            <a class="dropdown-item btnPass" href="#" data="undefined"> Modificar </a>
                            <a class="dropdown-item btnDelete" href="#" data="undefined"> Eliminar </a>
                          </div>
                        </div>
                      </td>
                    </tr> -->
              </tbody>
            </table>
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
                <!-- <tr>
                      <td class="budget"><?php echo $dat->descripcionTipo ?></td>
                      <td class="budget"><?php echo $dat->detalle ?></td>
                      <td>
                        <div class="dropdown">
                          <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v"> </i></a>
                          <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                            <a class="dropdown-item btnOnOff" href="#" data="undefined"> Imprimir </a>
                            <a class="dropdown-item btnPass" href="#" data="undefined"> Modificar </a>
                            <a class="dropdown-item btnDelete" href="#" data="undefined"> Eliminar </a>
                          </div>
                        </div>
                      </td>
                    </tr> -->
              </tbody>
            </table>
          </div>

        </div>

      </div>
    </div>
  </div>
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
          <p class="description text-center" id="idSmsPres3">Has click en los indicadores para visualizar los detalles</p>

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
                  <input type="hidden" name="informe" value="<?php  echo $dataVista["datakey"]?>"></input>
                  <input type="hidden" name="cumplimiento" value="10"> </input>
                  <label class="form-control-label" for="input-email">Trabajador</label>
                  <select class="form-control" name="tipo" required>
                    <?php foreach ($dataVista["datEmpleados"] as $dat) : ?>
                      <option value="<?php echo $dat->nId ?>"> <?php echo $dat->Descripcion." (".$dat->cCargo.")" ?></option>
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
                    if($dat->nTipo == 0):?>

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
            <button class="btn btn-primary my-4" type="submit" >Guardar</button>
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
                <input type="hidden" name="informe" value="<?php  echo $dataVista["datakey"]?>"></input>
                  <input type="hidden" name="cumplimiento" value="11"> </input>
                  <label class="form-control-label" for="input-email">Vehículo</label>
                  <select class="form-control"  name="tipo" required>
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
                  <select class="form-control"  name="norma" required>
                  <?php foreach ($dataVista["datNormas"] as $dat) : 
                    if($dat->nTipo == 1):?>

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
<input type="hidden" value="<?php echo $dataVista["datakey"] ?>" id="idKeyDoc"></input>
<script src="res/dtgsk/js/user/documento/updateDocumentoDetalle.js"></script>