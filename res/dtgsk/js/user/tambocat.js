$(".npos").keydown(function(evento) {
  const teclaPresionada = evento.key;
  const teclaPresionadaEsUnNumero =
    Number.isInteger(parseInt(teclaPresionada));

  const sePresionoUnaTeclaNoAdmitida = 
    teclaPresionada != 'ArrowDown' &&
    teclaPresionada != 'ArrowUp' &&
    teclaPresionada != 'ArrowLeft' &&
    teclaPresionada != 'ArrowRight' &&
    teclaPresionada != 'Backspace' &&
    teclaPresionada != 'Delete' &&
    teclaPresionada != 'Enter' &&
    !teclaPresionadaEsUnNumero;
  const comienzaPorCero = 
  $(this).val().length === 0 &&
    teclaPresionada == 0;

  if (sePresionoUnaTeclaNoAdmitida || comienzaPorCero) {
    evento.preventDefault(); 
  }

});
$(document).ready(function (e) {
   
  var cod= $("#muda").val();
  sessionStorage.setItem('keytambo',cod);

  $.ajax({
       url: "./?r=tambos/categoriades",
       Type: "GET",  
       data:{prodId:cod},
       success: function(data)
          {    
            debugger;       
            obj = new Array();
            obj = JSON.parse(data);
            var output;
            var tipoinm;
           
            output= "";
          
            document.getElementById("CatName").innerHTML = obj[0].des; 
            tipoinm= obj[0].tinm; 

            $.ajax({
              url: "./?r=tambos/categoriaServicios",
              Type: "GET",
              data: { prodId: tipoinm}, 
             
            })
            .done (function( data, textStatus, jqXHR ) {
                           
              objeto = new Array();
              objeto = JSON.parse(JSON.stringify(data["message"]));
              var output= '';
              for (i=0; i<objeto.length; i++){
                output += '<div class="services">';
                output += '<input class="iconservices" id="' + objeto[i].icono + '" type="checkbox" name="checkservicios[]" value="' + objeto[i].valor + '" >' + objeto[i].descripcion + '';
                output += '<label for="'+objeto[i].icono+'" class="nameservices '+objeto[i].icono+'"></label>';
                output += '</div>'
              }
             // document.getElementById("upd_servicios").innerHTML = output; 
              $("#upd_servicios").html(output);
              mensaje='Registre la categoria de su inmueble';
              demo.showNotification('bottom','right', mensaje);
              
             

            })
            .fail(function( jqXHR, textStatus, errorThrown ) {
            
                  console.log( "La solicitud a fallado: " +  textStatus);
             
           });
      }}
    );
  
});

//

$("#formregister").on('submit',(function(e){
  e.preventDefault();
   var  permite; 
   permite= validarDatos();
  if(permite == true){
  $.ajax({
       url: ".?r=Propietario/proregistrarcategoria",
       type: "POST",
       data:   $('#formregister').serialize(),
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
  //demo.showNotification('top','right', "Por favor verifique los datos");    
  return false;
 }
}
)
);

$(".number").keyup(function() {

  this.value = parseFloat(this.value.replace(/,/g, ""))
                    .toFixed(2)
                    .toString()
                    .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
});
function validarDatos(){
  var devolver=true;
  var mensaje;
  if($("#nombre").val().trim().length==0){
    devolver = false;
     mensaje ="Por favor ingrese el nombre de la categoría";
     }
  if($("#costo").val()<$("#costootro").val()){
      devolver = false;
        mensaje ="Costo diario no debe ser mayor al costo Mensual ";
  }
  if($("#cantcuartos").val()> 25){
    devolver = false;
     mensaje ="La cantidad de Habitaciones no deve superar las 25 Habitaciones";
     }
  if(devolver== true){

  }else{demo.showNotification('top','right', "Info: " + mensaje);   
 }

  return devolver;
}