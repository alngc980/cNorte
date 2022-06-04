<!-- <div class="modal fade" id="modalOpcionregistro" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="card card-pricing card-raised">


            <h4 class="title">Registrarme como</h4>




            <div class="card-content">
                <div class="row">
                    <div class="col-md-6">
                        <a href="#pablo" id="registroinq">
                            <div class="icon icon-text" id="btnlogin_icono">
                                <i class="material-icons">face</i>
                            </div>
                        </a>

                        <h5 class="card-title">Inquilino</h5>


                    </div>
                    <div class="col-md-6">
                        <a href="#" id="registropro">
                            <div class="icon icon-text" id="btnlogin_icono">
                                <i class="material-icons">work</i>
                            </div>
                        </a>
                        <h5 class="card-title">Propietario</h5>

                    </div>
                </div>


            </div>

        </div>

    </div>
</div>
<!--********************************REGISTRO DUEÑO********************************-->
<!-- <div class="modal fade" id="signupModal1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="card card-signup card-plain">

                <div class="modal-header">
                <h4 class="title">Registro | Propietario</h4>
                </div>



                <div class="modal-body">
                
                    <form id="fnRegistroPropietario" method="post" action="">
                        <div class="card-content">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group label-floating form-rose is-empty">
                                        <div class="form-group">
                                            <input type="text" value="" id="Pnombres" required
                                                placeholder="¿Cual es tu nombre?" class="form-control"
                                                name="txtNombres" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group label-floating form-rose is-empty">
                                        <div class="form-group">
                                            <input type="text" value="" required placeholder="¿Cual es tu apellido?"
                                                id="Papellidos" class="form-control" name="txtApellidos" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" style="display: flex; justify-content: center;">
                                    <div class="form-group">
                                        <input type="email" value="" name="txtCorreo" required id="Pemail"
                                            placeholder="Escribe tu correo" class="" />
                                    </div>
                                </div>
                                <div class="col-md-12" style="display: flex; justify-content: center;">
                                    <div class="form-group">
                                        <input type="password" value="" name="txtPassword" required id="Ppassword"
                                            placeholder="Escribe una contraseña" class="" />
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4" >
                                    <div class="form-group">
                                        <label class="label-control">¿Cuando Naciste?</label>
                                        <input type="text" name="txtfechanacimiento" id="Pfnac"
                                            class="form-control datepicker" value="<?php echo date("Y-m-d"); ?>" />
                                    </div>
                                </div>

                                <div class="col-md-8">

                                    <div class="form-group">
                                        <label>Sexo</label>
                                        <div class="radio radio-inline">
                                            <label>
                                                <input type="radio" name="sexo" id="Psexo" value="1" required><span
                                                    class="circle"></span><span class="check"></span>
                                                Hombre
                                            </label>
                                        </div>
                                        <div class="radio radio-inline">
                                            <label>
                                                <input type="radio" name="sexo" id="Psexo" value="0" required><span
                                                    class="circle"></span><span class="check"></span>
                                                Mujer
                                            </label>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 text-center">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="Pacepto" name="optionsCheckboxes"><span
                                            class="checkbox-material" required>
                                            Acepto términos y condiciones
                                    </label>
                                </div>
                                <div class="text-center">
                                    <span class="label label-danger" id="pRespuesta"></span>
                                </div>
                            </div>
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primario text-center">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">Registrar</font>
                                    </font>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div> -->
<!--********************************REGISTRO INQUILINO****************************-->
<!-- <div class="modal fade" id="signupModal2" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="card card-signup card-plain">
                <div class="modal-header">


                    <h4 class="card-title">Registro | Inquilino</h4>

                </div>
                <div class="modal-body">
                    <form role="form" id="fnRegistro" method="post" action="">
                        <div class="card-content">
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- <div class="form-group label-floating form-rose is-empty">
                                        <label class="control-label"><font style="vertical-align: inherit;">
                                          <font style="vertical-align: inherit;">Nombres</label>
                                        <input type="text" name="txtNombres" class="form-control" required>
                                        <span class="material-input"></span>
                                    </div> -->
                                    <div class="form-group">
                                        <input type="text" id="nombres" value="" required
                                            placeholder="¿Cual es tu nombre?" class="form-control" name="txtNombres" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- <div class="form-group label-floating form-rose is-empty">
                                        <label class="control-label"><font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">Apellidos</font></font></label>
                                        <input type="text" name="txtApellidos" class="form-control" required>
                                        <span class="material-input"></span>
                                    </div> -->
                                    <div class="form-group">
                                        <input type="text" value="" required placeholder="¿Cual es tu apellido?"
                                            class="form-control" id="apellidos" name="txtApellidos" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" style="display: flex; justify-content: center;">
                                    <!-- <div class="form-group label-floating form-rose is-empty">
                                        <label class="control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Correo</font></font></label>
                                        <input type="email" name="txtCorreo" class="form-control" required>
                                        <span class="material-input"></span></div> -->
                                    <div class="form-group">
                                        <input type="email" value="" name="txtCorreo" required id="email"
                                            placeholder="Escribe tu correo" class="" />
                                    </div>

                                </div>
                                <div class="col-md-12" style="display: flex; justify-content: center;">
                                    <!-- <div class="form-group label-floating form-rose is-empty">
                                        <label class="control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Contraseña</font></font></label>
                                        <input type="password" name="txtPassword" class="form-control" required>
                                        <span class="material-input"></span></div> -->
                                    <div class="form-group">
                                        <input type="password" value="" name="txtPassword" required id="password"
                                            placeholder="Escribe una contraseña" class="" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <!-- <div class="form-group label-floating form-rose is-empty">
                                        <label class="control-label"><font style="vertical-align: inherit;">
                                           <font style="vertical-align: inherit;">Fecha de Nacimiento</label>
                                        <input type="date" name="txtfechanacimiento" class="form-control datepicker" value="" required>
                                        <span class="material-input"></span> -->
                                    <div class="form-group">
                                        <label class="label-control">¿Cuando Naciste?</label>
                                        <input id="fnac" name="txtfechanacimiento" type="text"
                                            class="form-control datepicker" value="<?php echo date("Y-m-d"); ?>" />
                                    </div>
                                </div>


                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label>Sexo</label>
                                        <div class="radio radio-inline">
                                            <label>
                                                <input type="radio" id="sexo" name="sexo" value="1" required><span
                                                    class="circle"></span><span class="check"></span>
                                                Hombre
                                            </label>
                                        </div>
                                        <div class="radio radio-inline">
                                            <label>
                                                <input type="radio" id="sexo" name="sexo" value="0" required><span
                                                    class="circle"></span><span class="check"></span>
                                                Mujer
                                            </label>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12 text-center">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="acepto" name="optionsCheckboxes"><span
                                            class="checkbox-material" required>


                                            Acepto términos y condiciones

                                    </label>
                                </div>
                            </div>
                            <div class="text-center">
                                <span class="label label-danger" id="Respuesta"></span>
                            </div>
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primario text-center">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">Registrar</font>
                                    </font>
                                </button>
                            </div>
                        </div>
                    <!-- </form>
                </div>
            </div>
        </div>
    </div>
</div>     --> -->