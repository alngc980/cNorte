<?php
class reporteController
{
    public $default_layout = "layoutuser.php";

    public $smsbot = "";

    public $nestadoDoi = 0;

    public $nestadoSMS = 0;

    public $nestadoCalendario = 0;

    public $creditocab = array();

    public $creditodet = array();

    public $codigo = "";

    public $nestado = 0;

    public $cargando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

    public function rTotInspAction()
    {
        header("Pragma: public");
        header("Expires: 0");
        $DateAndTime = date('m-d-Y h:i:s a', time());
        $filename = "Reporte_inspecciones_" . $DateAndTime . ".xls";
        header("Content-type: application/x-msdownload");
        header("Content-Disposition: attachment; filename=$filename");
        header("Pragma: no-cache");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

        $documento = new informeData();

        $dataReporte = $documento->getReporteInspeccion();
        $text = "";
        $i = 0;
        $borde = " style='border: 1px solid #000;";
        $fYelow = " backgroud: yellow;";
        foreach ($dataReporte as $key => $val) {
            $i = ($i + 1);
            $text .= "<tr>";
            $text .= "<td" . $borde . "'>" . $i;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->CNOMBRE;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->ENE;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->FEB;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->MAR;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->ABR;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->MAY;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->JUN;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->JUL;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->AGO;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->SET;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->OCT;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->NOV;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->DIC;
            $text .= "</td>";
            $text .= "<td" . $borde . "'>" . $val->TOT;
            $text .= "</td>";
            $text .= "</tr>";
        }


        echo "
                <table>
                <tbody>
                <tr>
                    <td colspan='13'>
                    <h3>REPORTE DE CANTIDAD DE INSPECCIONES</h3>
                    </td>
                </tr>
                <tr>
                    <td style='border: 1px solid #000;background-color: #1fbf02;'>ENSA " .
            date("Y") . "
                    </td>
                </tr>
                <tr>
                <td rowspan='2' style=' border: 1px solid #000;background-color: #1fbf02;'>POS</td>
                <td rowspan='2' style='width: 350px;border: 1px solid #000;background-color: #1fbf02;'>CONTRATISTA</td>
                <td colspan='13' style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>AÃ±O " . date("Y") . "</td>
                </tr>
                <tr>
                <td style=' border: 1px solid #000;'>ENERO</td>
                <td style=' border: 1px solid #000;'>FEBRERO</td>
                <td style=' border: 1px solid #000;'>MARZO</td>
                <td style=' border: 1px solid #000;'>ABRIL</td>
                <td style=' border: 1px solid #000;'>MAYO</td>
                <td style=' border: 1px solid #000;'>JUNIO</td>
                <td style=' border: 1px solid #000;'>JULIO</td>
                <td style=' border: 1px solid #000;'>AGOSTO</td>
                <td style=' border: 1px solid #000;'>SETIEMBRE</td>
                <td style=' border: 1px solid #000;'>OCTUBRE</td>
                <td style=' border: 1px solid #000;'>NOVIEMBRE</td>
                <td style=' border: 1px solid #000;'>DICIEMBRE</td>
                <td style=' border: 1px solid #000;'>TOTAL</td>
                </tr>" .
            $text
            . "
                </tbody>
                </table>";
    }
    public function rTotNIAction()
    {

        header("Pragma: public");
        header("Expires: 0");
        $DateAndTime = date('m-d-Y h:i:s a', time());
        $filename = "Reporte_inspecciones_" . $DateAndTime . ".xls";
        header("Content-type: application/x-msdownload");
        header("Content-Disposition: attachment; filename=$filename");
        header("Pragma: no-cache");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

        $documento = new informeData();

        $dataReporteCab = $documento->getReporteNICab();
        $dataReporteCod = $documento->getReporteNICod();
        $text = "";
        $textcod = "";
        $i = 1;
        $borde = " style='border: 1px solid #000;";
        $fYelow = " backgroud: yellow;";
        foreach ($dataReporteCab as $key => $val) {
            $i = $i + 1;
            $text .= "<td" . $borde . "'>" . $val->cnombre;
            $text .= "</td>";
        }
        $x = 0;

        foreach ($dataReporteCod as $key => $valx) {
            $x = $x + 1;
            $tot = 0;
            $textcod .= "<tr>";
            $textcod .= "<td" . $borde . "'>" . $x;
            $textcod .= "</td>";
            $textcod .= "<td" . $borde . "'>" . $valx->cDescripcion;
            $textcod .= "</td>";
            foreach ($dataReporteCab as $key => $valy) {

                $dataReporteCodDato = $documento->getReporteDatoNI($valy->nid, $valx->cValor);
                //var_dump($dataReporteCodDato);
                $tot = $tot + $dataReporteCodDato->tot;
                $textcod .= "<td" . $borde . "'>" . $dataReporteCodDato->tot;
                $textcod .= "</td>";
            }
            $textcod .= "<td" . $borde . "'>" . $tot;
            $textcod .= "</td>";
            $textcod .= "</tr>";
        }




        echo "
<table>
<tbody>
<tr>
    <td colspan='13'>
    <h3>REPORTE DE REGISTROS NI</h3>
    </td>
</tr>
<tr>
<td rowspan='2' style=' border: 1px solid #000;background-color: #1fbf02;'>ITEM</td>
<td rowspan='2' style='width: 350px;border: 1px solid #000;background-color: #1fbf02;'>MOTIVO INCUMPLIMIENTO</td>
<td colspan=" . $i . " style='border: 1px solid #000;background-color: #1fbf02;'>EMPRESAS</td>
</tr>
<tr>" .
            $text . "
<td style=' border: 1px solid #000;'>TOTAL</td>
</tr>" .
            $textcod
            . "
</tbody>
</table>";
    }

