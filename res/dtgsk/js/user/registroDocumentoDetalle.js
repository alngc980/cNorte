var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

var smsvalida;

var dataProgramas;

var nProgramaSelec;

$(document).ready(function () {



});





$('#idTipo').on('change', function() {

    if(this.value==2 || this.value==5){

        $("#groupImcumplimiento").removeAttr("style");

    }else{

        $("#groupImcumplimiento").attr("style","display:none");

    }
    switch ($("#dataInicia").val()){
        case "6":$("#groupImcumplimiento").attr("style","display:none");break;
        case "7":$("#groupImcumplimiento").attr("style","display:none");break;
        case "8":$("#groupImcumplimiento").attr("style","display:none");break;
    }

  });





$("#fnRegistrarDetalle").submit(function (e) {

    e.preventDefault();

    if (window.FormData !== undefined)

    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too

    {

        //  var formData = new FormData(this, "#fnProccessloginPro");

        var formElement = document.getElementById("fnRegistrarDetalle");

        var formData = new FormData(formElement);

        //var formData = form.serialize();

        debugger;

        $.ajax({

            url: "?r=user/registroDocumentoDetalle",

            type: "POST",

            data: formData,

            contentType: false,

            cache: false,

            processData: false,

            success: function (data) {

                debugger;

                if (data.success == true) {

                    $("input[name='keycumplimiento']").val(0);

                    $("#btnlogin_icono").removeClass("icon-danger");

                    $("#btnlogin_icono").addClass("icon-success");

                    $("#smslog").html("");



                    $("#groupImcumplimiento").attr("style","display:none");



                    document.getElementById('fnRegistrarDetalle').reset();



                    $("#tblCumpliento").html();

                    htmlTblCumplimiento = "";

                    for (i = 0; i < data.data.length; i++) {

                        htmlTblCumplimiento += '<tr>';

                        htmlTblCumplimiento += ' <td class="budget">' + data.data[i].descripcionTipo + '</td>';

                        htmlTblCumplimiento += ' <td class="budget">' + data.data[i].detalle + '</td>';

                        htmlTblCumplimiento += ' <td class="budget">' + data.data[i].dCreate + '</td>';



                        htmlTblCumplimiento += '<td class="text-right">';

                        htmlTblCumplimiento += '  <div class="dropdown">';

                        htmlTblCumplimiento += '    <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';

                        htmlTblCumplimiento += '      <i class="fas fa-ellipsis-v"> </i>';

                        htmlTblCumplimiento += '    </a>';

                        htmlTblCumplimiento += '    <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';

                        htmlTblCumplimiento += '      <a class="dropdown-item" href="javascript:ModificarCumplimiento(' + data.data[i].nIdInforme + ',' + data.data[i].nId + ',' + data.data[i].nIdCumplimiento + ')">';

                        htmlTblCumplimiento += ' Modificar </a>';

                        htmlTblCumplimiento += '      <a class="dropdown-item" href="javascript:EliminarCumplimiento(' + data.data[i].nIdInforme + ',' + data.data[i].nId + ',' + data.data[i].nIdCumplimiento + ')">';

                        htmlTblCumplimiento += ' Eliminar </a>';

                        htmlTblCumplimiento += '    </div>';

                        htmlTblCumplimiento += '  </div>';

                        htmlTblCumplimiento += '</td>';

                        htmlTblCumplimiento += ' </tr>';

                    }

                    $("#tblCumpliento").html(htmlTblCumplimiento);

                    //return false;

                    bootbox.alert({

                        message: htmlprocesando + data.message,

                        size: 'small'

                    });

                } else {



                    $("#btnlogin_icono").removeClass("icon-success");

                    $("#btnlogin_icono").addClass("icon-warning");

                    $("#smslog").addClass("text-warning");

                    $("#smslog").fadeIn(1000).html("");

                    $("#smslog").html(data.message + "...");

                }



            },

            beforeSend: function (objeto) {

                $("#btnlogin_icono").addClass("icon-success");

                $("#smslog").addClass("text-success");

                $("#smslog").fadeIn(1000).html(htmlprocesando + 'Procesando ...');



            },

            error: function (result) {

                $("#btnlogin_icono").addClass("text-warning");

                $("#smslog").fadeIn(1000).html("");

                $("#smslog").fadeIn(1000).html(result + "...");



                return false;

            }

        });

        return false;

    }



    return false;

});



