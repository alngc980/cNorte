var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

$(document).ready(function(e) {
    allEmpresaCargo();
});

function allEmpresaCargo() {
    $.ajax({
        url: "./?r=user/allEmpresaCargo",
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
                empresa = obj[i].cNombre;
                cargo = obj[i].cCargo;
                html += '<tr>';
                html += '<td>' + empresa + '</td>';
                html += '<td>' + cargo + '</td>';
                html += '<td class="text-right">';
                html += '  <div class="dropdown">';
                html += '    <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
                html += '      <i class="fas fa-ellipsis-v"> </i>';
                html += '    </a>';
                html += '    <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';
                html += '      <a class="dropdown-item btnPassCargo" data="' + obj[i].nId + '">';
                html += ' Modificar </a>';
                html += '      <a class="dropdown-item btnDeleteCargo" data="' + obj[i].nId + '">';
                html += ' Eliminar </a>';
                html += '    </div>';
                html += '  </div>';
                html += '</td>';

                html += '</tr>';
            }
            $("#tblCargos").html(html);

            $('.btnPassCargo').on('click', function(e) {
                e.preventDefault();
                document.getElementById('fnUpdateCargo').reset();
                $("#smslogM").html("");
                dataCargoUpd($(this).attr('data')); //PARA CARGAR DATOS
                $("#modalUpdCargo").modal("show");
            });

            $('.btnDeleteCargo').on('click', function(e) {
                e.preventDefault();
                document.getElementById('fnDelCargo').reset();
                $("#smslogEliminar").html("");

                $("#IdCargo").val($(this).attr('data'));
                $html = '<label class="" id="userDelNombre" name="userDelNombre">' + '¿Seguro de eliminar el cargo?' + '</label>'
                $("#CargoDel").html($html);

                $("#modalDelCargo").modal("show");
            });
        }
    });
}

function deleteUser(user) {
    $.ajax({
        url: "./?r=user/deleteUser",
        type: "POST",
        data: { xUser: user },
        success: function(data) {
            if (data.success == true) {
                allUser();
                // document.getElementById("fnDeleteSalir").click();
            } else {
                htmldiv = "";
                htmldiv += '<div class="alert alert-primary alert-dismissible fade show" role="alert">';
                htmldiv += '<span class="alert-icon"><i class="ni ni-like-2"></i></span>';
                htmldiv += ' <span class="alert-text"><strong>Alerta!</strong>' + data.message + '!</span>';
                htmldiv += '<button type="button" class="close" data-dismiss="alert" aria-label="Close">';
                htmldiv += '  <span aria-hidden="true">&times;</span>';
                htmldiv += '</button>';
                htmldiv += '</div>';
                $("#notifica").html(htmldiv);

            }
        }
    });
}


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
            url: "?r=user/registroCargo",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                debugger;
                if (data.success == true) {

                    $("#btnlogin_icono").removeClass("icon-danger");
                    $("#btnlogin_icono").addClass("icon-success");
                    $("#smslog").fadeIn(1000).html(htmlprocesando + data.message);
                    allEmpresaCargo();

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
        return true;
    }
    return false;
});


function dataCargoUpd(nIdCargo) {
    exito = false;
    document.getElementById('fnUpdateCargo').reset();
    $("#smslogMod").html("");
    $.ajax({
        url: "./?r=user/datCargoUpd",
        type: "POST",
        data: { xnIdCargo: nIdCargo },
        success: function(data) {
            obj = new Array();
            obj = JSON.parse(data);
            $("#CargoId").val(obj.nId);
            $("#Empresa").val(obj.cNombre);
            $("#Cargo").val(obj.cCargo);
        }
    });
}

$("#btnUpdateCargo").click(function(e) {
    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        //  var formData = new FormData(this, "#fnProccessloginPro");
        var formElement = document.getElementById("fnUpdateCargo");
        var formData = new FormData(formElement)
            // var formData = form.serialize();
        $.ajax({
            url: "?r=user/CargoUpd",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                debugger;
                if (data.success == true) {

                    $("#btnlogin_icono").removeClass("icon-danger");
                    $("#btnlogin_icono").addClass("icon-success");
                    $("#smslogMod").fadeIn(1000).html(htmlprocesando + data.message);
                    allEmpresaCargo();

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





$("#fnDeleteCargo").click(function(e) { //angc2021
    e.preventDefault();
    htmlprocesando = "";
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        var codigoCargo = document.getElementById("IdCargo").value;
        $.ajax({
            url: "?r=user/EliminarCargo",
            type: "POST",
            data: { codigoCargo: codigoCargo },
            success: function(data) {
                if (data.success == true) {
                    $("#smslogEliminar").fadeIn(1000).html(htmlprocesando + data.message);
                    location.reload();
                } else {
                    $("#smslogEliminar").addClass("text-warning");
                    $("#smslogEliminar").fadeIn(1000).html("");
                    $("#smslogEliminar").html(data.message + "...");
                }
            },
            beforeSend: function(objeto) {
                $("#smslogEliminar").addClass("text-success");
                $("#smslogEliminar").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function(result) {
                $("#smslogEliminar").fadeIn(1000).html("");
                $("#smslogEliminar").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        $("fnDeleteCargo").prop('disabled', false);
        return false;
    }
    return false;
});