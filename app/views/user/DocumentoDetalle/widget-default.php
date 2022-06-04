<?php

$dataVista = $data["dataVista"];

?>

<div class="col-xl-12 order-xl-2">

  <div class="card">

    <div class="card-header">

      <div class="row align-items-center">

        <div class="col-8">

          <h3 class="mb-0">Informe Técnico N° <?php echo $dataVista["NumInforme"] ?> </h3>

        </div>



      </div>

    </div>

    <div class="card-body">

      <div class="progress-wrapper">

        <div class="progress-info">

          <div class="progress-label text-center">

            <h2><?php echo  $dataVista["datTarea"]->cNombre ?></h2>

          </div>

        </div>

      </div>

    </div>

  </div>

</div>

<div class="col-xl-12 order-xl-2">

  <div class="card">

    <div class="card-header">

      <div class="row">

        <div class="col-2">

          <form role="form" method="post" action="?r=user/DocumentoDetalle">

            <input type="hidden" name="datakey" value=<?php echo $dataVista["datakey"] ?>></input>

            <input type="hidden" name="dataInicia" id="dataInicia" value=<?php echo $dataVista["nAnterior"] ?>></input>

            <input type="hidden" name="dataTotal" value=<?php echo $dataVista["dataTotal"] ?>></input>

            <button class="btn btn-warning my-4" type="submit"><i class="ni ni-bold-left"></i></button>

          </form>







        </div>

        <div class="col-8 text-center">

          <br>

          <h3 class="mb-0"><?php echo $dataVista["datCumpliento"]->cNombre ?>  </h3>

        </div>
           
        <div class="col-2 text-right">

          <form role="form" method="post" action="?r=user/DocumentoDetalle">

            <input type="hidden" name="datakey" value=<?php echo $dataVista["datakey"] ?>></input>

            <input type="hidden" name="dataInicia" value=<?php echo $dataVista["nProximo"] ?>></input>

            <input type="hidden" name="dataTotal" value=<?php echo $dataVista["dataTotal"] ?>></input>

            <button class="btn btn-warning my-4" type="submit"><i class="ni ni-bold-right"></i></button>

          </form>

        </div>

      </div>

    </div>
    <?php if($dataVista["datCumpliento"]->nIdTarea !=3): ?>
    <div class="card-body">

      <form role="form" class="form" id="fnRegistrarDetalle">

        <h6 class="heading-small text-muted mb-4">Datos del evaluación</h6>

        <div class="pl-lg-4">

          <div class="row">

            <input type="hidden" name="informe" value=<?php echo $dataVista["datakey"] ?>></input>

            <input type="hidden" name="cumplimiento" value=<?php echo $dataVista["datCumpliento"]->nId ?>></input>

            <input type="hidden" name="keycumplimiento" value="0"></input>

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

            <div class="col-lg-6" id="groupImcumplimiento" style="display: none;">



              <div class="form-group">



                <label class="form-control-label" for="input-idTipo">Motivo Imcumplimiento</label>



                <select class="mi-selector form-control" id="idMotivo" name="motivo" required>



                  <?php foreach ($dataVista["datImcumplimiento"] as $dat) : ?>



                    <option value="<?php echo $dat->cValor ?>"> <?php echo $dat->cDescripcion ?></option>

                  <?php endforeach ?>

                </select>

              </div>

            </div>

            <div class="col-lg-12">

              <div class="form-group">

                <label class="form-control-label" for="input-detalle">Detalle</label>

                <textarea rows="3" id="idDetalle" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" name="detalle" class="form-control" placeholder="Ingrese la Actividad."></textarea>



              </div>

            </div>



          </div>

          <div class="custom-control custom-control-alternative custom-checkbox">



            <div class="imgLoad" style="display:none">



              <img src="res/img/load-espera.gif" style="width:30px;height:30px" />



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
    <?php endif; ?>
    <?php if($dataVista["datCumpliento"]->nIdTarea ==3 && $dataVista["datCumpliento"]->nModelo!=2  ): ?>
    <div class="card-body">

      <form role="form" class="form" id="fnRegistrarDetalle">

        <h6 class="heading-small text-muted mb-4">Datos del evaluación</h6>

        <div class="pl-lg-4">

          <div class="row">

            <input type="hidden" name="informe" value=<?php echo $dataVista["datakey"] ?>></input>

            <input type="hidden" name="cumplimiento" value=<?php echo $dataVista["datCumpliento"]->nId ?>></input>

            <input type="hidden" name="keycumplimiento" value="0"></input>

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

            <div class="col-lg-6" id="groupImcumplimiento" style="display: none;">



              <div class="form-group">



                <label class="form-control-label" for="input-idTipo">Motivo Imcumplimiento</label>



                <select class="mi-selector form-control" id="idMotivo" name="motivo" required>



                  <?php foreach ($dataVista["datImcumplimiento"] as $dat) : ?>



                    <option value="<?php echo $dat->cValor ?>"> <?php echo $dat->cDescripcion ?></option>

                  <?php endforeach ?>

                </select>

              </div>

            </div>

            <div class="col-lg-12">

              <div class="form-group">

                <label class="form-control-label" for="input-detalle">Detalle</label>

                <textarea rows="3" id="idDetalle" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" name="detalle" class="form-control" placeholder="Ingrese la Actividad."></textarea>



              </div>

            </div>



          </div>

          <div class="custom-control custom-control-alternative custom-checkbox">



            <div class="imgLoad" style="display:none">



              <img src="res/img/load-espera.gif" style="width:30px;height:30px" />



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
    <?php endif; ?>
   






  </div>
  <?php if($dataVista["datCumpliento"]->nIdTarea !=3): ?>
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

            <th scope="col">Fecha Registro</th>

            <th scope="col"></th>

          </tr>

        </thead>

        <tbody class="list" id="tblCumpliento">

          <?php foreach ($dataVista["dataTable"] as $dat) : ?>

            <tr>

              <td class="budget"><?php echo $dat->descripcionTipo ?></td>

              <td class="budget"><?php echo $dat->detalle ?></td>

              <td class="budget"><?php echo $dat->dCreate ?></td>

              <td class="text-right">

                <div class="dropdown">

                  <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                    <i class="fas fa-ellipsis-v"> </i>

                  </a>

                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">

                    <a class="dropdown-item" href="javascript:ModificarCumplimiento(<?php echo $dataVista["datakey"] ?>, <?php echo $dat->nId ?>,<?php echo $dat->nIdCumplimiento ?>)">Modificar</a>

                    <a class="dropdown-item" href="javascript:EliminarCumplimiento(<?php echo $dataVista["datakey"] ?>, <?php echo $dat->nId ?>, <?php echo $dat->nIdCumplimiento ?>)">Eliminar</a>

                  </div>

                </div>

              </td>

            </tr>

          <?php endforeach ?>

        </tbody>

      </table>

    </div>

  </div>
  <?php endif; ?>
  <?php if($dataVista["datCumpliento"]->nIdTarea ==3 && $dataVista["datCumpliento"]->nModelo!=2): ?>
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

            <th scope="col">Fecha Registro</th>

            <th scope="col"></th>

          </tr>

        </thead>

        <tbody class="list" id="tblCumpliento">

          <?php foreach ($dataVista["dataTable"] as $dat) : ?>

            <tr>

              <td class="budget"><?php echo $dat->descripcionTipo ?></td>

              <td class="budget"><?php echo $dat->detalle ?></td>

              <td class="budget"><?php echo $dat->dCreate ?></td>

              <td class="text-right">

                <div class="dropdown">

                  <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                    <i class="fas fa-ellipsis-v"> </i>

                  </a>

                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">

                    <a class="dropdown-item" href="javascript:ModificarCumplimiento(<?php echo $dataVista["datakey"] ?>, <?php echo $dat->nId ?>,<?php echo $dat->nIdCumplimiento ?>)">Modificar</a>

                    <a class="dropdown-item" href="javascript:EliminarCumplimiento(<?php echo $dataVista["datakey"] ?>, <?php echo $dat->nId ?>, <?php echo $dat->nIdCumplimiento ?>)">Eliminar</a>

                  </div>

                </div>

              </td>

            </tr>

          <?php endforeach ?>

        </tbody>

      </table>

    </div>

  </div>
  <?php endif; ?>
  <hr>

  <div class="card">

    <!-- Card header -->

    <div class="card-header border-0">

      <h3 class="mb-0">Archivos Adjuntos</h3>

    </div>

    <div class="card-body">

      <div class="upload-div">

        <!-- File upload form -->

        <form id="uploadForm" enctype="multipart/form-data">

          <label>Adjuntar imagenes</label>

          <input type="hidden" name="informe" value=<?php echo $dataVista["datakey"] ?>></input>

          <input type="hidden" name="cumplimiento" value=<?php echo $dataVista["datCumpliento"]->nId ?>></input>

          <input type="file" name="images[]" class="form-control" id="fileInput" multiple accept="image/*">

          <input type="submit" name="submit" class="form-control btn btn-success" value="UPLOAD" />

        </form>



        <!-- Display upload status -->

        <div id="uploadStatus"></div>

      </div>

      <hr>





    </div>

  </div>

  <div class="row shortcuts px-1" id="imgAdj">



  </div>

</div>

<script src="res/dtgsk/js/user/registroDocumentoDetalle.js"></script>