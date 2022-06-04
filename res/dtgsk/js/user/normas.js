var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

$(document).ready(function(e) {
    allNorma();
});

function allNorma() {
    $.ajax({
        url: "./?r=user/allNorma",
        contentType: false,
        cache: false,
        processData: false,
        success: function(data) {

            obj = new Array();
            obj = JSON.parse(data);
            // debugger;
            html = "";
            for (i = 0; i < obj.length; i++) {
                nid = obj[i].nId;
                control = obj[i].control;
                valor = obj[i].cValor;
                observacion = obj[i].cObservacion;
                html += '<tr>';
                html += '<td>' + control + '</td>';
                html += '<td>' + valor + '</td>';
                html += '<td>' + observacion + '</td>';
                html += '<td class="text-right">';
                html += '  <div class="dropdown">';
                html += '    <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
                html += '      <i class="fas fa-ellipsis-v"> </i>';
                html += '    </a>';
                html += '    <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';
                html += '      <a class="dropdown-item btnPass" href="#" data="' + nid + '">';
                html += ' Modificar </a>';
                html += '      <a class="dropdown-item btnDelete" href="#" data="' + nid + '">';
                html += ' Eliminar </a>';
                html += '    </div>';
                html += '  </div>';
                html += '</td>';

                html += '</tr>';
            }
            $("#tblNormas").html(html);

            $('.btnPass').on('click', function(e) {
                e.preventDefault();
                document.getElementById('fnUpdateNorma').reset();
                $("#smslogMod").html("");
                dataNormaUpd($(this).attr('data')); //PARA CARGAR DATOS
                $("#modalUpdNorma").modal("show");
            });

            $('.btnDelete').on('click', function(e) {
                e.preventDefault();
                document.getElementById('fnDelNorma').reset();
                $("#smslogEliminarNorma").html("");
                $("#IdNorma").val($(this).attr('data'));
                $html = '<label class="" id="NormaDesc" name="NormaDesc">' + '¿Seguro de eliminar la norma?' + '</label>'
                $("#NormaDel").html($html);
                $("#modalDelNorma").modal("show");
            });
        }
    });
}


function dataNormaUpd(nIdNorma) {
    exito = false;
    document.getElementById('fnUpdateNorma').reset();
    $("#smslogMod55").html("");
    $.ajax({
        url: "./?r=user/datNormaUpd",
        type: "POST",
        data: { xnIdNorma: nIdNorma },
        success: function(data) {
            obj = new Array();
            obj = JSON.parse(data);
            $("#NormaId").val(obj[0].nId);
            $("#Control").val(obj[0].cDescripcion);
            $("#Valor").val(obj[0].Valor);
            $("#Observacion").val(obj[0].cObservacion);
        }
    });
}


$("#fnDeleteNorma").click(function(e) { //angc2021
    e.preventDefault();
    htmlprocesando = "";
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        var codigoNorma = document.getElementById("IdNorma").value;
        $.ajax({
            url: "?r=user/EliminarNorma",
            type: "POST",
            data: { codigoNorma: codigoNorma },
            success: function(data) {
                if (data.success == true) {
                    $("#smslogEliminarNorma").fadeIn(1000).html(htmlprocesando + data.message);
                    location.reload();
                } else {
                    $("#smslogEliminarNorma").addClass("text-warning");
                    $("#smslogEliminarNorma").fadeIn(1000).html("");
                    $("#smslogEliminarNorma").html(data.message + "...");
                }
            },
            beforeSend: function(objeto) {
                $("#smslogEliminarNorma").addClass("text-success");
                $("#smslogEliminarNorma").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function(result) {
                $("#smslogEliminarNorma").fadeIn(1000).html("");
                $("#smslogEliminarNorma").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        $("fnDeleteNorma").prop('disabled', false);
        return false;
    }
    return false;
});

// function deleteUser(user) {
//     debugger;
//     $.ajax({
//         url: "./?r=user/deleteUser",
//         type: "POST",
//         data: { xUser: user },
//         success: function(data) {
//             if (data.success == true) {
//                 allUser();
//                 // document.getElementById("fnDeleteSalir").click();
//             } else {
//                 htmldiv = "";
//                 htmldiv += '<div class="alert alert-primary alert-dismissible fade show" role="alert">';
//                 htmldiv += '<span class="alert-icon"><i class="ni ni-like-2"></i></span>';
//                 htmldiv += ' <span class="alert-text"><strong>Alerta!</strong>' + data.message + '!</span>';
//                 htmldiv += '<button type="button" class="close" data-dismiss="alert" aria-label="Close">';
//                 htmldiv += '  <span aria-hidden="true">&times;</span>';
//                 htmldiv += '</button>';
//                 htmldiv += '</div>';
//                 $("#notifica").html(htmldiv);
//             }
//         }
//     });
// }

$("#fnRegister").submit(function(e) {
    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        //  var formData = new FormData(this, "#fnProccessloginPro");
        var formElement = document.getElementById("fnRegister");
        var formData = new FormData(formElement)
            // var formData = form.serialize();
        $.ajax({
            url: "?r=user/registroNorma",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                if (data.success == true) {

                    $("#btnlogin_icono").removeClass("icon-danger");
                    $("#btnlogin_icono").addClass("icon-success");
                    $("#smslog").fadeIn(1000).html(htmlprocesando + data.message);
                    allNorma();

                    document.getElementById('fnRegister').reset();
                } else {
                    $("#btnlogin_icono").removeClass("icon-success");
                    $("#btnlogin_icono").addClass("icon-warning");

                    $("#smslog").addClass("text-warning");
                    $("#smslog").fadeIn(1000).html("");
                    $("#smslog").html(data.message + "...");
                }
            },
            beforeSend: function(objeto) {
                $("#btnlogin_icono").addClass("icon-success");
                $("#smslog").addClass("text-success");
                $("#smslog").fadeIn(1000).html(htmlprocesando + 'Procesando ...');

            },
            error: function(result) {
                $("#btnlogin_icono").addClass("text-warning");
                $("#smslog").fadeIn(1000).html("");
                $("#smslog").fadeIn(1000).html(result + "...");

                return false;
            }
        });
        return exito;
    }
    return false;
});


$("#btnActualizazNorma").click(function(e) {
    e.preventDefault();
    if (window.FormData !== undefined)
    {
        var formElement = document.getElementById("fnUpdateNorma");
        var formData = new FormData(formElement)
        $.ajax({
            url: "?r=user/UpdateNorma",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                if (data.success == true) {
                    $("#smslogMod55").fadeIn(1000).html(htmlprocesando + data.message);
                    allNorma();

                    // document.getElementById('fnUpdateNorma').reset();
                } else {

                    $("#smslogMod55").addClass("text-warning");
                    $("#smslogMod55").fadeIn(1000).html("");
                    $("#smslogMod55").html(data.message + "...");
                }
            },
            beforeSend: function(objeto) {
                $("#smslogMod55").addClass("text-success");
                $("#smslogMod55").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function(result) {
                $("#smslogMod55").fadeIn(1000).html("");
                $("#smslogMod55").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        return exito;
    }
    return false;
});