    public function reporteInformesRegistradosAction()
    {
        // header("Pragma: public");
        // header("Expires: 0");
        // $DateAndTime = date('m-d-Y h:i:s', time());
        // $filename = "Reporte Registrados " . $DateAndTime . ".xls";
        // header("Content-type: application/x-msdownload charset=utf-8" );
        // header("Content-Disposition: attachment; filename=$filename");
        // header("Pragma: no-cache");
        // header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

        $DateAndTime = date('m-d-Y h:i:s', time());
        $filename = "Reporte Registrados " . $DateAndTime . ".xls";
        header("Content-Type: application/vnd.ms-excel; charset=utf-8");
        header("Content-Disposition: attachment; filename=$filename");  //File name extension was wrong
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Cache-Control: private", false);

        $informe = new inf_cumplimiento_desData();
        $dataReporte = $informe->getDatosInforme();

        $text = "";
        $i = 0;
        $text = "";
        foreach ($dataReporte as $informes) {
            //Obtenemos las informacion por infome
            $informe = new informeData();
            $informe->nId =  $informes->nId;
            $datInforme = $informe->getInformeById_reporte();

            $data = new programaData();
            $data->nId = $datInforme->nIdPrograma;
            $datPrograma = $data->getProgramasById();

            $empresa = new empresaData();
            $datEmpresa = $empresa->getEmpresaXId($datInforme->nIdEmpresa);

            $informeCuadro = $informe->getInformeDatos();

            $cumplientoRegistrados = new cumplimientoData();
            $cumplientoRegistrados->nIdInforme = $informes->nId;
            $datCumplientoRegistrados = $cumplientoRegistrados->getCumplimientosByInforme();

            $codigos   =  new codigosData();
            $codigos->cCodigo = 400;
            $datCodTrab = $codigos->getCodigos();

            $datosdeobra = new cumplimientoData();
            $datosdeobra->nIdInforme = $informes->nId;
            $datosdeobra->nIdCumplimiento = 9;
            $datosObra = $datosdeobra->getCumplimientosRegistrados();

            $UUNN = new uunnData();
            $datUUNN = $UUNN->getUUNNId($datInforme->nIdUUNN);

            $supervision = new supervisionData();
            $datSupervision  = $supervision->getSupervisionId($datInforme->nIdUUNN);

            $responsable = new personaData();
            $datResponsable = $responsable->datUser($datInforme->nIdResponsable);

            $dataTrabajadores = $informe->getTrabajadoresSupervisadosInforme($informes->nId);
            $dataUnidadesMoviles = $informe->getUnidadesMovilesSupervisadosInforme($informes->nId);

            $objInforme = (object)$datInforme;
            $objPrograma = (object)$datPrograma;
            $objEmpresa = (object)$datEmpresa;
            $objSupervision = (object)$datSupervision;
            //$objCumplimientoRegistrados = (object)$datCumplientoRegistrados;

           

            $i = ($i + 1);
            $text .= "<tr>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $i;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objEmpresa->cNombre;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cObra;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $informes->cTipo . " " . $objInforme->nIdAux;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objSupervision->cNombre;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cArea;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cActividad;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cFecha;
            $text .= "</td>";

            $subtable = "<table>";
            foreach ($informeCuadro as $dataCuadro) {
                $subtable .= "<tr>";
                $subtable .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $dataCuadro->DET;
                $subtable .= "</td>";
                $subtable .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $dataCuadro->EPP;
                $subtable .= "</td>";
                $subtable .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $dataCuadro->SE;
                $subtable .= "</td>";
                $subtable .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $dataCuadro->UM;
                $subtable .= "</td>";
                $subtable .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $dataCuadro->DOC;
                $subtable .= "</td>";
                $subtable .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $dataCuadro->CP;
                $subtable .= "</td>";
                $subtable .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $dataCuadro->CS;
                $subtable .= "</td>";
                $subtable .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $dataCuadro->TOTAL;
                $subtable .= "</td>";
                $subtable .= "</tr>";
            }
            $subtable .= "</table>";

            $text .= "<td colspan='8' style='border: 1px solid #000;'>" . $subtable;
            $text .= "</td>";
            $text .= "</tr>";
        }

        echo "<table>
                <tbody>
                    <tr>
                        <td colspan='16'>
                            <h3>REPORTE DE INFORMES REGISTRADOS</h3>
                        </td>
                    </tr>
                    <tr>
                        <th rowspan='2' style='border: 1px solid #000;background-color: #1fbf02;'>Item</td>
                        <th rowspan='2' style='width: 350px;border: 1px solid #000;background-color: #1fbf02;'>Empresa</td>
                        <th rowspan='2' style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Obra/Servicio</td>
                        <th rowspan='2' style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Informe</td>
                        <th rowspan='2' style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Tipo</td>
                        <th rowspan='2' style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>&Aacute;rea</td>
                        <th rowspan='2' style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Activiadad</td>
                        <th rowspan='2' style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Fecha</td>
                        <th colspan='8' style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Cumplimiento</td>
                    </tr>
                    <tr>
                        <th style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'></td>
                        <th style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>EPP</td>
                        <th style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>SE</td>
                        <th style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>UM</td>
                        <th style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>DOC</td>
                        <th style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>CP</td>
                        <th style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>CS</td>
                        <th style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>TOTAL</td>
                    </tr>
                    " . $text . "
                </tbody>
            </table>";
    }
    public function reporteCharlasRegistradosAction()
    {
        
        $DateAndTime = date('m-d-Y h:i:s', time());
        $filename = "Reporte Charlas Registrados " . $DateAndTime . ".xls";
        header("Content-Type: application/vnd.ms-excel; charset=utf-8");
        header("Content-Disposition: attachment; filename=$filename");  //File name extension was wrong
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Cache-Control: private", false);

        $informe = new inf_cumplimiento_desData();
        $dataReporte = $informe->getDatosCharla();

        $text = "";
        $i = 0;
        $text = "";
        foreach ($dataReporte as $informes) {
            //Obtenemos las informacion por infome
            $informe = new informeData();
            $informe->nId =  $informes->nId;
            $datInforme = $informe->getInformeById_reporte_charlas();

            $data = new programaData();
            $data->nId = $datInforme->nIdPrograma;
            $datPrograma = $data->getProgramasById();

            $empresa = new empresaData();
            $datEmpresa = $empresa->getEmpresaXId($datInforme->nIdEmpresa);


            $cumplientoRegistrados = new cumplimientoData();
            $cumplientoRegistrados->nIdInforme = $informes->nId;
            $datCumplientoRegistrados = $cumplientoRegistrados->getCumplimientosByInforme();

           
            $datosdeobra = new cumplimientoData();
            $datosdeobra->nIdInforme = $informes->nId;
            $datosdeobra->nIdCumplimiento = 9;
            $datosObra = $datosdeobra->getCumplimientosRegistrados();

            $UUNN = new uunnData();
            $datUUNN = $UUNN->getUUNNId($datInforme->nIdUUNN);

            $supervision = new supervisionData();
            $datSupervision  = $supervision->getSupervisionId($datInforme->nIdUUNN);

            $responsable = new personaData();
            $datResponsable = $responsable->datUser($datInforme->nIdResponsable);

            $dataTrabajadores = $informe->getTrabajadoresSupervisadosInforme($informes->nId);
            $dataUnidadesMoviles = $informe->getUnidadesMovilesSupervisadosInforme($informes->nId);

            $objInforme = (object)$datInforme;
            $objPrograma = (object)$datPrograma;
            $objEmpresa = (object)$datEmpresa;
            $objSupervision = (object)$datSupervision;
            //$objCumplimientoRegistrados = (object)$datCumplientoRegistrados;

           

            $i = ($i + 1);
            $text .= "<tr>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $i;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objEmpresa->cNombre;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cObra;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $informes->cTipo . " " . $objInforme->nIdAux;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objSupervision->cNombre;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cArea;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cActividad;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cFecha;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cNombres.' '.$objInforme->cApellidos;
            $text .= "</td>";
            $text .= "</tr>";
        }

        echo "<table>
                <tbody>
                    <tr>
                        <td colspan='16'>
                            <h3>REPORTE DE CHARLA DE SEGURIDAD</h3>
                        </td>
                    </tr>
                    <tr>
                        <th  style='border: 1px solid #000;background-color: #1fbf02;'>Item</td>
                        <th  style='width: 350px;border: 1px solid #000;background-color: #1fbf02;'>Empresa</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Obra/Servicio</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>UU.NN</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Tipo</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>&Aacute;rea</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Tema</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Fecha</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Facilitador Responsable</td>
                    </tr>
                    " . $text . "
                </tbody>
            </table>";
    }
    public function reporteParalizacionAction()
    {
        
        $DateAndTime = date('m-d-Y h:i:s', time());
        $filename = "Reporte Paralizacion " . $DateAndTime . ".xls";
        header("Content-Type: application/vnd.ms-excel; charset=utf-8");
        header("Content-Disposition: attachment; filename=$filename");  //File name extension was wrong
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Cache-Control: private", false);

        $informe_des = new inf_cumplimiento_desData();
        $dataReporte = $informe_des->getDatosParalizacion();

        $text = "";
        $i = 0;
        $text = "";
        foreach ($dataReporte as $informes) {
            //Obtenemos las informacion por infome
            $informe = new informeData();
            $informe->nId =  $informes->nIdInforme;
            $datInforme = $informe->getInformeById_reporte_paralizacion();

            $data = new programaData();
            $data->nId = $datInforme->nIdPrograma;
            $datPrograma = $data->getProgramasById();

            $empresa = new empresaData();
            $datEmpresa = $empresa->getEmpresaXId($datInforme->nIdEmpresa);


            $cumplientoRegistrados = new cumplimientoData();
            $cumplientoRegistrados->nIdInforme = $informes->nIdInforme;
            $datCumplientoRegistrados = $cumplientoRegistrados->getCumplimientosByInforme();

           
            $datosdeobra = new cumplimientoData();
            $datosdeobra->nIdInforme = $informes->nIdInforme;
            $datosdeobra->nIdCumplimiento = 9;
            $datosObra = $datosdeobra->getCumplimientosRegistrados();

            $UUNN = new uunnData();
            $datUUNN = $UUNN->getUUNNId($datInforme->nIdUUNN);

          
            $dataConRec = $informe_des->getDatosConclusiones_Recomendaciones($informes->nIdInforme);

            $objInforme = (object)$datInforme;
            $objEmpresa = (object)$datEmpresa;
            $text_aux='';
           
            foreach ($dataConRec as $informes_aux) {
               
                $text_aux .=$informes_aux->detalle.'<br>';
            }
           
           

            $i = ($i + 1);
            $text .= "<tr>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $i;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objEmpresa->cNombre;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cArea;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $objInforme->cActividad;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . substr($objInforme->cFecha,0,10);
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $datUUNN->cNombre;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $informes->cDescripcion;
            $text .= "</td>";
            $text .= "<td style='border: 1px solid #000; vertical-align: middle;'>" . $text_aux;
            $text .= "</td>";
            $text .= "</tr>";
        }

        echo "<table>
                <tbody>
                    <tr>
                        <td colspan='8'>
                            <h3>REPORTE DE PARALIZACIÓN</h3>
                        </td>
                    </tr>
                    <tr>
                        <th  style='border: 1px solid #000;background-color: #1fbf02;'>Item</td>
                        <th  style='width: 350px;border: 1px solid #000;background-color: #1fbf02;'>CONTRATISTA</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Área que supervisa</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>ACTIVIDAD</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>FECHA</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>UU.NN</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Motivo Paralización</td>
                        <th  style='text-align: center;border: 1px solid #000;background-color: #1fbf02;'>Acciones complementarias</td>
                    </tr>
                    " . $text . "
                </tbody>
            </table>";
    }
}
