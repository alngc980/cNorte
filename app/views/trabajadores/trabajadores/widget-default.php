<?php 
    $dataVista = $data["dataVista"]; 
?>
<div class="col-xl-12 order-xl-2">
    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-8">
                    <h3 class="mb-0">Lista de trabajadores</h3>
                </div>
                <div class="col-4 text-right">
                    <button class="btn btn-primary my-4" type="submit" id="fnRegister">Nuevo trabajador</button>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <!-- Card header -->

        <!-- <div class="card-header border-0">
            <h3 class="mb-0">Lista de Cargos</h3>
        </div> -->
        
        <!-- Light table -->
        <div class="table-responsive">
            <table class="table align-items-center table-flush">
                <thead class="thead-light">
                    <tr>
                        <th scope="col" class="sort" data-sort="name">Empresa</th>
                        <th scope="col" class="sort" data-sort="budget">Persona</th>
                        <th scope="col" class="sort" data-sort="budget">Cargo</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody class="list" id="tbltrabajadores">

                </tbody>
            </table>
        </div>

    </div>
</div>
<script src="res/dtgsk/js/user/cargo.js"></script>