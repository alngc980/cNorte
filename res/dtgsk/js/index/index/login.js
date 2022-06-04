var htmlprocesando='<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';
$("#fnbtnloginPro_index").click(function(e) {
  var exito = true;//?r=inquilino/processlogin
  exito = PLvalidar();
  if (exito == true ){
     e.preventDefault();
     if( window.FormData !== undefined ) 
     //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
     {
     //  var formData = new FormData(this, "#fnProccessloginPro");
       var formElement = document.getElementById("fnProccesslogin");
       var formData=  new FormData(formElement)
       // var formData = form.serialize();
         $.ajax({
           url: "?r=index/processlogin",
           type: "POST",
           data:   formData ,
           contentType: false,
                 cache: false,
           processData:false,
           success: function(data)
           {
             var mensajeerror="";
             if(data.success==false){
                    $("#btnlogin_icono").removeClass("icon-danger");
                  $("#btnlogin_icono").addClass("icon-success");
                   $("#smslog").fadeIn(1000).html(data.message);
                   setTimeout ("fnRedir('"+data.ruta+"');",1000);
                                   
             }else{
                 if(data.ruta == ""){
                   mensajeerror = "<i class='material-icons'>warning</i>" + data.message;
                   $("#btnlogin_icono").addClass("icon-warning");
                   $("#smslog").removeClass("text-success");
                   $("#smslog").addClass("text-warning");
                   $("#smslog").fadeIn(1000).html(""); 
                   $("#smslog").html(mensajeerror);
                 
                 }else{
                  $("#btnlogin_icono").removeClass("icon-success");
                  $("#btnlogin_icono").addClass("icon-warning");
                 
                  $("#smslog").addClass("text-warning");
                   $("#smslog").fadeIn(1000).html(""); 
                   $("#smslog").html(data.message+"..."); 
                   setTimeout ("fnRedir('"+data.ruta+"');",2000);
                 }
              
             }
           
           },
           beforeSend:function(objeto){ 
            $("#btnlogin_icono").addClass("icon-success");
            $("#smslog").addClass("text-success");
             $("#smslog").fadeIn(1000).html(htmlprocesando+'Procesando ...'); 
           
           },
           error: function(result) {
            $("#btnlogin_icono").addClass("text-warning");
           $("#smslog").fadeIn(1000).html(""); 
           $("#smslog").fadeIn(1000).html(result+"..."); 
           
           return false;
         }
         });
       return exito;
     }
   }else{
     return false;
   }
   return false;
}); 
function PLvalidar(){
  var sms="";
  $("#smslog").html(""); 
  $("#smslogerror").html(""); 
  exito = true;
  if ($("#lpassword").val().trim()==""){
    sms="Por favor ingrese su contraseña";
    exito=false;
  }
  if ($("#lemail").val().trim()==""){
    sms="<strong>Por favor ingrese su correo</strong>";
    exito=false;
  }
  

  if (exito ==false){
    
    $("#smslogerror").html(sms); 
  }

return exito;
}