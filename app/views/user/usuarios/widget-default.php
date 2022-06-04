<div class="col-xl-12 order-xl-2">
    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-8">
                    <h3 class="mb-0">Nuevo Usuario </h3>
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
                                <input type="text" id="userName" name="userName" class="form-control" placeholder="Username" value=""  maxlength="80" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-email">N° DNI</label>
                                <input type="text" id="userDOI" name="userDOI" class="form-control" placeholder=""  minlength="8" maxlength="11" required/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-first-name">User</label>
                                <input type="text" id="txtUser" name="userCod" class="form-control" value="" readonly required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-last-name">Contraseña</label>
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
                        <div class="text-success" id="smslog"></div>
                        <div class="text-danger" id="smslogerror"></div>
                    </span>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary my-4" type="submit" id="fnRegister">Guardar</button>
                </div>
            </form>
        </div>
    </div>
    <div class="card">
    <!-- Card header -->
    <div class="card-header border-0">
      <h3 class="mb-0">Lista de usuarios</h3>
    </div>
    <!-- Light table -->
    <div class="table-responsive">
      <table class="table align-items-center table-flush">
        <thead class="thead-light">
          <tr>
            <th scope="col" class="sort" data-sort="name">Nombres de usuario</th>
            <th scope="col" class="sort" data-sort="budget">Usuario</th>
            <th scope="col" class="sort" data-sort="status">Tipo Usuario</th>
            <th scope="col">Estado</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody class="list" id="tbluser">

        
        </tbody>
      </table>
    </div>
    
  </div>
</div>
<script src="res/dtgsk/js/user/index.js"></script>