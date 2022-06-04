Dropzone.autoDiscover = false;

$(document).ready(function () {
  cargarModaldata();
 

    var previewNode = document.querySelector("#template");
previewNode.id = "";
var previewTemplate = previewNode.parentNode.innerHTML;
previewNode.parentNode.removeChild(previewNode);
var ruta = $('#idruta').html().trim();
var idcat = $('#idcat').html().trim();

var myDropzone = new Dropzone(document.body, {
    url: "./?r=propietario/subirImgCategorias",
    //  paramName: "file",
    params: {
        varuta: ruta,
        idcat: idcat
    },
    // acceptedFiles: 'image/*',
    // maxFilesize: 2,
    // maxFiles: 3,
    thumbnailWidth: 80,
    thumbnailHeight: 80,
    parallelUploads: 20,
    thumbnailMethod: 'contain',
    previewTemplate: previewTemplate,
    autoQueue: false,
    previewsContainer: "#previews",
    clickable: ".fileinput-button"
});

myDropzone.on("addedfile", function(file) {
    $('.dropzone-here').hide();
    // Hookup the start button
    // file.previewElement.querySelector(".start").onclick = function() {
    //     myDropzone.enqueueFile(file);
    // };//automatico jhcu
    file.previewElement.querySelector(".start").onclick = function() {
        myDropzone.enqueueFile(file);
    };
    document.querySelector("#uploadAll").style.display = "inline";
    document.querySelector("#cancelAll").style.display = "inline";
    document.querySelector("#total-progress .progress-bar").style.width = "0%";


});

// Update the total progress bar
myDropzone.on("totaluploadprogress", function(progress) {
    document.querySelector("#total-progress .progress-bar").style.width = progress + "%";

});

myDropzone.on("sending", function(file) {
    // Show the total progress bar when upload starts
    document.querySelector("#total-progress").style.opacity = "1";
    // And disable the start button
    file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
});

// Hide the total progress bar when nothing's uploading anymore
myDropzone.on("queuecomplete", function(progress) {
    document.querySelector("#total-progress").style.opacity = "0";
    document.querySelector("#uploadAll").style.display = "none";
    document.querySelector("#cancelAll").style.display = "none";
    cargarModaldata();


});

// Setup the buttons for all transfers
// The "add files" button doesn't need to be setup because the config
// `clickable` has already been specified.
document.querySelector("#actions .start").onclick = function() {
    myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
};
document.querySelector("#actions .cancel").onclick = function() {
    myDropzone.removeAllFiles(true);
    document.querySelector("#total-progress").style.opacity = "0";
    document.querySelector("#uploadAll").style.display = "none";
    document.querySelector("#cancelAll").style.display = "none";
};


$('#previews').sortable({
    items: '.file-row',
    cursor: 'move',
    opacity: 0.5,
    containment: "parent",
    distance: 20,
    tolerance: 'pointer',
    update: function(e, ui) {
        //actions when sorting
    }
});

        var cod= $("#idtambo").html().trim();
        var servicios = $("#serv").html().trim();
        var exito = true;
        $.ajax({
             url: "./?r=tambos/mcategoriades",
             Type: "GET",
             data: { prodId: cod},
             success: function(data)
                {
                  obj = new Array();
                  obj = JSON.parse(data);
                  var output;
                  var tipoinm;
                  output= "";
                  tipoinm= obj[0].tinm;
                  $.ajax({
                    url: "./?r=tambos/mcategoriaServicios",
                    Type: "GET",
                    data: { prodId: tipoinm, servicios:servicios},
                  })
                  .done (function( data, textStatus, jqXHR ) {
                  
                    objeto = new Array();
                    objeto = JSON.parse(JSON.stringify(data["message"]));
                    var output= "";
                    debugger;
                    for (i=0; i<objeto.length; i++){
                      //output += '<div style=" margin-top: 0px;"class="checkbox checkbox-inline">';
                      //output += '<label>';
                      output +=  '<div class="services">';
                      if (objeto[i].bestado==1){
                        //output += '<input style=" margin-top: 0px;" checked type="checkbox" value="' + objeto[i].valor + '" name="checkservicios[]"><span class="checkbox-material"><span class="check"></span></span>';
                        output += '<input class="iconservices" checked disabled id="' + objeto[i].icono + '" type="checkbox" name="checkservicios[]" value="' + objeto[i].valor + '" >' + objeto[i].descripcion + '';
                        output += '<label for="'+objeto[i].icono+'" class="nameservices '+objeto[i].icono+'"></label>';
      
                      }else{
                        //output += '<input  type="checkbox" value="'+objeto[i].valor+'" name="checkservicios[]"><span class="checkbox-material"><span class="check"></span></span>';
                        output += '<input class="iconservices" id="' + objeto[i].icono + '" type="checkbox" name="checkservicios[]" value="' + objeto[i].valor + '" disabled >' + objeto[i].descripcion + '';
                        output += '<label for="'+objeto[i].icono+'" class="nameservices '+objeto[i].icono+'"></label>';
      
                      }
                        //output += objeto[i].descripcion;
                      //output += '</label></div>';
                      output += '</div>'
                    }
                   // document.getElementById("upd_servicios").innerHTML = output;
                    $("#upd_servicios").html(output);
                  })
                  .fail(function( jqXHR, textStatus, errorThrown ) {
                        console.log( "La solicitud a fallado: " +  textStatus);
                 });
            }}
          );
      
  
         
        
      
        
      





});

