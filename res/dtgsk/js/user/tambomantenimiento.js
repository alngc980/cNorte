var  valida;
var sms;
$(document).ready(function (e) {
var valor=  $("#tipoinmueble").val();
obtenerInmuebles(valor);
});


function obtenerInmuebles(valor){

  $.ajax({
    url: "./?r=tambos/categorias",
    contentType: false,
          cache: false,
    processData:false,
    success: function(data)
       {            
         obj = new Array();
         obj = JSON.parse(data);
        
         
        var output;
        output= "";
         for (i=0; i < obj.length; i++){
           if (valor == obj[i].id ){
            output  += '<option value="'+obj[i].id+'" selected>'+obj[i].nombre+'</option>'; 
           }else{
            output  += '<option value="'+obj[i].id+'">'+obj[i].nombre+'</option>'; 
           }
          
         }
         $("#tipoinmueble").html(output);
         $("#tipoinmueble").addClass('selectpicker');
     }
   })
}

$("#formSaveFoto").on('submit',(function(e) {
  e.preventDefault();
  $.ajax({
       url: "./?r=tambos/saveImagen",
       type: "POST",
       data:  new FormData(this),
       contentType: false,
             cache: false,
       processData:false,
      
       success: function(data)
          {
            
              if(data=='invalid')
              {
               // invalid file format.
               $("#err").html("Invalid File !").fadeIn();
              }
              else
              {
              var ruta = data.trim();
              $("#imagenP").html(data);
            
              location.reload(true);
              
             

              }
          },
         error: function(e)
          {
              $("#err").html(e).fadeIn();
          }
    });
 }));

 $("#formupdatebasicotambo").on('submit',(function(e){
  e.preventDefault();
  valida = true;
  if($("#nombre").val().trim()==""){
    valida= false;
    sms="Por favor ingrese el nombre";
  }
  if($("#descripcion").val().trim()==""){
    valida= false;
    sms="Por favor ingrese la descripcion";
  }


  if (valida == true){
  $.ajax({
       url: "?r=propietario/procctambomantenimiento",
       type: "POST",
       data: $('#formupdatebasicotambo').serialize(),
      })
      .done (function( data, textStatus, jqXHR ) {
        
       
        objeto = new Array();
       // objeto = JSON.parse(data["message"]);
        if(data["success"]==true){
          window.location =data["ruta"];
          return true;
          //window.location.pathname
        }else{
          demo.showNotification('top','right', data["message"]);
          return false;
        }
        
       

      })
      .fail(function( jqXHR, textStatus, errorThrown ) {
      
        demo.showNotification('top','right', "La solicitud a fallado: " +  textStatus);    
     return false;
       
     })
    }else{
      demo.showNotification('top','right', "La solicitud a fallado: " +  sms);    
    }   
   
 }
)
);
$("#formupdategeotambo").on('submit',(function(e){
  e.preventDefault();
  

  $.ajax({
       url: "?r=propietario/procctambomantenimientoGeo",
       type: "POST",
       data: $('#formupdategeotambo').serialize(),
      })
      .done (function( data, textStatus, jqXHR ) {
        
       
        objeto = new Array();
       // objeto = JSON.parse(data["message"]);
        if(data["success"]==true){
          window.location =data["ruta"];
          return true;
          //window.location.pathname
        }else{
          demo.showNotification('top','right', data["message"]);
          return false;
        }
        
       

      })
      .fail(function( jqXHR, textStatus, errorThrown ) {
      
        demo.showNotification('top','right', "La solicitud a fallado: " +  textStatus);    
     return false;
       
     })
      
   
 }
)
);
//