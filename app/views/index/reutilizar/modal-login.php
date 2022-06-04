
<!--*******************************LOGIN general*******************************-->
<!-- <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-login sombra-2">
    
        <div class="modal-login-top rt">
            <div class="imagen-login c-5 f-5"></div>
        </div>
        <div class="modal-login-down rd">
            <div class="modal-login-titulo">INICIAR SESIÓN</div>
            <div class="modal-login-subtitulo"><strong>Bienvenido</strong></div>
            <div class="modal-login-formulario">
            <form id="fnProccesslogin">
                <div class="modal-login-form-input">
                <i class="material-icons">email</i><input type="email" class="login" id="lemail" name="email" required>
                </div>
                <div class="modal-login-form-input">
                <i class="material-icons">lock</i><input type="password" class="login" id="lpassword" name="password"  autocomplete="on" required>
                </div>
                
                <div class="modal-login-form-input">
                    <a href="" id="fnbtnloginPro_index">
                        <div class="icon icon-text btnLogin" id="btnlogin_icono">
                            <i class="material-icons billete zero-margin"style="font-size: 10vh !important">fingerprint</i>
                        </div>
                    </a>
                </div>
                <div class="modal-login-subtitulo"><a href="./?r=index/recoveryaccount">
                        Olvidé mi contraseña
                    </a>
                </div>
                <div class="modal-login-form-input">
                <div class="imgLoad" style="display:none">
                        <img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />
                    </div>
                    <span class="advertencia">
                        <div class="text-success" id="smslog" style="">

                        </div>
                        <div class="text-danger" id="smslogerror" style="">

                        </div>
                    </span>
                </div>    
            </form>
            </div>
        </div>
    </div>

</div>
</div> -->

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-login">
        <div class="modal-content ">
            <div class="card card-signup card-plain ">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                            class="material-icons">clear</i></button>

                    <div class="header header-primary imagen-login text-center">
                        <h4 class="card-title" style="text-align:justify;">Ingresar</h4>
                        <!-- <div class="social-line">
                            <a href="#pablo" class="btn btn-just-icon btn-simple">
                                <i class="fa fa-facebook-square"></i>
                            </a>
                            <a href="#pablo" class="btn btn-just-icon btn-simple">
                                <i class="fa fa-twitter"></i>
                            </a>
                            <a href="#pablo" class="btn btn-just-icon btn-simple">
                                <i class="fa fa-google-plus"></i>
                            </a>
                        </div> -->
                    </div>
                </div>
                <div class="modal-body">
                    <form class="form" method="" action="" id="fnProccesslogin">
                        <p class="description text-center"><a href="./?r=index/recoveryaccount">
                        Olvidé mi contraseña
                    </a></p>
                        <div class="card-content">

                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons">face</i>
                                </span>
                                <input id="lemail" name="email" required class="login form-control"
                                    placeholder="Correo Electrónico"  minlength="12" maxlength="46">
                            </div>


                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons">lock_outline</i>
                                </span>
                                <input type="password" id="lpassword" name="password" autocomplete="on" required  minlength="6" maxlength="30"
                                    class="login form-control" />
                            </div>
                            <div class="modal-login-form-input">
                                <a href="" id="fnbtnloginPro_index">
                                    <div class="icon icon-text btnLogin" id="btnlogin_icono">
                                        <i class="material-icons billete zero-margin"
                                            style="font-size: 70px !important">fingerprint</i>
                                    </div>
                                </a>
                            </div>

                            <!-- If you want to add a checkbox to this form, uncomment this code

							<div class="checkbox">
								<label>
									<input type="checkbox" name="optionsCheckboxes" checked>
									Subscribe to newsletter
								</label>
							</div> -->
                        </div>
                    </form>
                </div>
                <div class="modal-footer text-center">
                    
                    <div class="checkbox">
                        <div class="imgLoad" style="display:none">
                            <img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />
                        </div>
                    <span class="advertencia">
                        <div class="text-success" id="smslog" style=""></div>
                        <div class="text-danger" id="smslogerror" style=""></div>
                    </span>
                    </div>
                      
                </div>
            </div>
        </div>
    </div>
</div>
<script src="res/dtgsk/js/index/login.js"></script>