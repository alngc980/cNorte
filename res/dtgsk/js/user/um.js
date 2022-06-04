var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

$(document).ready(function(e) {
    allUm();

});

function allUm() {
    $.ajax({
        url: "./?r=user/allUm",
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
                empresa = obj[i].empresa;
                tipo = obj[i].tipo;
                placa = obj[i].cPlaca;
                html += '<tr>';
                html += '<td>' + empresa + '</td>';
                html += '<td>' + tipo + '</td>';
                html += '<td>' + placa + '</td>';
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
            $("#tblUM").html(html);

            $('.btnPass').on('click', function(e) {
                e.preventDefault();
                document.getElementById('fnUpdateUM').reset();
                $("#smslogMod").html("");
                dataCargoUpd($(this).attr('data')); //PARA CARGAR DATOS
                $("#modalUpdUm").modal("show");
            });

            $('.btnDelete').on('click', function(e) {
                e.preventDefault();
                document.getElementById('fnDelUM').reset();
                $("#smslogdel").html("");

                $("#umIdDel").val($(this).attr('data'));
                $html = '<label class="" id="umDelDescrip" name="umDelDescrip">' + '¿Seguro de eliminar la Unidad Movil?' + '</label>'
                $("#umDescripcion").html($html);

                $("#modalDelUm").modal("show");
            });
        }
    });
}

function dataCargoUpd(nIdUm) {
    exito = false;
    document.getElementById('fnUpdateUM').reset();
    $("#smslogMod").html("");
    $.ajax({
        url: "./?r=user/datUmUpd",
        type: "POST",
        data: { xnIdUm: nIdUm },
        success: function(data) {
            obj = new Array();
            obj = JSON.parse(data);
            $("#umId").val(obj.nId);
            $("#Empresa").val(obj.empresa);
            $("#TipoVehiculo").val(obj.tipo);
            $("#Placa").val(obj.cPlaca);
        }
    });
}


$("#btnUpdateUM").click(function(e) {
    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        //  var formData = new FormData(this, "#fnProccessloginPro");
        var formElement = document.getElementById("fnUpdateUM");
        var formData = new FormData(formElement)
            // var formData = form.serialize();
        $.ajax({
            url: "?r=user/UMUpdate",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                // debugger;
                if (data.success == true) {

                    $("#btnlogin_icono").removeClass("icon-danger");
                    $("#btnlogin_icono").addClass("icon-success");
                    $("#smslogMod").fadeIn(1000).html(htmlprocesando + data.message);
                    allUm();

                    // document.getElementById('fnRegister').reset();
                } else {
                    $("#btnlogin_icono").removeClass("icon-success");
                    $("#btnlogin_icono").addClass("icon-warning");

                    $("#smslogMod").addClass("text-warning");
                    $("#smslogMod").fadeIn(1000).html("");
                    $("#smslogMod").html(data.message + "...");
                }
            },
            beforeSend: function(objeto) {
                $("#btnlogin_icono").addClass("icon-success");
                $("#smslogMod").addClass("text-success");
                $("#smslogMod").fadeIn(1000).html(htmlprocesando + 'Procesando ...');

            },
            error: function(result) {
                $("#btnlogin_icono").addClass("text-warning");
                $("#smslogMod").fadeIn(1000).html("");
                $("#smslogMod").fadeIn(1000).html(result + "...");

                return false;
            }
        });
        return true;
    }
    return false;
});



$("#fnDeleteUM").click(function(e) { //angc2021
    e.preventDefault();
    htmlprocesando = "";
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        var codigoUM = document.getElementById("umIdDel").value;
        $.ajax({
            url: "?r=user/EliminarUM",
            type: "POST",
            data: { codigoUM: codigoUM },
            success: function(data) {
                if (data.success == true) {
                    $("#smslogdel").fadeIn(1000).html(htmlprocesando + data.message);
                    location.reload();
                } else {
                    $("#smslogdel").addClass("text-warning");
                    $("#smslogdel").fadeIn(1000).html("");
                    $("#smslogdel").html(data.message + "...");
                }
            },
            beforeSend: function(objeto) {
                $("#smslogdel").addClass("text-success");
                $("#smslogdel").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function(result) {
                $("#smslogdel").fadeIn(1000).html("");
                $("#smslogdel").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        $("fnDeleteCargo").prop('disabled', false);
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
            url: "?r=user/registroUm",
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
                    allUm();

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