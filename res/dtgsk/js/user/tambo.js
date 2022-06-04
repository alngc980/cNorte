$(document).ready(function (e) {

  var prodId = getParameterByName('id');
  sessionStorage.setItem('keytambo',$("#muda").val()) ;
  $.ajax({
             url: "./?r=tambos/misCategorias",
             Type: "GET",
              data: { prodId:  sessionStorage.getItem('keytambo')},
            success: function(data)
          {
                obj = new Array();
                obj = JSON.parse(data);
                nuevoarreglo = new Array();
                nuevoarreglo = obj['categorias'];
                var output;
                output= "";
           if(nuevoarreglo.length>0){
            for (i=0; i < nuevoarreglo.length ; i++){
                output += '<div class="t-card grosor-1 " style="background:url('+nuevoarreglo[i].perfil+') no-repeat center center;">';           
								output +='<div class="top-t-card">';
								output +='<a href="./?r=propietario/mcategoria&id='+nuevoarreglo[i].id+'"><i class="material-icons">edit</i></a>';
								output +='<a href="#"><i class="material-icons">delete</i></a>';
								output +='<a href="#"><i class="material-icons">share</i></a>';
								output += '</div>';
								output += '<div class="content-t-card" style="">';
								output +='<div style="height:2vh; width: 100%; font-size: 2vh; text-align: center; display:flex; justify-content:center;">'+nuevoarreglo[i].disponible+' Disponibles de '+nuevoarreglo[i].cantcuartos+'</div>';
              // output += '<a  href="./?r=propietario/vcategoria&id=' + nuevoarreglo[i].id +'"class="tambo-t-card"><h6 class="card-title"><small style="color:white;">S/.</small>'+nuevoarreglo[i].precio;
                output += '<a  href="./?r=propietario/vcategoria&id=' + nuevoarreglo[i].id + '"class="tambo-t-card"><h6 class="card-title"><small style="color:white;">S/.</small>' + nuevoarreglo[i].precio;
                output += '<p style="font-size:1.3vh;"> S/.'+nuevoarreglo[i].preciootro+' Noche</p></h6>';
                output += '<p class="media-heading"><p>' + nuevoarreglo[i].Nombre + '</p></p></a>';  
								output += '<div class="direccion-t-card"></div>';
							  output +='	</div>';
								output +='<div class="topfooter-t-card">Servicios</div>';
								output +='<div class="footer-t-card ">';
							                
                objetoser = new Array();
                nuevoarregloserv = obj['servicios'];
                objetoser = Array.from(nuevoarreglo[i].servicios.split(","));

               var contadorser;
               contadorser = 0;
                for (a=0; a<objetoser.length ;a++){
                
                 for(z=0; z<nuevoarregloserv.length; z++){
                    if(objetoser[a]==nuevoarregloserv[z].valor)
                    {
                      output += '<img src="./res/img/servicios/' + nuevoarregloserv[z].icono + '.svg">';
                   }
                         
                   
                 }

                }

                output += '</div></div>';       

            }

            }else{
              output +='<div class="nohabitaciones text-center">';
              output +='<h3>Aún no registro tipos de habitaciones en este Tambo</h3></div>';
            }

            $("#categorias_act").html(output);


        }
      })
});
function getParameterByName(name) {
  //name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
  results = regex.exec(location.search);
  return results === null ? "" : decodeURIComponent(results[1]);
}
function getParameterByNameOr(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
  }
