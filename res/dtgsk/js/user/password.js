$(document).ready(function (e) {

});
$('#txtContrasenaNew').blur(function(){
  if($('#password').val()==""){
    $('#lblEstado').html("Ingrese la contraseña actual");
  }else{
    $('#lblEstado').html("Validando...");
  }

});
// $('#passwordverifica').click(function(e){
//   if($('#password').val()==""){
//     $('#lblEstado').html("vericamos contraseña actual");
//   }else{
//     if($('#txtContrasenaNew').val()==$('#passwordverifica').val()){
//       $('#lblEstado').html("Presione el boton guardar");
//     }else{
//       $('#lblEstado').html("contraseña no coinciden");
//     }
//   }
// });
$("#frmUpdPassword").on('submit',(function(e){
  debugger;
  e.preventDefault();
  exito = validarDatosPassword();
  if (exito == true){
  $.ajax({
      url: "?r=propietario/proccContrasena",
      type: "POST",
      data:   $('#frmUpdPassword').serialize(),
      })
  .done (function( data, textStatus, jqXHR ) {
    objeto = new Array();
   // objeto = JSON.parse(data["message"]);
    if(data["success"]==true){
      demo.showNotification('bottom','right', data["message"]);
      //window.location.pathname
    }else{
      
      demo.showNotification('bottom','right', data["message"]);
      return false;
    }
  })
  .fail(function( jqXHR, textStatus, errorThrown ) {
    demo.showNotification('bottom','right', "La solicitud a fallado: " +  textStatus);
   })
}else{
  
}
}));
function validarDatosPassword(){
  var procede = false;
  if($("#password").val != "" || $("#password").val !=" "){
    if($('#txtContrasenaNew').val()==$('#passwordverifica').val()){
      procede =true;
    }else{
      demo.showNotification('bottom','right', "La contraseñas nuevas no coinciden");
      procede=false;
    }
  }else{
    demo.showNotification('bottom','right', "No dejar campos vacíos");
    procede=false;
  }
  return procede;
}


// $("#tu-campo").on("keyup", function() {
//   // llamada AJAX
// });

// $( "#target" ).blur(function() {
//   alert( "Handler for .blur() called." );
//   // tu codigo ajax va dentro de esta function...
// });
$('#passwordverifica').blur(function(){
  if($('#password').val()==""){
    $('#lblEstado').html("vericamos contraseña actual");
  }else{
    if($('#txtContrasenaNew').val()==$('#passwordverifica').val()){
      $('#lblEstado').html("Presione el boton guardar");
    }else{
      $('#lblEstado').html("contraseña no coinciden");
    }
  }
});