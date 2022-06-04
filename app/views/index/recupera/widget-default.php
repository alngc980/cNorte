<script src='https://www.google.com/recaptcha/api.js?render=6LfYSvcUAAAAAHUTP5Bsu5W-9l_-Diufdmhx0bza'></script>
<!-- <script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v7.0&appId=543280202672447&autoLogAppEvents=1"></script> -->

<body class="landing-page">
    <?php require_once _VIEW_PATH_ . 'nav-index.php'; ?>
    <div class="header-1" style="z-index:20">
        <div class="page-header header-filter" style="background-image: url('res/img/fondo.jpg');">
            <div class="container">
                <div class="row">
                   
                    <div class="col-md-4 col-md-offset-4" style="margin-top:80px" id="formPrin">
                        <div class="card card-contact">

                            <div class="header header-raised header-primary primario-w text-center">
                                <h4 class="card-title" id="idCabTit">Recuperación de Clave</h4>
                            </div>
                            <div class="card-content">
                                <div class="row">
                                    
                                    <form id="fnRecupera" method="post" action="" autocomplete="off">
                                        <div class="col-md-12 " id="idForm_ver">
                                            <div class="form-group label-floating">
                                                <label class="control-label" id="ilbldni">Ingrese su N° DNI / RUC</label>
                                                <input type="text" minlength="8" maxlength="11" pattern="[0-9]+" id="idDOI" name="idDOI" class="form-control limpiar" required />
                                            </div>
                                            <!-- <div class="form-group label-floating">
                                                <label class="control-label">Teléfono Celular</label>
                                                <input type="text" minlength="9" maxlength="9" name="idFono" id="idFono" class="form-control limpiar" required />
                                            </div> -->
                                            <input type="hidden" value="" name="recaptcha_response" id="recaptchaResponse">

                                            <div class="col-md-offset-3">
                                                <!-- <button type="button" class="btn btn-danger pull-left BtngenSalir">Voler</button> -->
                                                <button type="submit" class="btn btn-success">Recuperar</button>
                                            </div>
                                            
                                            <div class="col-md-12">
                                                <div id="HIDDHCargaProceso_" class="text-center text-danger"></div>
                                            </div>
                                        </div>
                                    </form>
                                   
                                </div>
                            
                            </div>
                        </div>
                    </div>

                </div>


                <!-- <h6><strong> Call center (065) 58 18 00 ó  0801 10 700</strong> </h6></CENTER> -->
            </div>
        </div>
    </div>

    <div class="container">
        <div class="features-3">
            <div class="row">
                <div class="col-md-12">
                    <H5 class="text-center">Todos juntos contra el coronavirus #YOMEQUEDOENCASA</H5>
                    <p class="text-center">
                        En caso de no estar de acuerdo con su reprogramación solicite <span="title">revertir</span> llamando al Fonomaynas (<a href="tel:065-581800">065-581800</a> ó <a href="tel:0801-10700">0801-10700</a>) o personalmente en nuestra red de agencias.
                    </p>
                </div>
            </div>
        </div>
    </div>







    <?php require_once _VIEW_PATH_ . 'footer-index.php'; ?>
    <script src="res/dtgsk/js/index/recupera.js"></script> 
</body>
