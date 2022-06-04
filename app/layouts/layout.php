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
  <!-- Canonical SEO -->
  <link rel="canonical" href="https://www.sitisafe.com/" />
  <!--  Social tags      -->
  <meta name="keywords" content="Sistema de información, documentos, informes,supervisión, seguridad, seguridad ocupacional, electresidad">
  <meta name="description" content="Ejecucion de obras, servicios de seguridad y salud en el trabajo">
  <meta property="og:url" content="https://www.sitisafe.com/" />
  <meta property="og:type" content="website" />
  <meta property="og:title" content="Consorcio Norte" />
  <meta property="og:description" content="Sistema de Información Consorcio - Norte" />
  <meta property="og:image" content="https://www.sitisafe.com/cnorte/assets/img/logo.png" />


  <!-- Schema.org markup for Google+ -->
  <meta itemprop="name" content="CONSORCIO-NORTE">
  <meta itemprop="description" content="Sistema WEB Consorcio NOrte">
  <meta itemprop="image" content="https://www.sitisafe.com/cnorte/assets/img/logo.png">
  <title><?php echo $meta["title"]; ?></title>

  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
  <!-- TIPOGRAFÍA-->
   <link rel="stylesheet" href="./res/assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="./res/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Argon CSS -->
  <link rel="stylesheet" href="./res/assets/css/argon.css?v=1.2.0" type="text/css">
  <script src="./res/assets/vendor/jquery/dist/jquery.min.js"></script>


</head>
<?php
 define('_VIEW_PATH_', 'app/views/index/reutilizar/');
        if(Session::exists("user_id")){
          Core::redir("./?r=user/index");
        }else{
          require_once(View::$content);
          die();
        }
?>
</html>

  <!-- Core -->

  <script src="./res/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="./res/assets/vendor/js-cookie/js.cookie.js"></script>
  <script src="./res/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
  <script src="./res/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
  <!-- Argon JS -->
  <script src="./res/assets/js/argon.js?v=1.2.0"></script>
  <script src="./res/dtgsk/js/index/layout.js"></script>