function cargarModaldata(){
  var tem = $('#idcat').html().trim();
  $.ajax({
    url: "./?r=Propietario/cargaData",
    Type: "GET",
    data: { id: tem},
  })
  .done (function( data, textStatus, jqXHR ) {
  debugger;
  objDataimg = new Array();
  objDataimg = JSON.parse(data);
 var html = "";
 var Slider = "";
 var SliderUl = "";
if (objDataimg.length>0){
    for(i=0;i<objDataimg.length;i++ ){
      html += '<div class="padre'+objDataimg[i].id+' col-xs-12 col-lg-2 text-center" style="margin-bottom:10px;">';
      html += '<span class="preview" style="width:160px;height: 160px;margin-bottom:7px;"> ';
      html += '<img src="'+objDataimg[i].ruta+'" style="max-width:160px;max-height: 160px;" />';
      html += '</span>';
      //echo '<a class="btn btn-primario" href="./?r=Propietario/removeImage&id='.$imagedata->id.'">Eliminar</a>';
      html += '<a class="btn btn-primario click" href="javaScript:delImg('+objDataimg[i].id+')">Eliminar</a>';
      html += '</div>';
  
      if(i==0){
        Slider +='<div class="tab-pane active" id="product-page'+i+'">';
        Slider +='<img src='+objDataimg[i].ruta+' />';
        Slider +='<input type="text" id="key" value="" style="display:none" />';                     
        Slider +='<button class="btn btn-primario" data-toggle="modal" style="position:absolute;" data-target="#myModal"><i class="material-icons">image</i> Subir Imágenes</button>';
        Slider +='</div>';

        SliderUl +='<li class="active">';
        SliderUl +='<a href="#product-page'+i+'" role="tab" data-toggle="tab" aria-expanded="true">';
        SliderUl +='<img src='+objDataimg[i].ruta+' />';
        SliderUl +='</a>';
        SliderUl +='</li>';
      }else{
        Slider +='<div class="tab-pane kv-file-zoom" id="product-page'+i+'">';
        Slider +='<img src='+objDataimg[i].ruta+' />';
        Slider +='<input type="text" id="key" value="" style="display:none" />';
        Slider +='<button style="position:absolute;" class="btn btn-primario" data-toggle="modal" data-target="#myModal" ><i class="material-icons">image</i> Subir Imágenes</button>';
        Slider +='</div>';

        SliderUl +='<li>';
        SliderUl +='<a href="#product-page'+i+'" role="tab" data-toggle="tab" aria-expanded="false">';
        SliderUl +='<img src='+objDataimg[i].ruta+' />';
        SliderUl +='</a>';
        SliderUl +='</li>';
      }
    }
 
    }else{
    Slider += '<button class="btn btn-primario" data-toggle="modal" style="position:relative;" data-target="#myModal"><i class="material-icons">image</i> Subir Imágenes</button>';
  }
  $('#updModal').html(html);
  $('#updSlider').html(Slider);
  $('#flexiselDemo1').html(SliderUl);
  $("#flexiselDemo1").flexisel({
    visibleItems: 4,
    itemsToScroll: 1,
    animationSpeed: 400,
    enableResponsiveBreakpoints: true,
    responsiveBreakpoints: {
        portrait: {
            changePoint: 480,
            visibleItems: 3
        },
        landscape: {
            changePoint: 640,
            visibleItems: 3
        },
        tablet: {
            changePoint: 768,
            visibleItems: 3
        }
    }
});

  })
  .fail(function( jqXHR, textStatus, errorThrown ) {
        console.log( "La solicitud a fallado: " +  textStatus);
 });
}
function delImg(n){
            var tem = '.padre'+n;
            $.ajax({
              url: "./?r=Propietario/removeImage",
              Type: "GET",
              data: { id: n},
            })
            .done (function( data, textStatus, jqXHR ) {
            debugger;
             $(tem).remove(); 
            })
            .fail(function( jqXHR, textStatus, errorThrown ) {
                  console.log( "La solicitud a fallado: " +  textStatus);
           });
}
    