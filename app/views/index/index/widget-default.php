<body class="bg-secondary">
    <?php require_once _VIEW_PATH_ . 'nav-index.php'; ?>

    <div class="main-content">
        <!-- Header -->
        <div class="header bg-gradient-warning py-7 py-lg-8 pt-lg-9">
            <div class="container">
                <div class="header-body text-center mb-7">
                    <div class="row justify-content-center">
                        <div class="col-xl-5 col-lg-6 col-md-8 px-5">
                            <h1 class="text-white">CONSORCIO NORTE</h1>
                            <p class="text-lead text-white"> Ejecucion de obras, servicios de seguridad y salud en el trabajo </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="separator separator-bottom separator-skew zindex-100">
                <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
                    <polygon class="fill-secondary" points="2560 0 2560 100 0 100"></polygon>
                </svg>
            </div>
        </div>
        <!-- Page content -->
        <div class="container mt--9 pb-5">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-7">
                    <div class="card bg-secondary border-0 mb-0">

                        <div class="card-body px-lg-5 py-lg-5">
                            <div class="text-center text-muted mb-4">
                                <small>Iniciar Sesión</small>
                            </div>
                            <form role="form" class="form" id="fnlogin">
                                <div class="form-group mb-3">
                                    <div class="input-group input-group-merge input-group-alternative">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                                        </div>
                                        <input class="form-control" placeholder="N° de DNI" type="text" maxlength="8" id="idUser" name="idUser">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group input-group-merge input-group-alternative">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                        </div>
                                        <input class="form-control" placeholder="Password" type="password" maxlength="30" id="idPass" name="idPass">
                                    </div>
                                </div>
                                <div class="custom-control custom-control-alternative custom-checkbox">
                                    <div class="imgLoad" style="display:none">
                                        <img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />
                                    </div>
                                    <span class="advertencia text-center">
                                        <div class="text-success" id="smslog" ></div>
                                        <div class="text-danger" id="smslogerror" ></div>
                                    </span>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-warning my-4" type="submit" id="fnbtnlogin">Iniciar</button>

                                </div>

                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <?php require_once _VIEW_PATH_ . 'footer-index.php'; ?>
    <script src="res/dtgsk/js/index/index.js"></script>
</body>