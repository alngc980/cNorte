<div class="col-xl-12 order-xl-2">
    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-8">
                    <h3 class="mb-0">Perfil de Usuario</h3>
                </div>

            </div>
        </div>
        <div class="card-body">
            <form role="form" class="form" id="fnRegister">
                <h6 class="heading-small text-muted mb-4">Datos Peronales</h6>
                <div class="pl-lg-4">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-username">Nombres y Apellidos</label>
                                <input type="text" id="userName" name="userName" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-email">N° DNI</label>
                                <input type="text" id="userDOI" name="userDOI" class="form-control" readonly />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-first-name">Contraseña Actual</label>
                                <input type="password" id="txtPass" name="txtPass" class="form-control" placeholder="" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-last-name">Contraseña Nueva</label>
                                <input type="password" id="userPass" name="userPass" class="form-control" placeholder="" value="" maxlength="25" minlength="6" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="custom-control custom-control-alternative custom-checkbox">
                    <div class="imgLoad" style="display:none">
                        <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                    </div>
                    <span class="advertencia text-center">
                        <div class="text-success" id="smslog" ></div>
                        <div class="text-danger" id="smslogerror" ></div>
                    </span>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary my-4" type="submit" id="fnRegister">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="res/dtgsk/js/user/perfil.js"></script>