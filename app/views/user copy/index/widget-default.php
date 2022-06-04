<div class="col">
  <div class="row">
    <div class="col-xl-3 col-md-6">
      <div class="card card-stats">

        <!-- Card body -->
        <div class="card-body">

          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-0">Total <br>Usuarios</h5>
              <span class="h2 font-weight-bold mb-0" id="idTot">00</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">
                <i class="ni user-run"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card card-stats">
        <!-- Card body -->
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-0">Usuarios<BR> Desactivados</h5>
              <span class="h2 font-weight-bold mb-0" id="idTotD">00</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                <i class="ni ni-chart-pie-35"></i>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card card-stats">
        <!-- Card body -->
        <div class="card-body">
          <div class="row">
            <div class="col">
              <h5 class="card-title text-uppercase text-muted mb-0">Usuarios<BR> Activados</h5>
              <span class="h2 font-weight-bold mb-0" id="idTotA">00</span>
            </div>
            <div class="col-auto">
              <div class="icon icon-shape bg-gradient-green text-white rounded-circle shadow">
                <i class="ni ni-chart-pie-35"></i>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
  <a href="#notifica" id="link"></a>
  <div id="notifica">

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
            <th scope="col" class="sort" data-sort="name">Nombres</th>
            <th scope="col" class="sort" data-sort="budget">Apellidos</th>
            <th scope="col" class="sort" data-sort="status">DNI</th>
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