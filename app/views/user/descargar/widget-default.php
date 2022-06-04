<script src="https://parzibyte.github.io/ejemplos-javascript/html-a-pdf/html2pdf.bundle.min.js"></script>

<?php

$dataVista = $data["dataVista"];
$recorre = 0;

?>
<script type="text/javascript" src="res/js/package/dist/echarts.min.js"></script>
<style type="text/css">
  @media print {
   td h3{
      page-break-before: always;
    }
  }

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
        <td colspan="7" rowspan="3">
          <h1 style="text-align: center; color: #000;"><strong>CONSORCIO NORTE</strong></h1>
          <h2 style='text-align: center; color: #000'>
            Ejecución de obras y servicios de seguridad y salud en el trabajo</h2>
        </td>
        <td colspan="2"><strong>Programa:</strong></td>
      </tr>
      <tr>
        <td colspan="2"><strong>C&oacute;digo:</strong></td>
      </tr>
      <tr>
        <td colspan="2"><strong>Versi&oacute;n:</strong></td>
      </tr>

      <tr>
        <td colspan="3"><strong>VERSI&Oacute;N ANTERIOR:</strong>
          <?php echo $dataVista["datPrograma"]->cVersionN ?></td>
        <td colspan="4"><strong>MODIFICACI&Oacute;N VERSI&Oacute;N:
          </strong><?php echo $dataVista["datPrograma"]->userCreate ?></td>
        <td colspan="3"><strong>FECHA MODIFICACI&Oacute;N:
          </strong><?php echo substr($dataVista["datPrograma"]->dUpdate, 0, 10) ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td colspan="10" style="height: 5px;"></td>
      </tr>
      <tr class="title-td">
        <td class="tg-0pky tg-td" colspan="10" style='font-size: 20px; text-align: center;font-weight: bold;'>
          INFORME TÉCNICO N° <?php echo $dataVista["datNumAux"].'-CN-SST-'.substr($dataVista["datPrograma"]->dUpdate, 0, 4) ?>
        </td>
      </tr>
      <!-- <tr class="title-td">
        <td colspan="10" style='text-align: center;font-weight: bold;'>
          <?php echo $dataVista["datInforme"]->tarea ?></td>
        </tr> -->
      <tr>
        <td class="title-td"><strong>EMPRESA</strong></td>
        <td colspan="5"><?php echo $dataVista["datEmpresa"]->cNombre ?></td>
        <td class="title-td" colspan="2"><strong>UU. NN.</strong></td>
        <td colspan="2">
          <?php foreach ($dataVista["datUUNN"] as $dat) : ?><?php echo $dat->cNombre ?><?php endforeach ?>
        </td>
      </tr>
      <tr>
        <td colspan="1" class="title-td"><strong>ACTIVIDAD</strong></td>
        <td colspan="9"> <?php echo $dataVista["datInforme"]->cActividad ?></td>
      </tr>

      <tr>
        <td colspan="1" class="title-td"><strong>OBRA</strong></td>
        <td colspan="9"> <?php echo $dataVista["datInforme"]->cObra; ?></td>
      </tr>
      <tr>
        <td colspan="1" class="title-td"><strong>LUGAR</strong></td>
        <td colspan="5"> <?php echo $dataVista["datInforme"]->cLugar ?></td>
        <td colspan="2" class="title-td"><strong>&Aacute;REA</strong></td>
        <td colspan="2"><?php echo $dataVista["datInforme"]->cArea ?></td>
      </tr>
      <tr>
        <td class="title-td"><strong>RESPONSABLE</strong></td>
        <!-- <?php foreach ($dataVista["datUUNN"] as $dat) : ?><?php echo $dat->cNombre ?><?php endforeach ?> -->
        <td colspan="5"><?php echo $dataVista["datResponsable"]->cNombres . " " . $dataVista["datResponsable"]->cApellidos ?></td>
        <td colspan="2" class="title-td"><strong>FECHA</strong></td>
        <td colspan="2"><?php echo substr($dataVista["datInforme"]->cFecha, 0, 10) ?></td>
      </tr>
      <tr>
        <td colspan="1" class="title-td"><strong>TIPO DE <br> SUPERVISI&Oacute;N:</strong></td>
        <td colspan="2"><?php echo $dataVista["datSupervision"]->cNombre ?></td>
        <td colspan="1" class="title-td"><strong>N° ACTA</strong></td>
        <td colspan="2"> <?php echo $dataVista["datInforme"]->nActa ?></td>
        <td colspan="2" class="title-td"><strong>EMP. SUPER. AL<br>
            SERVICIO DE</strong></td>
        <td colspan="2"> <?php echo $dataVista["datInforme"]->cESAS ?></td>
      </tr>
      <tr>
        <td style="border-left: hidden;border-right: hidden;" colspan="10"></td>
      </tr>



      <?php
      $x_aux =0;
      foreach ($dataVista["datCumpliento"] as $dat) :
        $x_aux =$x_aux+1;
        if ($dat->cCodigo <> "") : ?>

          <!-- TITULOS -->
          <tr>
            <td style="border-left: hidden;border-right: hidden;border-top: hidden;" colspan="10"></td>
          </tr>
          <?php if ($x_aux == 1) : ?>
          <tr>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10"><?php echo $dat->cNombre ?></td>
          </tr> 
          <?php else: ?>
            <tr>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10"><h3><?php echo $dat->cNombre ?></h3></td>
          </tr>
          <?php endif; ?>
          <!-- END TITULOS -->
          <?php
          $datosRegistros = new cumplimientoData();
          $datosRegistros->nIdInforme = $_GET["doc"];
          $datosRegistros->nIdCumplimiento =  $dat->nId;
          $datdatosRegistros = $datosRegistros->getCumplimientosRegistrados();

          foreach ($datdatosRegistros as $datr) : ?>
            <!-- DETALLES -->
            <tr>
              <td class="tg-0pky text-center"><?php echo $datr->descripcionTipo ?></td>
              <td colspan="9"><?php echo $datr->detalle ?></td>
            </tr>
            <!--END DETALLES -->
          <?php
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
              <td colspan="10" class="imgPrimera">
                <?php foreach ($fotos as $imagenes) :
                ?>

                  <img src="<?php echo $imagenes->cRuta ?>" style="padding:3px ;" width="230px" height="300px">

                  <!-- <?php echo $imagenes->cRuta ?><br> -->

                <?php endforeach ?>
              </td>

            </tr>
          <?php } else { ?>

            <tr>
              <td colspan="10" class="imgPrimera">
              </td>
            </tr>
          <?php

          }

          ?>

          <tr style="border-left: hidden;border-right: hidden;">
          <?php endif;
        if ($dat->nId == 7) : ?>
          <tr>

            <!-- datCumpliento -->

            <td colspan="10" style="border-left: hidden;border-top: hidden;border-right: hidden;"></td>

          </tr>

          <tr>

            <!-- datCumpliento -->

            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10"><?php echo $dat->cNombre ?></td>

          </tr>

          <?php $datosRegistros = new cumplimientoData();
          $datosRegistros->nIdInforme = $_GET["doc"];
          $datosRegistros->nIdCumplimiento =  $dat->nId;
          $datdatosRegistros = $datosRegistros->getCumplimientosRegistrados(); ?>

          <tr>
            <!-- datCumpliento -->
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="5">CONCLUSIONES</td>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="5">RECOMENDACIONES</td>
          </tr>

          <tr>
            <td colspan="5">
              <?php foreach ($datdatosRegistros as $datr) :
                if ($datr->nValorTipo == 1) : ?>
                  - <?php echo $datr->detalle ?><br>
              <?php
                endif;
              endforeach ?>
            </td>
            <td colspan="5">
              <?php foreach ($datdatosRegistros as $datr) :
                if ($datr->nValorTipo == 2) : ?>
                  <?php echo $datr->detalle ?><br>
              <?php
                endif;
              endforeach ?>
            </td>
          </tr>
        <?php
        endif;
        if ($dat->nId == 8) : ?>
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
          </tr>
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
                  <img src="<?php echo $imagenes->cRuta ?>" style="padding:3px ;" width="230px" height="300px">
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

        if ($dat->nId == 9) : ?>

          <tr style="border-left: hidden;border-top: hidden;border-right: hidden;">
            <!-- datCumpliento -->
            <td colspan="10"></td>
          </tr>
          <tr>
            <!-- datCumpliento -->
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10"><?php echo $dat->cNombre ?></td>
          </tr>
          <tr>
            <?php
            foreach ($dataVista["datosObraCab"] as $dat_cab) : ?>

              <td lass="tg-0pky" colspan="5">
                <?php echo  $dat_cab->cDescripcion ?>
              </td>
              <td lass="tg-0pky" colspan="5">
                <?php
                foreach ($dataVista["datosObraDet"] as $dat_det) :
                  if ($dat_cab->cValor == $dat_det->nValorTipo) :
                ?>
                <?php echo "- " . $dat_det->detalle . "<br>";
                  endif;
                endforeach; ?>
              </td>
          </tr>
      <?php endforeach;
          endif; ?>
      <?php
        if ($dat->nId == 10) : ?>
        <tr>
          <td colspan="10"></td>
        </tr>
        <tr>
          <!-- datCumpliento -->
          <td style="text-align: center;font-weight: bold;background: #A5A5A5; " colspan="10"><?php echo $dat->cNombre ?></td>
        </tr>

        <tr>
          <td style="text-align: center;font-weight: bold;background: #A5A5A5;">N°</td>
          <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="2">Nombre del trabajador</td>
          <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="2">Cargo</td>
          <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="5">Normas Imcumplidas</td>
        </tr>

        <?php $recorre = 0; ?>

        <?php foreach ($dataVista["datTrabajadores"] as $datc) : ?>
          <?php $recorre = $recorre + 1;
            $array_codigos =  explode(',', $datc->cCodigo);
            $i_aux = 0;

          ?>
          <tr>
            <td class="text-center"><?php echo $recorre ?></td>
            <td colspan="2"><?php echo $datc->cNombres . " " . $datc->cApellidos ?></td>
            <td colspan="2"><?php echo $datc->cCargo ?></td>
            <?php

            foreach ($array_codigos as &$valor) {
              $i_aux = $i_aux + 1;
              if ($i_aux < 6) {
                echo '<td class="text-center">' . $valor . '</td>';
              }
            }
            if ($i_aux < 6) {
              $i_aux = 5 - $i_aux;
              for ($i = 1; $i <= $i_aux; $i++) {
                echo '<td class="text-center">-</td>';
              }
            }



            ?>


          </tr>

        <?php endforeach ?>
        <?php
          $recorre = 1;
          if (count($dataVista["datTrabajadores_LEY"]) > 0) : ?>
          <tr>
            <!-- datCumpliento LEY -->
            <td style="text-align: center;font-weight: bold;background: #A5A5A5; " colspan="10"><?php echo $dat->cNombre . ' LEYENDA' ?></td>
          </tr>

          <tr>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;">N°</td>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;">Código</td>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="4">Normas</td>
            <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="4">Observación</td>
          </tr>
          <?php foreach ($dataVista["datTrabajadores_LEY"] as $datc_ley) : ?>




            <tr>
              <td class="text-center"><?php

                                      echo $recorre ?></td>
              <td><?php echo $datc_ley->cCodigo ?></td>
              <td colspan="4"><?php echo  $datc_ley->cDescripcion ?></td>
              <td colspan="4"><?php echo  $datc_ley->cObservacion ?></td>
            </tr>

        <?php
              $recorre = $recorre + 1;
            endforeach;
          endif;
        ?>

      <?php endif; ?>



      <?php

        if ($dat->nId == 11) : ?>

        <td colspan="10"></td>

        <tr>

          <!-- datCumpliento -->

          <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10"><?php echo $dat->cNombre ?></td>

        </tr>

        <tr>

          <td style="text-align: center;font-weight: bold;background: #A5A5A5;">N° PLACA</td>
          <td colspan="2" style="text-align: center;font-weight: bold;background: #A5A5A5;">TIPO VEHICULO</td>
          <td colspan="7" style="text-align: center;font-weight: bold;background: #A5A5A5;">NORMA IMCUMPLIDA</td>
        </tr>

        <?php foreach ($dataVista["datUnidadesMoviles"] as $datc) : ?>
          <tr>
            <td><?php echo $datc->cPlaca ?></td>
            <td colspan="2"><?php echo $datc->cNombre ?></td>
            <td colspan="7"><?php echo $datc->cValor ?></td>
          </tr>

        <?php endforeach ?>
      <?php endif; ?>
    <?php endforeach ?>
    <tr>
      <td colspan="10"></td>
    </tr>
    <tr>
      <!-- datCumpliento -->
      <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10">CUADRO RESUMEN DE NIVEL DE CUMPLIMIENTO A NORMAS DE SEGURIDAD</td>
    </tr>
    <tr>
      <td colspan="3"></td>
      <td class="text-center">EPP</td>
      <td class="text-center">SE</td>
      <td class="text-center">UM</td>
      <td class="text-center">DOC</td>
      <td class="text-center">CP</td>
      <td class="text-center">CS</td>
      <td class="text-center">TOTAL</td>
    </tr>
    <?php foreach ($dataVista["datInformeCuadro"] as $datc) : ?>
      <tr>
        <td colspan="3"><?php echo $datc->DET ?></td>
        <td class="text-center"><?php echo round($datc->EPP, 2) ?></td>
        <td class="text-center"><?php echo round($datc->SE, 2) ?></td>
        <td class="text-center"><?php echo round($datc->UM, 2) ?></td>
        <td class="text-center"><?php echo round($datc->DOC, 2) ?></td>
        <td class="text-center"><?php echo round($datc->CP, 2) ?></td>
        <td class="text-center"><?php echo round($datc->CS, 2) ?></td>
        <td class="text-center"><?php echo round($datc->TOTAL, 2) ?></td>
      </tr>
    <?php endforeach ?>
    <tr>
      <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10">GR&Aacute;FICO</td>
    </tr>
    <tr>
      <td colspan="10">
        <div id="containerg" style="height: 420px;"></div>
      </td>
    </tr>
    <tr>
      <td colspan="2"></td>
      <td colspan="6">
        -EPP: EQUIPO DE PROTECCIÓN (PERSONAL Y/O COLECTIVO)<br>
        -SE: SEÑALIZACIÓN Y DELIMITACIÓN<br>
        -UM: UNIDADES MÓVILES<br>
        -DOC: DOCUMENTACION DE SEGURIDAD<br>
        -CP: CUMPLIMIENTO DE PROCEDIMIENTO DE trABAJO SEGURO<br>
        -CS:CONDICIONES DE SEGURIDAD<br>
      </td>
      <td colspan="2"></td>
    </tr>

    <?php foreach ($dataVista["DataActas"] as $datcd) : ?>
      <tr>
        <td style="text-align: center;font-weight: bold;background: #A5A5A5;" colspan="10">ACTA DE SUPERVISI&Oacute;N </td>
      </tr>
      <tr>
        <td colspan="10" style="text-align: center;">
          <img src="<?php echo "./" . $datcd->cRuta ?>" style="padding:5px;" width="900" height="1200">
        </td>
      </tr>
    <?php endforeach ?>

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