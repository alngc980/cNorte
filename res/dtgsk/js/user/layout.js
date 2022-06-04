jQuery(document).ready(function ($) {
    $(document).ready(function () {
        $('.mi-selector').select2();
    });
});

function fnRedir(ruta) {
    sleep(3000);
    window.location = ruta;
}

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds) {
            break;
        }
    }
}

function armaTabla(output) {

    var output;
    $("#tbluser tr").remove();
    if (obj.length > 0) {
        for (i = 0; i < obj.length; i++) {
            if (obj[i].bAdmin == 1) {
                output += '<tr>';
                if (obj[i].nEstado == 1) {
                    output += '<th scope="row">';
                    output += '  <div class="media align-items-center">';
                    output += '    <a href="#" class="avatar rounded-circle mr-3">';
                    if (obj[i].bAdmin == 1) {
                        output += '      <img alt="Image placeholder" src="./res/img/admin.png">';
                    } else {
                        output += '      <img alt="Image placeholder" src="./res/img/nanito5.png">';
                    }

                    output += '    </a>';
                    output += '    <div class="media-body">';
                    output += '      <span class="name mb-0 text-sm">';
                    output += obj[i].cNombres.toUpperCase()
                    output += '    </div>';
                    output += '  </div>';
                    output += '</th>';
                } else {
                    output += '<th scope="row">';
                    output += '  <div class="media align-items-center">';
                    output += '    <a href="#" class="avatar rounded-circle mr-3">';
                    if (obj[i].bAdmin == 1) {
                        output += '      <img alt="Image placeholder" src="./res/img/adminOff.png">';
                    } else {
                        output += '      <img alt="Image placeholder" src="./res/img/nanitooff.png">';
                    }
                    output += '    </a>';
                    output += '    <div class="media-body">';
                    output += '      <span class="name mb-0 text-sm">';
                    output += obj[i].cNombres.toUpperCase()
                    output += '    </div>';
                    output += '  </div>';
                    output += '</th>';
                }

                output += '<td class="budget">';
                output += obj[i].cApellidos.toUpperCase();
                output += '</td>';
                output += '<td>';
                output += '  <div class="d-flex align-items-center">';
                output += '    <span class="completion mr-2">';
                if (obj[i].bAdmin == 1) {
                    output += 'Administrador';
                } else {
                    output += 'Usuario';
                }
                output += '    </span><div>';
                output += '    </div>';
                output += '  </div>';
                output += '</td>';
                output += '<td>';
                if (obj[i].nEstado == 1) {
                    output += '  <span class="badge badge-dot mr-4">';
                    output += '    <i class="bg-success"> </i>';
                    output += '   <span class="status">';
                    output += ' Activado </span>';
                    output += '  </span>';
                } else {
                    output += '  <span class="badge badge-dot mr-4">';
                    output += '    <i class="bg-warning"> </i>';
                    output += '   <span class="status">';
                    output += ' Desactivado </span>';
                    output += '  </span>';
                }

                output += '</td>';
                output += '<td class="text-right">';
                output += '  <div class="dropdown">';
                output += '    <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
                output += '      <i class="fas fa-ellipsis-v"> </i>';
                output += '    </a>';
                output += '    <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';
                output += '      <a class="dropdown-item btnOnOff" href="#" data="' + obj[i].nId + '">';
                output += ' on / off </a>';
                output += '      <a class="dropdown-item btnPass" href="#" data="' + obj[i].nId + '">';
                output += ' Modificar </a>';
                if (obj[i].bAdmin == 1) {
                    output += '<a class="dropdown-item btnRoot" href="#" data="' + obj[i].nId + '">';
                    output += ' Quitar Adm. </a>';
                } else {
                    output += '<a class="dropdown-item btnRoot" href="#" data="' + obj[i].nId + '">';
                    output += ' Otorgar Adm. </a>';
                }

                output += '      <a class="dropdown-item btnDelete" href="#" data="' + obj[i].nId + '">';
                output += ' Eliminar </a>';
                output += '    </div>';
                output += '  </div>';
                output += '</td>';
                output += '</tr>';
            }


        }
    } else {
        output = '<tr class="jumbotron text-center"> < td colspan = "4" > No existen registros, por ahora < /td> < /tr > ';
    }

    $("#tbluser").html(output);
    $('.btnOnOff').on('click', function (e) {
        e.preventDefault();
        onOFF($(this).attr('data'));
    });

    $('.btnPass').on('click', function (e) {
        e.preventDefault();
        document.getElementById('fnUpdatePersona').reset();
        $("#smslogM").html("");
        dataUserUpd($(this).attr('data')); //PARA CARGAR DATOS
        $("#modalUpd").modal("show");
    });

    $('.btnRoot').on('click', function (e) {
        e.preventDefault();
        onOFFRoot($(this).attr('data'));
    });

    $('.btnDelete').on('click', function (e) {
        e.preventDefault();
        document.getElementById('fnDelPersona').reset();
        $("#smslogEliminar").html("");
        dataUserDel($(this).attr('data')); //PARA CARGAR DATOS
        $("#modalDel").modal("show");
    });

}

