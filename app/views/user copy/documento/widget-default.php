<?php 
    $dataVista = $data["dataVista"]; 
?>
<div class="col">
<div class="row">
 
    
  </div>
  <div class="row">
    <div class="col-xl-3 col-md-6">
      <div class="card card-stats">
        <!-- Card body -->
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-0">Total <br>Documentos</h5>
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
    <!-- <div class="col-xl-3 col-md-6">
      <div class="card card-stats">
     
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-0">Documentos<BR> Desactivados</h5>
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
    </div> -->
  </div>
  <a href="#notifica" id="link"></a>
  <div id="notifica">
   
  </div>

  <div class="card">
    <!-- Card header -->
    <div class="card-header border-0">
      <h3 class="mb-0">Lista de Documentos</h3>
    </div>
    <!-- Light table -->
    <div class="table-responsive">
      <table class="table align-items-center table-flush">
        <thead class="thead-light">
          <tr>
            <th scope="col" class="sort" data-sort="budget">#</th>
            <th scope="col" class="sort" data-sort="budget">Tipo</th>
            <th scope="col" class="sort" data-sort="budget">N°</th>
            <th scope="col" class="sort" data-sort="budget">Usuario</th>
            <th scope="col" class="sort" data-sort="budget">Estado</th>
            <th scope="col" class="sort" data-sort="budget">Registro</th>
            <th scope="col" class="sort" data-sort="budget">Actualizado</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody class="list" id="tblInformes">
          <?php foreach($dataVista["datInforme"] as $dat) :?>
          <tr>
              <td class="budget"><?php echo $dat->nFila ?></td>
              <td class="budget"><?php echo $dat->cTipo ?></td>
              <td class="budget"><?php echo $dat->nId ?></td>
              <td class="budget"><?php echo $dat->cUser ?></td>
              <td class="budget"><?php echo $dat->nFlag ?></td>
              <td class="budget"><?php echo $dat->dregistro ?></td>
              <td class="busdget"><?php echo $dat->dupdate ?></td>
              <td>
              <div class="dropdown">
                  <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-ellipsis-v"> </i></a>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                    <a class="dropdown-item btnOnOff"  href="?r=user/documentoResumen&doc=<?php echo $dat->nId?>"> Resumen </a> 
                    <a class="dropdown-item btnOnOff" href="#" data="undefined"> Imprimir </a>      
                    <a class="dropdown-item btnPass" href="?r=user/documentoUpdate&doc=<?php echo $dat->nId?>"> Modificar </a>
                    <a class="dropdown-item btnDelete" href="#" data="undefined"> Eliminar </a>
                  </div>  
              </div>
              </td>
          </tr>
          <?php endforeach ?>
        </tbody>
      </table>
    </div>
    <!-- Card footer -->
    <!-- <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                      <span class="sr-only">Previous</span>
                    </a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">
                      <i class="fas fa-angle-right"></i>
                      <span class="sr-only">Next</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div> -->
  </div>
</div>
