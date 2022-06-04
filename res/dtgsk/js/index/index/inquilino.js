$("#fnLogin").submit(function(e) {
  var exito = true;//?r=inquilino/processlogin
  exito = PLvalidar();
  if (exito == true ){
     e.preventDefault();
     if( window.FormData !== undefined ) 
     //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
     {
       var formData = new FormData(this);
       // var formData = form.serialize();
         $.ajax({
           url: "?r=inquilino/processlogin",
           type: "POST",
           data:   formData ,
           contentType: false,
                 cache: false,
           processData:false,
           success: function(data)
           {debugger;
             if(data.success==false){
                   $("#smslog").html(""); 
                   $("#smslogerror").fadeIn(1000).html(""); 
                   $("#smslog").fadeIn(1000).html(data.message);
                   $('#imgLoadLog').css({display:'block'});  
                   setTimeout ("fnRedir('"+data.ruta+"');",5000);
                                   
             }else{
                 if(data.ruta == ""){
                   $("#smslog").fadeIn(1000).html(""); 
                   $("#smslogerror").fadeIn(1000).html(""); 
                   $("#smslogerror").html(data.message+"..."); 
                   $('#imgLoadLog').css({display:'none'})
                 }else{
                   $("#smslogerror").fadeIn(1000).html(""); 
                   $("#smslogerror").html(data.message+"..."); 
                   $('#imgLoadLog').css({display:'none'});
                   fnRedir(data.ruta);
                 }
              
             }
           
           },
           beforeSend:function(objeto){ 
             $("#smslog").fadeIn(1000).html("Procesando..."); 
             $('#imgLoadLog').css({display:'block'});
           },
           error: function(result) {
           $("#smslog").fadeIn(1000).html(""); 
           $("#smslog").fadeIn(1000).html(result+"..."); 
           $('#imgLoadLog').css({display:'none'});
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
  exito = true;
  if ($("#email").val()===""){
    exito=false;
  }
  if ($("#password").val()===""){
    exito=false;
  }

  if (exito ==false){
    $("#pRespuesta").html(""); 
    $("#pRespuesta").html("NO dejar campos vacios"); 
  }

return exito;
}
function fnRedir(ruta)
{
  window.location=ruta;
}