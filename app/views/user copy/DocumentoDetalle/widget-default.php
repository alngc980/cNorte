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
  <div class="card">
    <div class="card-header">
      <div class="row align-items-center">
        <div class="col-10">
          <h3 class="mb-0"><?php echo $dataVista["datCumpliento"]->cNombre ?></h3>
        </div>
        <div class="col-2">
          <form role="form" method="post" action="?r=user/DocumentoDetalle">
            <input type="hidden" name="datakey" value=<?php echo $dataVista["datakey"] ?>></input>
            <input type="hidden" name="dataInicia" value=<?php echo $dataVista["nProximo"] ?>></input>
            <input type="hidden" name="dataTotal" value=<?php echo $dataVista["dataTotal"] ?>></input>
            <button class="btn btn-primary my-4" type="submit">Siguiente</button>
          </form>
        </div>
      </div>
    </div>
    <div class="card-body">
      <form role="form" class="form" id="fnRegistrarDetalle">
        <h6 class="heading-small text-muted mb-4">Datos del evaluación</h6>
        <div class="pl-lg-4">
          <div class="row">
            <input type="hidden" name="informe" value=<?php echo $dataVista["datakey"] ?>></input>
            <input type="hidden" name="cumplimiento" value=<?php echo $dataVista["datCumpliento"]->nId ?>></input>
            <div class="col-lg-6">
              <div class="form-group">
                <label class="form-control-label" for="input-idTipo">Tipo</label>
                <select class="form-control" id="idTipo" name="tipo" required>
                  <?php foreach ($dataVista["dataCodigos"] as $dat) : ?>
                    <option value="<?php echo $dat->cValor ?>"> <?php echo $dat->cDescripcion ?></option>
                  <?php endforeach ?>
                </select>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="form-group">
                <label class="form-control-label" for="input-detalle">Detalle</label>
                <textarea rows="3" id="idDetalle" name="detalle" class="form-control" placeholder="Ingrese la Actividad."></textarea>

              </div>
            </div>


          </div>

        </div>


        <div class="custom-control custom-control-alternative custom-checkbox">
          <div class="imgLoad" style="display:none">
            <img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />
          </div>
          <span class="advertencia text-center">
            <div class="text-success" id="smslog"></div>
            <div class="text-danger" id="smslogerror"></div>
          </span>
        </div>
        <div class="text-center">
          <button class="btn btn-primary my-4" type="submit">Guardar</button>

        </div>
      </form>
    </div>

   

  </div>
  <div class="card">
      <!-- Card header -->
      <div class="card-header border-0">
        <h3 class="mb-0">Lista de Registros</h3>
      </div>

      <!-- Light table -->
      <div class="table-responsive">

        <table class="table align-items-center table-flush">
          <thead class="thead-light">
            <tr>
              <th scope="col" class="sort" data-sort="name">Tipo</th>
              <th scope="col" class="sort" data-sort="budget">Detalle</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody class="list" id="tblCumpliento">
            <?php foreach ($dataVista["dataTable"] as $dat) : ?>
              <tr>
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
              </tr>
            <?php endforeach ?>
          </tbody>
        </table>
      </div>
    </div>
</div>
<script src="res/dtgsk/js/user/registroDocumentoDetalle.js"></script>