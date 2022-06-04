<?php
$dataVista = $data["dataVista"];
?>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>
<div class="col-xl-12 order-xl-2">
  <div class="card">
    <div class="card-header">
      <div class="row align-items-center">
        <div class="col-8">
          <h3 class="mb-0">Informe Técnico N° <?php echo $dataVista["NumInforme"] ?> </h3>
          <input type="hidden" id="idKey" value="<?php echo $dataVista["datakey"] ?>"></input>
        </div>

      </div>
    </div>
    <div class="card-body">
      <div class="progress-wrapper">
        <div class="progress-info">
          <div class="progress-label">
            <h2>CUADRO RESUMEN DE NIVEL DE CUMPLIMIENTO A NORMAS DE SEGURIDAD</h2>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <!-- Card header -->
    <div class="card-header border-0">
      <h3 class="mb-0">CUADRO DE RESUMEN</h3>
    </div>
    <!-- Light table -->
    <div class="table-responsive">
      <table class="table align-items-center table-flush">
        <thead class="thead-light">
          <tr>
            <th scope="col" class="sort" data-sort="budget"></th>
            <th scope="col" class="sort" data-sort="budget">EPP</th>
            <th scope="col" class="sort" data-sort="budget">SE</th>
            <th scope="col" class="sort" data-sort="budget">UM</th>
            <th scope="col" class="sort" data-sort="budget">DOC</th>
            <th scope="col" class="sort" data-sort="budget">CP</th>
            <th scope="col" class="sort" data-sort="budget">CS</th>
            <th scope="col">TOTAL</th>
          </tr>
        </thead>
        <tbody class="list" id="tblInformes">
          <?php foreach ($dataVista["datInforme"] as $dat) : ?>
            <tr>
              <td class="budget"><?php echo $dat->DET ?></td>
              <td class="budget"><?php echo round($dat->EPP, 2) ?></td>
              <td class="budget"><?php echo round($dat->SE, 2) ?></td>
              <td class="budget"><?php echo round($dat->UM, 2) ?></td>
              <td class="budget"><?php echo round($dat->DOC, 2) ?></td>
              <td class="budget"><?php echo round($dat->CP, 2) ?></td>
              <td class="busdget"><?php echo round($dat->CS, 2) ?></td>
              <td class="busdget"><?php echo round($dat->TOTAL, 2) ?></td>
            </tr>
          <?php endforeach ?>
        </tbody>
      </table>
    </div>

  </div>
  <div class="card">
    <!-- Card header -->
    <div class="card-header border-0">
      <h3 class="mb-0">GRÁFICO RESUMEN</h3>
    </div>
    <!-- Light table -->
    <div class="card-body">



      <div id="containerg" style="height: 500px"></div>
      <div class="container mt--2 pb-5">
        <div class="row justify-content-center">
          <div class="col-lg-6 col-md-12">
            <ul class="navbar-nav">
              <li class="nav-item ">
                <a href="#" class="badge" style="background:red"> </a>EPP: EQUIPO DE PROTECCIÓN (PERSONAL Y/O COLECTIVO)
              </li>
              <li class="nav-item ">
                <a href="#" class="badge" style="background:blue"> </a>SE: SEÑALIZACIÓN Y DELIMITACIÓN
              </li>
              <li class="nav-item ">
                <a href="#" class="badge" style="background:skyblue"> </a>UM: UNIDADES MÓVILES
              </li>
              <li class="nav-item ">
                <a href="#" class="badge" style="background:orange"> </a>DOC: DOCUMENTACION DE SEGURIDAD
              </li>
              <li class="nav-item ">
                <a href="#" class="badge" style="background:gray"> </a>CP: CUMPLIMIENTO DE PROCEDIMIENTO DE TRABAJO SEGURO
              </li>
              <li class="nav-item">
                <a href="#" class="badge" style="background:violet"> </a>CS:CONDICIONES DE SEGURIDAD
              </li>


            </ul>
          </div>

        </div>
      </div>

    </div>
  </div>
</div>
<script src="res/dtgsk/js/user/documentoResumen.js"></script>