$("#fnDelete").click(function (e) { //angc2021
    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        var codigoUsuario = document.getElementById("userDelCodigo").value;
        $.ajax({
            url: "?r=user/DeleteUserPers",
            type: "POST",
            data: { codigoUsuario: codigoUsuario },
            success: function (data) {
                if (data.success == true) {
                    $("#smslogEliminar").fadeIn(1000).html(htmlprocesando + data.message);
                    // $("#smslogEliminar").fadeIn(1000).html("");
                    // $("#smslogEliminar").html(data.message + "...");
                } else {
                    $("#smslogEliminar").addClass("text-warning");
                    $("#smslogEliminar").fadeIn(1000).html("");
                    $("#smslogEliminar").html(data.message + "...");
                }
            },
            beforeSend: function (objeto) {
                $("#smslogEliminar").addClass("text-success");
                $("#smslogEliminar").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function (result) {
                $("#smslogEliminar").fadeIn(1000).html("");
                $("#smslogEliminar").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        $("fnDelete").prop('disabled', true);
        allUser();
        return exito;
    }
    return false;
});

$('.btnDeleteInforme').on('click', function (e) {
    e.preventDefault();
    document.getElementById('fnDelInforme').reset();
    $("#smslogEliminar").html("");

    $("#InformeDelCodigo").val($(this).attr('data'));
    $html = '<label class="" id="userDelNombre" name="userDelNombre">' + '¿Seguro de elimnar informe?' + '</label>'
    $("#InformeDelNombre").html($html);

    $("#modalDelInforme").modal("show");
});

$("#fnDeleteInforme").click(function (e) { //angc2021
    e.preventDefault();
    htmlprocesando = "";
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        var codigoInforme = document.getElementById("InformeDelCodigo").value;
        $.ajax({
            url: "?r=user/EliminarInforme",
            type: "POST",
            data: { codigoInforme: codigoInforme },
            success: function (data) {
                if (data.success == true) {
                    $("#smslogEliminar").fadeIn(1000).html(htmlprocesando + data.message);
                    location.reload();
                } else {
                    $("#smslogEliminar").addClass("text-warning");
                    $("#smslogEliminar").fadeIn(1000).html("");
                    $("#smslogEliminar").html(data.message + "...");
                }
            },
            beforeSend: function (objeto) {
                $("#smslogEliminar").addClass("text-success");
                $("#smslogEliminar").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function (result) {
                $("#smslogEliminar").fadeIn(1000).html("");
                $("#smslogEliminar").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        $("fnDeleteInforme").prop('disabled', false);
        return false;
    }
    //href="./?r=user/documento"
    return false;
});



function dataUserUpd(user) {
    exito = false;
    $.ajax({
        url: "./?r=user/datUserUpd",
        type: "POST",
        data: { xUser: user },
        success: function (data) {
            obj = new Array();
            obj = JSON.parse(data);
            $("#userCodigo").val(obj.nId);
            $("#userDoi").val(obj.cDoi);
            $("#userNombre").val(obj.cNombres);
            $("#userApellido").val(obj.cApellidos);
            $("#userUser").val(obj.cUsuario);
            $("#userClave").val("");
        }
    });
}

function dataUserDel(user) {
    exito = false;
    $.ajax({
        url: "./?r=user/datUserUpd",
        type: "POST",
        data: { xUser: user },
        success: function (data) {
            obj = new Array();
            obj = JSON.parse(data);
            $("#userDelCodigo").val(obj.nId);
            // $("#userDelNombre").value("¿Estas seguro que deseas Eliminar a "+obj.cNombres+"?");
            $html = '<label class="" id="userDelNombre" name="userDelNombre">' + '¿Estas seguro que deseas Eliminar a ' + obj.cNombres + '?' + '</label>'
            $("#userDelNombre").html($html);
        }
    });
}



$("#fnUpdatePersona").submit(function (e) { //angc2021
    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        //  var formData = new FormData(this, "#fnProccessloginPro");
        var formElement = document.getElementById("fnUpdatePersona");
        var formData = new FormData(formElement)
        // var formData = form.serialize();
        $.ajax({
            url: "?r=user/updateUserPerson",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#smslogM").fadeIn(1000).html(htmlprocesando + data.message);
                } else {
                    $("#smslogM").addClass("text-warning");
                    $("#smslogM").fadeIn(1000).html("");
                    $("#smslogM").html(data.message + "...");
                }
            },
            beforeSend: function (objeto) {
                $("#smslogM").addClass("text-success");
                $("#smslogM").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function (result) {
                $("#smslogM").fadeIn(1000).html("");
                $("#smslogM").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        allUser();
        return exito;
    }
    return false;
});

$("#fnRegisterM").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        //  var formData = new FormData(this, "#fnProccessloginPro");
        var formElement = document.getElementById("fnRegisterM");
        var formData = new FormData(formElement)
        // var formData = form.serialize();
        $.ajax({
            url: "?r=user/updateUser",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {

                    $("#smslogM").fadeIn(1000).html(htmlprocesando + data.message);


                } else {

                    $("#smslogM").addClass("text-warning");
                    $("#smslogM").fadeIn(1000).html("");
                    $("#smslogM").html(data.message + "...");
                }

            },
            beforeSend: function (objeto) {
                $("#smslogM").addClass("text-success");
                $("#smslogM").fadeIn(1000).html(htmlprocesando + 'Procesando ...');

            },
            error: function (result) {
                $("#smslogM").fadeIn(1000).html("");
                $("#smslogM").fadeIn(1000).html(result + "...");

                return false;
            }
        });
        return exito;
    }

    return false;
});