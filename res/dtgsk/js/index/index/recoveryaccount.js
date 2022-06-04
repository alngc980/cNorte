// pro
$("#fnSolicitaCodRec").submit(function(e) {   
    e.preventDefault();
    if( window.FormData !== undefined ) 
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        var formData = new FormData(this);
        // var formData = form.serialize();
        if(gvalidadatos( 1,$("#iEmail").val().trim() )){
        exito = solCodRec(formData);
        }else{
          $("#aRespuestaS").html(respuestaregistro);
        }
        return exito;

    }
   
   }); 

$("#fnprocessrecuperar").submit(function(e) { 
    e.preventDefault();
    if( window.FormData !== undefined ) 
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        var formData = new FormData(this);
        // var formData = form.serialize();
        
      
       
        if(gvalidadatos( 1,$("#iEmail_").val().trim() )){
          exito = prossRecueperar(formData);

          }else{
            $("#aRespuesta").html(respuestaregistro);
          }
          return exito;
    }
    
    
   
   }); 

   
function  solCodRec(formData){
  
   //Añadimos la imagen de carga en el contenedor

   $.ajax({
       url: "./?r=index/getcodigo",
       type: "POST",
       data:  formData,
       contentType: false,
             cache: false,
       processData:false,
       success: function(data)
       {
         if (data.success== false){
          
          setTimeout ("fnActivar('"+data.ruta+"');",5000);
          $("#aRespuestaS").fadeIn(1000).html(data.message);
          $('#aEsperaS').css({display:'block'});

         }else{
          $("#aRespuestaS").fadeIn(1000).html(""); 
          $("#aRespuestaS").fadeIn(1000).html(data.message+"...");
          $('#aEsperaS').css({display:'none'});
          // $("#aRespuesta").fadeIn(1000).html("");
       
          // 
          //  setTimeout ('$("#aRespuesta").fadeIn(1000).html("'+data.mensaje+'...");',5000);
          //  setTimeout ("$('#aEspera').css({display:'none'})",5000);
          
         }
                
         
       },
       beforeSend:function(objeto){ 
    
        $('#aEsperaS').css({display:'block'});
      },
       error: function(result) {
        $("#aRespuestaS").html(""); 
        $("#aRespuestaS").html("Error..."+result.e); 
        return false;
     }
   });
}
function  prossRecueperar(formData){
  
   //Añadimos la imagen de carga en el contenedor

   $.ajax({
       url: "./?r=index/processrecuperar",
       type: "POST",
       data:  formData,
       contentType: false,
             cache: false,
       processData:false,
       success: function(data)
       {
         if (data.success== false){
          
          setTimeout ("fnRuta('"+data.ruta+"');",5000);
          $("#aRespuesta").fadeIn(1000).html(data.message);
          $('#aEspera').css({display:'block'});

         }else{
          $("#aRespuesta").fadeIn(1000).html(""); 
          $("#aRespuesta").fadeIn(1000).html(data.message+"...");
          $('#aEspera').css({display:'none'});
          // $("#aRespuesta").fadeIn(1000).html("");
       
          // 
          //  setTimeout ('$("#aRespuesta").fadeIn(1000).html("'+data.mensaje+'...");',5000);
          //  setTimeout ("$('#aEspera').css({display:'none'})",5000);
          
         }
                
         
       },
       beforeSend:function(objeto){ 
    
        $('#aEspera').css({display:'block'});
      },
       error: function(result) {
        $("#aRespuesta").html(""); 
        $("#aRespuesta").html("Error..."+result.e); 
        return false;
     }
   });
}
function fnActivar(ruta)
{

  window.location=ruta;

}
function fnRuta(ruta)
{

  window.location=ruta;

}