function ModificarCumplimiento(informe, keyCumplimiento, cumplimiento) {

    $.ajax({

        url: ".?r=user/obtieneDetalleCumplimineto",

        data: { keyModalidad: 1, keyInforme: informe, keyCumplimiento: cumplimiento },

        type: "POST",

        success: function (data) {

            setTimeout(function () {

                for (i = 0; i < data.data.length; i++) {

                    if(data.data[i].nId == keyCumplimiento){

                        $("input[name=keycumplimiento]").val(data.data[i].nId);

                        $("select[name=tipo]").val(data.data[i].nValorTipo);

                        

                        if (data.data[i].nValorTipo ==5 || data.data[i].nValorTipo==2){

                            $("#groupImcumplimiento").removeAttr("style");

                            $("select[name=motivo]").val(data.data[i].nValorTipo);

                            

                        }else{

                            $("#groupImcumplimiento").attr("style","display:none");

                        }

                      

                        

                        

                        $("textarea[name=detalle]").val(data.data[i].detalle).focus();

                    }

                }

            }, 180);

        }

    });

}



function EliminarCumplimiento(informe, keyCumplimiento, cumplimiento) {

    $.ajax({

        url: ".?r=user/DeleteCumplimiento",

        data: { informe: informe, keyCumplimiento: keyCumplimiento, cumplimiento: cumplimiento },

        type: "POST",

        success: function (data) {

            debugger;

            bootbox.alert({

                message: data.message,

                size: 'sm'

            });

            $("#tblCumpliento").html();

            htmlTblCumplimiento = "";

            for (i = 0; i < data.data.length; i++) {

                htmlTblCumplimiento += '<tr>';

                htmlTblCumplimiento += ' <td class="budget">' + data.data[i].descripcionTipo + '</td>';

                htmlTblCumplimiento += ' <td class="budget">' + data.data[i].detalle + '</td>';

                htmlTblCumplimiento += ' <td class="budget">' + data.data[i].dCreate + '</td>';



                htmlTblCumplimiento += '<td class="text-right">';

                htmlTblCumplimiento += '  <div class="dropdown">';

                htmlTblCumplimiento += '    <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';

                htmlTblCumplimiento += '      <i class="fas fa-ellipsis-v"> </i>';

                htmlTblCumplimiento += '    </a>';

                htmlTblCumplimiento += '    <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';

                htmlTblCumplimiento += '      <a class="dropdown-item" href="javascript:ModificarCumplimiento(' + data.data[i].nIdInforme + ',' + data.data[i].nId + ',' + data.data[i].nIdCumplimiento + ')">';

                htmlTblCumplimiento += ' Modificar </a>';

                htmlTblCumplimiento += '      <a class="dropdown-item" href="javascript:EliminarCumplimiento(' + data.data[i].nIdInforme + ',' + data.data[i].nId + ',' + data.data[i].nIdCumplimiento + ')">';

                htmlTblCumplimiento += ' Eliminar </a>';

                htmlTblCumplimiento += '    </div>';

                htmlTblCumplimiento += '  </div>';

                htmlTblCumplimiento += '</td>';

                htmlTblCumplimiento += ' </tr>';

            }

            $("#tblCumpliento").html(htmlTblCumplimiento);

        }

    });





}



$("#uploadForm").on('submit', function (e) {

    e.preventDefault();

    $.ajax({

        type: 'POST',

        url: '?r=user/UploadArchivoSeg',

        data: new FormData(this),

        contentType: false,

        cache: false,

        processData: false,

        beforeSend: function () {

            $('#uploadStatus').html('<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />');

        },

        error: function (ex) {

            $('#uploadStatus').html('<span style="color:#EA4335;">Images upload failed, please try again.<span>');

        },

        success: function (data) {

            debugger;

            $('#uploadForm')[0].reset();

            $('#uploadStatus').html('');

            bootbox.alert({

                message: 'Imágenes subidas con éxito',

                size: 'small'

            });

            var ht = "";

            $("#imgAdj").html(ht);

            if (data.success) {

                ht = "";

                for (i = 0; i < data.data.length; i++) {

                    ht += '<div class="col-4">';

                    ht += '     <div class="card" style="width: 18rem;">';

                    ht += '       <img class="card-img-top" src="' + data.data[i].cRuta + '" alt="Card image cap" style="height:12rem;">';

                    ht += '        <div class="card-body">';

                    ht += '          <h5 class="card-title">' + data.data[i].cNombre + '</h5>';

                    ht += '          <a href="#" class="btn btn-primary">Remover</a>';

                    ht += '        </div>';

                    ht += '      </div>';

                    ht += '   </div>';



                }

                $("#imgAdj").html(ht);



            } else {

                $("#imgAdj").append("<span style='color:#EA4335;'>Error al cargar las im�genes. Vuelve a intentarlo.<span>");

            }

        }

    });

});



// File type validation

$("#fileInput").change(function () {

    var fileLength = this.files.length;

    var match = ["image/jpeg", "image/png", "image/jpg", "image/gif"];

    var i;

    for (i = 0; i < fileLength; i++) {

        var file = this.files[i];

        var imagefile = file.type;

        if (!((imagefile == match[0]) || (imagefile == match[1]) || (imagefile == match[2]) || (imagefile == match[3]))) {

            alert('Please select a valid image file (JPEG/JPG/PNG/GIF).');

            $("#fileInput").val('');

            return false;

        }

    }

});