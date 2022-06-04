<?php



use Dompdf\Dompdf;



class dowloandController

{

    public $default_layout = "layoutDescarga.php";

    public $smsbot = "";

    public $nestadoDoi = 0;

    public $nestadoSMS = 0;

    public $nestadoCalendario = 0;

    public $creditocab = array();

    public $cuser = array();

    public $creditodet = array();

    public $codigo = "";

    public $nestado = 0;

    public $nEstadoLogueo = 0;

    public $cCargo = "";

    public $cargando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';



    public function descargarAction()

    {



        $idInforme = $_GET["doc"];



        if ($idInforme != "") {

            $informe = new informeData();

            $informe->nId =  $idInforme;

            $datInforme = $informe->getInformeById();

            $informe3 = new informeData();
            $informe3->key = $idInforme;
            $informe3->nSeccion = 21;
            $DataActas = $informe3->getActaImagenes();

            $data = new programaData();

            $data->nId = $datInforme->nIdPrograma;

            $programa = $data->getProgramasById();



            $empresa = new empresaData();

            $datEmpresa = $empresa->getEmpresaXId($datInforme->nIdEmpresa);



            $cumplientoRegistrados = new cumplimientoData();

            $cumplientoRegistrados->nIdInforme = $idInforme;

            $datCumplientoRegistrados = $cumplientoRegistrados->getCumplimientosByInforme();



            $DatNumMostrar = $datInforme->nIdAux;



            $informeCuadro_xd = $informe->getInformeDatos();



            $codigos   =  new codigosData();

            $codigos->cCodigo = 400;

            $datCodTrab = $codigos->getCodigos();



            $datosdeobra = new cumplimientoData();

            $datosdeobra->nIdInforme = $idInforme;

            $datosdeobra->nIdCumplimiento = 9;

            $datosObra = $datosdeobra->getCumplimientosRegistrados();



            $UUNN = new uunnData();

            $datUUNN = $UUNN->getUUNNId($datInforme->nIdUUNN);

            

            $supervision = new supervisionData();

            $datSupervision  = $supervision->getSupervisionId($datInforme->nIdSupervision);



            $responsable = new personaData();

            $datResponsable = $responsable->datUserDow($datInforme->nIdResponsable);



            $dataTrabajadores = $informe->getTrabajadoresSupervisadosInforme_REPORTE($idInforme);

            $dataTrabajadores_LEY=$informe->getTrabajadoresSupervisadosInforme_REPORTE_LEYENDA($idInforme);
            
            $dataUnidadesMoviles = $informe->getUnidadesMovilesSupervisadosInforme($idInforme);



            $dataVista = array(

                "datakey" => $idInforme,

                "datInforme" => $datInforme,

                "datEmpresa" => $datEmpresa,

                "datPrograma" => $programa,

                "datEmpresaEval" => $empresa,

                "datCumpliento" => $datCumplientoRegistrados,

                "datInformeCuadro" => $informeCuadro_xd,

                "datosObraCab" => $datCodTrab,

                "datosObraDet" => $datosObra,

                "datUUNN" => $datUUNN,

                "datSupervision" => $datSupervision,

                "datResponsable" => $datResponsable,

                "datNumAux" => $DatNumMostrar,

                "datTrabajadores" => $dataTrabajadores,

                "datTrabajadores_LEY" => $dataTrabajadores_LEY,
                
                "datUnidadesMoviles" => $dataUnidadesMoviles,
				
				"DataActas" => $DataActas

            );

            $meta = array("title" => "CONSORCIO NORTE", "subtitulo" => "Documentos", "menu" => 3, "newHeader" => 0);


            if ($datInforme->nIdTarea ==3 ){
                View::render($this, "user/descargar_2", array("meta" => $meta, "dataVista" => $dataVista));
            }else{
            View::render($this, "user/descargar", array("meta" => $meta, "dataVista" => $dataVista));
            }
        } else {

            Core::redir("./?r=user/index");

        }

    }

    public function descargarPDfAction()

    {



        // $dompdf = new Dompdf();

        // $dompdf->loadHtmlFile('http://www.apple.com');



        // // (Optional) Setup the paper size and orientation

        // $dompdf->setPaper('A4', 'landscape');



        // // Render the HTML as PDF

        // $dompdf->render();



        // // Output the generated PDF to Browser

        // $dompdf->stream();

    }

}

