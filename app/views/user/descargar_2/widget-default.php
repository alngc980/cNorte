<script src="https://parzibyte.github.io/ejemplos-javascript/html-a-pdf/html2pdf.bundle.min.js"></script>

<?php

$dataVista = $data["dataVista"];
$recorre = 0;

?>
<script type="text/javascript" src="res/js/package/dist/echarts.min.js"></script>
<style type="text/css">
  .center_td {

    text-align: center !important;

  }


  table {
    table-layout: fixed;
    width: 1000px;
  }

  th,
  td {
    border: 1px solid blue;
    width: 109px;
    word-wrap: break-word;
  }

  .tg td {

    border-color: black;
    border-style: solid;
    border-width: 1px;
    font-family: Arial, sans-serif;
    overflow: hidden;

  }

  .tg .tg-0pky {
    border-color: inherit;
    text-align: left;
    border-color: black;
    border-style: solid;
    border-width: 1px;
    vertical-align: top
  }

  .tg-td {
    /* text-align: center; */
    color: #000;
  }

  td {
    /* text-align: center; */
    padding: 5px;
  }



  .title-td {

    background: #A5A5A5;

  }
</style>



<div id="content" style="padding: 5px; width:1200px ;">

  <input type="hidden" id="idKey" value="<?php echo $dataVista["datakey"] ?>"></input>

  <table class="tg tg-td" cellspacing="0" cellpadding="0" style="padding: 5px; width:1190px ;">


    <thead style="background: #9e9e9e;">
      <tr>
      </tr>
      <tr>
        <td rowspan="3" style="text-align: center;"><img src="./assets/img/CN-LOGO.jpg" width="90px" height="80px"></td>
        <td colspan="9" rowspan="3">
          <h1 style="text-align: center; color: #000;"><strong>CONSORCIO NORTE</strong></h1>
          <h2 style='text-align: center; color: #000'>
            Ejecución de obras y servicios de seguridad y salud en el trabajo</h2>
        </td>

      </tr>



    </thead>
    <tbody>
      <tr>
        <td colspan="10" style="height: 5px;"></td>
      </tr>
      <tr class="title-td">
        <td class="tg-0pky tg-td" colspan="10" style='font-size: 20px; text-align: center;font-weight: bold;'>
          INFORME N° <?php echo $dataVista["datNumAux"] ?>
        </td>
      </tr>
      <!-- <tr class="title-td">
        <td colspan="10" style='text-align: center;font-weight: bold;'>
          <?php echo $dataVista["datInforme"]->tarea ?></td>
        </tr> -->
      <tr>
        <td class="title-td"><strong>DIRIGIDO A EMPRESA</strong></td>
        <td colspan="5"><?php echo $dataVista["datEmpresa"]->cNombre ?></td>
        <td class="title-td" colspan="2"><strong>UU. NN.</strong></td>
        <td colspan="2">
          <?php foreach ($dataVista["datUUNN"] as $dat) : ?><?php echo $dat->cNombre ?><?php endforeach ?>
        </td>
      </tr>
      <tr>
        <td colspan="1" class="title-td"><strong>TEMA</strong></td>
        <td colspan="9"> <?php echo $dataVista["datInforme"]->cActividad ?></td>
      </tr>

      <tr>
        <td colspan="1" class="title-td"><strong>OBRA Y SERVICIO</strong></td>
        <td colspan="9"> <?php echo $dataVista["datInforme"]->cObra; ?></td>
      </tr>
      <tr>
        <td colspan="1" class="title-td"><strong>LUGAR</strong></td>
        <td colspan="5"> <?php echo $dataVista["datInforme"]->cLugar ?></td>
        <td colspan="2" class="title-td"><strong>FECHA</strong></td>
        <td colspan="2"><?php echo substr($dataVista["datInforme"]->cFecha, 0, 10) ?></td>
      </tr>
      <tr>
        <td class="title-td"><strong>RESPONSABLE</strong></td>
        <!-- <?php foreach ($dataVista["datUUNN"] as $dat) : ?><?php echo $dat->cNombre ?><?php endforeach ?> -->
        <td colspan="5"><?php echo $dataVista["datResponsable"]->cNombres . " " . $dataVista["datResponsable"]->cApellidos ?></td>
        <td colspan="2" class="title-td"><strong>EMPRESA</td>
        <td colspan="2" style=""> <?php echo $dataVista["datInforme"]->cESAS ?></td>
      </tr>
      <tr>


      </tr>


      <tr>
        <td style="border-left: hidden;border-right: hidden;border-top: hidden;" colspan="10"></td>
      </tr>


      <?php

      foreach ($dataVista["datCumpliento"] as $dat) :
        if ($dat->cCodigo <> "") : ?>
          <!-- TITULOS -->
          <tr>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10">REGISTRO DE DIFUSIÓN DE CHARLA DE INDUCCIÓN INICIO DE ACTIVIDADES
            </td>
          </tr>
          <tr>


          </tr>
          <tr>
            <td style="border-left: hidden;border-right: hidden;border-top: hidden;" colspan="10"></td>
          </tr>
          <tr>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10"><?php echo $dat->cNombre ?></td>
          </tr> <!-- END TITULOS -->
          <?php
          $datosRegistros = new cumplimientoData();
          $datosRegistros->nIdInforme = $_GET["doc"];
          $datosRegistros->nIdCumplimiento =  $dat->nId;
          $datdatosRegistros = $datosRegistros->getCumplimientosRegistrados();
          $i_aux = 1;
          foreach ($datdatosRegistros as $datr) : ?>
            <!-- DETALLES -->
            <tr>
              <td class="tg-0pky text-center"><?php echo $i_aux ?></td>
              <td colspan="9"><?php echo $datr->detalle ?></td>
            </tr>
            <!--END DETALLES -->
          <?php
            $i_aux = $i_aux + 1;
          endforeach ?>

          <!-- Nueva Carga de imagenes -->
          <?php
          $infoFotos = new informeData();
          $infoFotos->key =  $_GET["doc"];
          $infoFotos->nSeccion = $dat->nId;
          $fotos = $infoFotos->getImagenes();
          if (count($fotos) > 0) {
            $aux_fot = 0;
          ?>
            <tr>
              <td colspan="10">
                <?php foreach ($fotos as $imagenes) :
                ?>

                  <img src="<?php echo $imagenes->cRuta ?>" style="padding:3px ;" width="230px" height="300px">

                  <!-- <?php echo $imagenes->cRuta ?><br> -->

                <?php endforeach ?>
              </td>

            </tr>

          <?php } else { ?>

            <tr>
              <td colspan="10">
              </td>
            </tr>

          <?php

          }

          ?>

          <tr style="border-left: hidden;border-right: hidden;">
          <?php endif;
          ?>




          <?php
          if ($dat->nId == 24) : ?>
          <tr>
            <!-- datCumpliento -->
            <td colspan="10" style="border-left: hidden;border-right: hidden;"></td>
          </tr>
          <tr>
            <!-- datCumpliento -->
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10"><?php echo $dat->cNombre ?></td>
          </tr>
          <tr>
            <?php $datosRegistros = new cumplimientoData();
            $datosRegistros->nIdInforme = $_GET["doc"];
            $datosRegistros->nIdCumplimiento =  $dat->nId;
            $datdatosRegistros = $datosRegistros->getCumplimientosRegistrados(); ?>
            <td colspan="10">
              <?php foreach ($datdatosRegistros as $datr) : ?>
                - <?php echo $datr->detalle ?><br>
              <?php
              endforeach ?>
            </td>
          <tr>
            <!-- Nueva Carga de imagenes -->
            <?php
            $infoFotos = new informeData();
            $infoFotos->key =  $_GET["doc"];
            $infoFotos->nSeccion = $dat->nId;
            $fotos = $infoFotos->getImagenes();
            if (count($fotos) > 0) { ?>
              <td colspan="10">
                <?php foreach ($fotos as $imagenes) : ?>
                  <img src="<?php echo $imagenes->cRuta ?>" style="padding:3px ;" width="387px" height="500px">
                  <!-- <?php echo $imagenes->cRuta ?><br> -->
                <?php endforeach ?>
              </td>
            <?php } else { ?>
              <td colspan="10">
              </td>
            <?php
            }
            ?>
          </tr>

        <?php endif;
        ?>



      <?php endforeach ?>
      <tr>
        <td colspan="10"></td>
      </tr>




      <?php
      $i_aux2 = 0;
      foreach ($dataVista["DataActas"] as $datcd) :
        $i_aux2 = $i_aux2 + 1;
        if ($i_aux2 == 1) :
      ?><tr>
          <tr>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10">REGISTRO DE PERSONAL ASISTENTE A CHARLA</td>
          </tr>
        <?php endif ?>
        
          <td colspan="10" style="text-align: center;">
            <img src="<?php echo "./" . $datcd->cRuta ?>" style="padding:5px;" width="900" height="1200">
          </td>
       
      <?php endforeach ?>
      </tr>
    </tbody>
  </table>
</div>



<script src="res/dtgsk/js/user/documentoResumen.js"></script>

<script>
  $(document).ready(function() {

    //console.log( "ready!" );

    // window.print();

    setTimeout(function() {

      window.print();

    }, 1500);

  });
</script>