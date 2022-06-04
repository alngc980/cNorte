<?php
$cliente = $data["datacliente"];
?>
<link rel="stylesheet" href="./res/css/propietario/home.css">

<div class="" style="background-image: url('res/img/fondo.jpg');">
    <div class="container">
        <div class="row">


            <div class="col-md-12" id="formPrin">
                <br>
                <bR>
                <bR>
                <div class="Hero padding--spacing-6 ">
                    <p>
                        <h2 class="text-center">

                            Reprogramaciones COVID-19</h2>
                    </p>
                    <br>
                    <br>
                </div>
            </div>

        </div>


        <!-- <h6><strong> Call center (065) 58 18 00 ó  0801 10 700</strong> </h6></CENTER> -->
    </div>
</div>

<div class="content">

    <div class="container-fluid">

        <div class="row">
            <div class="col-md-7 col-md-offset-3" id="formPrincipal">


                <div class="card">

                    <div class="col-md-12 text-center">
                        <br>
                        <p>
                            <h4 class="card-title" id="idCabTit">Solicitud de reversión</h4>
                        </p>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <form id="fnSolrev" method="post" action="" autocomplete="off">
                                <div class="col-md-10 col-md-offset-1" id="idForm_sol">
                                    <div id="formsolicitud">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group label-floating">
                                                    <label class="control-label">Número de crédito</label>
                                                    <input type="text" minlength="3" maxlength="18" value="<?php echo $cliente["credito"] ?>" name="idCredito" id="idCredito" class="form-control limpiar" readonly required />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group label-floating">
                                                    <label class="control-label" id="ilbldni">N° DNI / RUC</label>
                                                    <input type="text" minlength="8" maxlength="11" pattern="[0-9]+" id="idDOI" name="idDOI" value="<?php echo $cliente["Doi"] ?>" class="form-control limpiar" readonly required />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group label-floating">
                                                    <label class="control-label">Cliente</label>
                                                    <input type="text" name="idName" id="idName" value="<?php echo $cliente["name"] ?>" class="form-control limpiar" readonly />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group label-floating">
                                                    <label class="control-label">Telefono</label>
                                                    <input type="phone" minlength="6" maxlength="11" name="idFono" id="idFono" class="form-control limpiar" />
                                                </div>
                                            </div>
                                            <div class="col-md-12">

                                                <div class="form-group label-floating">
                                                    <label class="control-label">correo</label>
                                                    <input type="email" minlength="3" maxlength="100" name="idCorreo" id="idCorreo" class="form-control limpiar" />
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group label-floating">
                                                    <label class="control-label">Ingrese motivo de solicitud</label>
                                                    <textarea class="form-control" id="idMotivo" name="idMotivo" rows="3" minlength="10" maxlength="300" required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="col-md-6">
                                                    <a href="./?r=user/Ver" class="btn btn-round btn-default btn-sm">Volver</a>
                                                </div>
                                                <div class="col-md-6">
                                                    <button type="submit" class="btn btn-round btn-info btn-sm">Enviar Solicitud</button>
                                                </div>

                                            </div>


                                        </div>
                                    </div>

                                    <input type="hidden" value="" name="recaptcha_response" id="recaptchaResponse_cons">
                                    <div class="col-md-12">
                                        <div id="HIDDHCargaProceso_sol" class="text-center text-info"></div>
                                        <br>
                                    </div>
                                    <!-- <div class="col-md-4 col-md-offset-4">
                                        <a href="?r=user/PDFDOC" id="btnNuevaConsulta" class="btn btn-round btn-danger btn-sm pull-center">Ver Documento</a>
                                    </div> -->
                                    <br>

                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>


    </div>
</div>

<?php

require_once _VIEW_PATH_PRO_ . 'footer-index.php'; ?>
<script src="res/dtgsk/js/index/verificar.js"></script>