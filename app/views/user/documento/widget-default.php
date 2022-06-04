<?php
$dataVista = $data["dataVista"];
?>
<script>
  var dataArreglo = <?php echo json_encode($dataVista["datInforme"]);  ?>;
  //var newEscalafon = JSON.parse(escalafon);
</script>
<link href="./res/css/pagination.css" rel="stylesheet" type="text/css">
<div class="col">

  <div class="row">
  </div>

  <div class="row">
    <div class="col-xl-2 col-md-6">
      <div class="card card-stats">
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h6 class="card-title text-uppercase text-muted mb-0">TOT.<BR>INSPECIONES</h6>
            </div>

            <div class="col-auto">
              <div>
                <a href="?r=reporte/rTotInsp" target="_BLANK" class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                  <i class="ni ni-chart-pie-35"> </i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    <div class="col-xl-2 col-md-6">

      <div class="card card-stats">
        <div class="card-body">

          <div class="row">

            <div class="col">
              <h6 class="card-title text-uppercase text-muted mb-0">MOTIVOS <BR> DE NI</h6>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                <a href="?r=reporte/rTotNI" target="_BLANK" class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                  <i class="ni ni-chart-pie-35"> </i>
                </a>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card card-stats">
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h6 class="card-title text-uppercase text-muted mb-0">TOTAL INF. <BR> REG.</h6>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                <a href="?r=reporte/reporteInformesRegistrados" target="_BLANK" class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                  <i class="ni ni-chart-pie-35"> </i>
                </a>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card card-stats">
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h6 class="card-title text-uppercase text-muted mb-0">REPORTE. <BR> CHARLA.</h6>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                <a href="?r=reporte/reporteCharlasRegistrados" target="_BLANK" class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                  <i class="ni ni-chart-pie-35"> </i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card card-stats">
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h6 class="card-title text-uppercase text-muted mb-0">REPORTE <BR> PARALIZACION</h6>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                <a href="?r=reporte/reporteParalizacion" target="_BLANK" class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                  <i class="ni ni-chart-pie-35"> </i>
                </a>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>
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

    <div class="table-responsive" style="min-width: 720px;">

      <table class="table align-content-between table-flush" style=" table-layout: fixed;">

        <thead class="thead-light">

          <tr>

            

            <th scope="col" style="width:22%;" class="sort" data-sort="budget">Tipo</th>

            <th scope="col" style="width:10%;" class="sort" data-sort="budget">N°</th>

            <th scope="col" style="width:30%;" class="sort" data-sort="budget">Usuario</th>

            <th scope="col" style="width:15%;" class="sort" data-sort="budget">Estado</th>

            <th scope="col" style="width:15%;" class="sort" data-sort="budget">Registro</th>

            <th scope="col" style="width:5%;"></th>

          </tr>

        </thead>

        <tbody class="list" id="tblInformes">

          <?php foreach ($dataVista["datInforme"] as $dat) : ?>

            <tr>

          

              <td><?php echo $dat->cTipo ?></td>

              <td><?php echo $dat->nIdAux ?></td>

              <td><?php echo $dat->cUser ?></td>

              <td><?php echo $dat->nFlag ?></td>

              <td><?php echo $dat->dregistro ?></td>

              <td>

                <div class="dropdown">

                  <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                    <i class="fas fa-ellipsis-v"> </i></a>

                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">

                    <a class="dropdown-item btnOnOff" href="?r=user/documentoResumen&doc=<?php echo $dat->nId ?>"> Resumen </a>

                    <a class="dropdown-item btnOnOff" href="?r=dowloand/descargar&doc=<?php echo $dat->nId ?>">Descargar </a>

                    <a class="dropdown-item btnPass" href="?r=user/documentoUpdate&doc=<?php echo $dat->nId ?>"> Modificar </a>

                    <a class="dropdown-item btnDeleteInforme" href="#" data="<?php echo $dat->nId ?>"> Eliminar </a>

                  </div>

                </div>

              </td>

            </tr>

          <?php endforeach ?>

        </tbody>
      </table>
    </div>
    <div id="paginar" style="padding-left:15px;">
    </div>

    <script src="res/js/pagination.js"></script>
    <script>
      $('#paginar').pagination({
        dataSource: dataArreglo,
        pageSize: 5,
        pageRange: null,
        showPageNumbers: true,
        callback: function(data, pagination) {
          // template method of yourself
          var html = template(data);
          $("#tblInformes").html(html);
        }
      });

      function template(data) {
        var dataTable = "";
        data.forEach(function(element) {

          dataTable += "<tr>";
          dataTable += "<td>" + element['cTipo'] + "</td>";
          dataTable += "<td>" + element['nIdAux'] + "</td>";
          dataTable += "<td>" + element['cUser'] + "</td>";
          dataTable += "<td>" + element['nFlag'] + "</td>";
          dataTable += "<td>" + element['dregistro'] + "</td>";
          dataTable += "<td><div class='dropdown'>";
          dataTable += "<a class='btn btn-sm btn-icon-only text-light' href='#' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>";
          dataTable += "<i class='fas fa-ellipsis-v'> </i></a>";
          dataTable += "<div class='dropdown-menu dropdown-menu-right dropdown-menu-arrow'>";
          dataTable += "<a class='dropdown-item btnOnOff' href='?r=user/documentoResumen&doc=" + element['nId'] + "'> Resumen </a>";
          dataTable += "<a class='dropdown-item btnOnOff' target='_Blank' href='?r=dowloand/descargar&doc=" + element["nId"] + "'> Descargar </a>";
          dataTable += "<a class='dropdown-item btnPass' href='?r=user/documentoUpdate&doc=" + element["nId"] + "'> Modificar </a>";
          dataTable += "<a class='dropdown-item btnDeleteInforme' href='#' data=" + element["nId"] + "'> Eliminar </a>";
          dataTable += "</div></div></td></tr>";

        });

        return dataTable;
      }
    </script>

  </div>

</div>