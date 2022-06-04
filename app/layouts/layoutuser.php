<?php
$meta = $data["meta"];
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/img_ico.ico">
    <link rel="icon" href="assets/img/img_ico.ico" type="image/ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title><?php echo $meta["title"]; ?></title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <meta itemprop="image" content="">
    <link rel="stylesheet" href="res/dtgsk/css/styleFont.css">
    <!-- Icons -->
    <link rel="stylesheet" href="res/assets/vendor/nucleo/css/nucleo.css" type="text/css">
    <link rel="stylesheet" href="res/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
    <!-- Page plugins -->
    <!-- Argon CSS -->
    <link rel="stylesheet" href="res/assets/css/argon.css?v=1.2.0" type="text/css">

    <!-- <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> -->
    <script src="./res/assets/vendor/jquery/dist/jquery.min.js"></script>

    <link href="res/css/select2.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <script src="res/js/components/botbox/bootbox.min.js"></script>

</head>

<body>
    <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
        <div class="scrollbar-inner">
            <!-- Brand -->
            <div class="sidenav-header  align-items-center">
                <a class="navbar-brand" href="javascript:void(0)">
                    <a class="font-weight-bold text-danger" href="#" style="font-size: 25px;">
                        <strong> Consorcio Norte</strong>
                    </a>
                    <!-- <img src="./assets/img/logo.png" alt="" style="width: 19vh;" class="navbar-brand-img" alt="..."> -->
                </a>
            </div>
            <div class="navbar-inner">
                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="sidenav-collapse-main">
                    <!-- Nav items -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <?php if ($meta["menu"] == "1") {
                                echo ' <a class="nav-link active" href="./">
                                <i class="ni ni-tv-2 text-orange"></i>
                                <span class="nav-link-text">Inicio</span>
                            </a>';
                            } else {
                                echo ' <a class="nav-link  " href="./">
                                <i class="ni ni-tv-2 text-orange"></i>
                                <span class="nav-link-text">Inicio</span>
                            </a>';
                            }
                            ?>

                        </li>
                        <li class="nav-item">
                            <?php
                            if (Session::get("bAdmin") == "1") {
                                if ($meta["menu"] == "2") {
                                    echo ' <a class="nav-link active" href="./?r=user/usuarios">
                                    <i class="ni ni-planet text-orange"></i>
                                    <span class="nav-link-text">Usuarios</span>
                                </a>';
                                } else {
                                    echo '<a class="nav-link" href="./?r=user/usuarios">
                                    <i class="ni ni-planet text-orange"></i>
                                    <span class="nav-link-text">Usuarios</span>
                                </a>';
                                }
                            }
                            ?>

                        </li>
                        <li class="nav-item">
                            <?php if ($meta["menu"] == "3") {
                                echo ' <a class="nav-link active" href="./?r=user/documento">
                                <i class="ni ni-archive-2 text-orange"></i>
                                <span class="nav-link-text">Documentos</span>
                            </a>';
                            } else {
                                echo '<a class="nav-link" href="./?r=user/documento">
                                <i class="ni ni-archive-2 text-orange"></i>
                                <span class="nav-link-text">Documentos</span>
                            </a>';
                            }
                            ?>

                        </li>

                        <li class="nav-item">
                            <?php if ($meta["menu"] == "4") {
                                echo ' <a class="nav-link active" href="./?r=user/administrar">
                                <i class="ni ni-single-02 text-orange"></i>
                                <span class="nav-link-text">Administración</span>
                            </a>';
                            } else {
                                echo '<a class="nav-link" href="./?r=user/administrar">
                                <i class="ni ni-single-02 text-orange"></i>
                                <span class="nav-link-text">Administración</span>
                            </a>';
                            }
                            ?>
                        </li>
                        <li class="nav-item">
                            <?php if ($meta["menu"] == "5") {
                                echo ' <a class="nav-link active" href="./?r=trabajadores/gestion">
                                <i class="ni ni-briefcase-24 text-orange"></i>
                                <span class="nav-link-text">Trabajadores</span>
                            </a>';
                            } else {
                                echo '<a class="nav-link" href="./?r=trabajadores/gestion">
                                <i class="ni ni-briefcase-24 text-orange"></i>
                                <span class="nav-link-text">Trabajadores</span>
                            </a>';
                            }
                            ?>
                        </li>
                        <li class="nav-item">
                            <?php if ($meta["menu"] == "6") {
                                echo ' <a class="nav-link active" href="./?r=user/cargos">
                                <i class="ni ni-badge text-orange"></i>
                                <span class="nav-link-text">Cargos</span>
                            </a>';
                            } else {
                                echo '<a class="nav-link" href="./?r=user/cargos">
                                <i class="ni ni-badge text-orange"></i>
                                <span class="nav-link-text">Cargos</span>
                            </a>';
                            }
                            ?>
                        </li>
                        <li class="nav-item">
                            <?php if ($meta["menu"] == "7") {
                                echo ' <a class="nav-link active" href="./?r=user/um">
                                <i class="ni ni-building text-orange"></i>
                                <span class="nav-link-text">UM</span>
                            </a>';
                            } else {
                                echo '<a class="nav-link" href="./?r=user/um">
                                <i class="ni ni-building text-orange"></i>
                                <span class="nav-link-text">UM</span>
                            </a>';
                            }
                            ?>
                        </li>
                        <li class="nav-item">
                            <?php if ($meta["menu"] == "8") {
                                echo ' <a class="nav-link active" href="./?r=user/normas">
                                <i class="ni ni-notification-70 text-orange"></i>
                                <span class="nav-link-text">Normas</span>
                            </a>';
                            } else {
                                echo '<a class="nav-link" href="./?r=user/normas">
                                <i class="ni ni-notification-70 text-orange"></i>
                                <span class="nav-link-text">Normas</span>
                            </a>';
                            }
                            ?>
                        </li>
                        <li class="nav-item">
                            <?php if ($meta["menu"] == "9") {
                                echo ' <a class="nav-link active" href="./?r=user/perfil">
                                <i class="ni ni-key-25 text-orange"></i>
                                <span class="nav-link-text">Seguridad</span>
                            </a>';
                            } else {
                                echo '<a class="nav-link" href="./?r=user/perfil">
                                <i class="ni ni-key-25 text-orange"></i>
                                <span class="nav-link-text">Seguridad</span>
                            </a>';
                            }
                            ?>
                        </li>

                    </ul>

                </div>
            </div>
        </div>
    </nav>
    <div class="main-content" id="panel">
        <!-- Topnav -->
        <?php if (($meta["newHeader"]) <> "1") : ?>
            <nav class="navbar navbar-top navbar-expand navbar-dark bg-warning border-bottom">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- Search form -->

                        <!-- Navbar links -->
                        <ul class="navbar-nav align-items-center  ml-md-auto ">
                            <li class="nav-item d-xl-none">
                                <!-- Sidenav toggler -->
                                <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
                                    <div class="sidenav-toggler-inner">
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                    </div>
                                </div>
                            </li>



                        </ul>
                        <ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
                            <li class="nav-item dropdown">
                                <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <div class="media align-items-center">
                                        <span class="avatar avatar-sm rounded-circle">
                                            <img alt="Image placeholder" src="./res/img/nanito5.png">
                                        </span>
                                        <div class="media-body  ml-2  d-none d-lg-block">
                                            <span class="mb-0 text-sm  font-weight-bold">
                                                <?php echo strtoupper(Session::get("name")) ?> </span>
                                        </div>
                                    </div>
                                </a>
                                <div class="dropdown-menu  dropdown-menu-right ">
                                    <div class="dropdown-header noti-title">
                                        <h6 class="text-overflow m-0">Welcome!</h6>
                                    </div>
                                    <a href="./?r=user/perfil" class="dropdown-item">
                                        <i class="ni ni-single-02"></i>
                                        <span>Seguridad</span>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a href="./?r=user/processlogout" class="dropdown-item">
                                        <i class="ni ni-user-run"></i>
                                        <span>Salir</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Header -->

            <div class="header bg-warning pb-6">
                <div class="container-fluid">
                    <div class="header-body">
                        <div class="row align-items-center py-4">
                            <div class="col-lg-6 col-7">

                                <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                                    <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                        <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                                        <li class="breadcrumb-item"><a href="#">
                                                <?php echo $meta["subtitulo"] ?>
                                            </a></li>

                                    </ol>
                                </nav>
                            </div>

                            <div class="col-lg-6 col-5 text-right">
                                <a href="./?r=user/NuevoDocumento" class="btn btn-sm btn-neutral">
                                    <i class="ni ni-fat-add"></i>
                                    Informe</a>
                            </div>
                        </div>
                        <!-- Card stats -->

                    </div>
                </div>
            </div>
        <?php else :
            $datEmpresa = ($data["datEmpresa"]);
        ?>

            <nav class="navbar navbar-top navbar-expand navbar-dark bg-warning border-bottom">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- Search form -->

                        <!-- Navbar links -->
                        <ul class="navbar-nav align-items-center  ml-md-auto ">
                            <li class="nav-item d-xl-none">
                                <!-- Sidenav toggler -->
                                <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
                                    <div class="sidenav-toggler-inner">
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                    </div>
                                </div>
                            </li>



                        </ul>
                        <ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
                            <li class="nav-item dropdown">
                                <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <div class="media align-items-center">
                                        <span class="avatar avatar-sm rounded-circle">
                                            <img alt="Image placeholder" src="./res/img/nanito5.png">
                                        </span>
                                        <div class="media-body  ml-2  d-none d-lg-block">
                                            <span class="mb-0 text-sm  font-weight-bold">
                                                <?php echo strtoupper(Session::get("name")) ?> </span>
                                        </div>
                                    </div>
                                </a>
                                <div class="dropdown-menu  dropdown-menu-right ">
                                    <div class="dropdown-header noti-title">
                                        <h6 class="text-overflow m-0">Welcome!</h6>
                                    </div>
                                    <a href="./?r=user/perfil" class="dropdown-item">
                                        <i class="ni ni-single-02"></i>
                                        <span>Seguridad</span>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a href="./?r=user/processlogout" class="dropdown-item">
                                        <i class="ni ni-user-run"></i>
                                        <span>Salir</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Header -->
            <div class="header pb-6 d-flex align-items-center" style="min-height: 220px; background-image: url(./assets/img/theme/fondo.jpg); background-size: cover; background-position: center top;">
                <!-- Mask -->
                <span class="mask bg-gradient-warning opacity-8"></span>
                <!-- Header container -->
                <div class="container-fluid d-flex align-items-center">
                    <div class="row">
                        <div class="col-lg-12 col-md-10">

                        
                                <h1 class="display-2 text-white text-center"> <?php echo $datEmpresa->cNombre; ?></h1>
                                <p class="text-white mt-0 mb-5 text-center"> <?php echo $datEmpresa->cRazonSocial; ?></p>
                            
                        </div>
                    </div>
                </div>
            </div>
        <?php endif; ?>
        <!-- Page content -->
        <div class="container-fluid mt--6">

            <div class="row">
                <?php

                define('_VIEW_PATH_PRO_', 'app/views/index/reutilizar/');
                define('_menufoter_', $meta["menu"]);

                require_once(View::$content);
                ?>

            </div>

            <div id="modalUpd" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-8">
                                <h3 class="mb-0">Perfil de Usuario <?php echo strtoupper(Session::get("name")) ?> </h3>
                            </div>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form role="form" class="form" id="fnUpdatePersona">

                                <div class="pl-lg-4">
                                    <div class="row" style="display: none;">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-email">ID</label>
                                                <input type="text" id="userCodigo" name="userCodigo" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-email">N° DNI</label>
                                                <input type="text" id="userDoi" name="userDoi" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-username">Nombres</label>
                                                <input type="text" id="userNombre" name="userNombre" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-username">Apellidos</label>
                                                <input type="text" id="userApellido" name="userApellido" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-username">Usuario</label>
                                                <input type="text" id="userUser" name="userUser" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-username">Nueva Contraseña</label>
                                                <input type="password" id="userClave" name="userClave" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="custom-control custom-control-alternative custom-checkbox">
                                    <div class="imgLoad" style="display:none">
                                        <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                                    </div>
                                    <span class="advertencia text-center">
                                        <div class="text-success" id="smslogM"></div>
                                    </span>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-primary my-4" type="submit" id="fnRegister">Guardar</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div id="modalDel" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form role="form" class="form" id="fnDelPersona">
                                <div class="pl-lg-4">
                                    <div class="row" style="display: none;">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-email">ID</label>
                                                <input type="text" id="userDelCodigo" name="userDelCodigo" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group" id="userDelNombre" name="userDelNombre">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="custom-control custom-control-alternative custom-checkbox">
                                    <div class="imgLoad" style="display:none">
                                        <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                                    </div>
                                    <span class="advertencia text-center">
                                        <div class="text-success" id="smslogEliminar"></div>
                                    </span>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-danger my-4" id="fnDelete" name="fnDelete">Eliminar</button>
                                    <button type="button" class="btn btn-secondary" id="fnDeleteSalir" name="fnDeleteSalir" data-dismiss="modal">Cerrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div id="modalDelInforme" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form role="form" class="form" id="fnDelInforme">
                                <div class="pl-lg-4">
                                    <div class="row" style="display: none;">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-email">ID</label>
                                                <input type="text" id="InformeDelCodigo" name="InformeDelCodigo" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group" id="InformeDelNombre" name="InformeDelNombre">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="custom-control custom-control-alternative custom-checkbox">
                                    <div class="imgLoad" style="display:none">
                                        <img src="res/img/load-espera.gif" style="width:30px; height:30px" />
                                    </div>
                                    <span class="advertencia text-center">
                                        <div class="text-success" id="smslogEliminar"></div>
                                    </span>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-danger my-4" id="fnDeleteInforme" name="fnDeleteInforme">Eliminar</button>
                                    <button type="button" class="btn btn-secondary" id="fnDeleteSalir" name="fnDeleteSalir" data-dismiss="modal">Cerrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Footer -->
            <footer class="footer pt-0">
                <div class="row align-items-center justify-content-lg-between">
                    <div class="col-lg-6">
                        <div class="copyright text-center  text-lg-left  text-muted">
                            &copy; 2021 <a href="https://www.cajamaynas.pe" class="font-weight-bold ml-1" target="_blank">CONSORCIO NORTE</a>
                        </div>
                    </div>

                </div>
            </footer>
        </div>
    </div>
</body>

<script src="./res/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="./res/assets/vendor/js-cookie/js.cookie.js"></script>
<script src="./res/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
<script src="./res/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
<!-- Optional JS -->
<script src="./res/assets/vendor/chart.js/dist/Chart.min.js"></script>
<script src="./res/assets/vendor/chart.js/dist/Chart.extension.js"></script>
<!-- Argon JS -->
<script src="./res/assets/js/argon.js?v=1.2.0"></script>
<script src="res/dtgsk/js/user/layout.js"></script>
<script src="./res/dtgsk/js/conexion.js"></script>

</html>