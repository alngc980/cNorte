var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

$(document).ready(function(e) {
    allUser();
    //getCodigo();

    // $.ajax({
    //     url: "./?r=user/reporteHome",
    //     contentType: false,
    //     cache: false,
    //     processData: false,
    //     success: function(data) {

    //         obj = new Array();
    //         obj = JSON.parse(data);
    //         $("#idTot").html(obj.totUser);
    //         $("#idTotA").html(obj.totAct);
    //         $("#idTotD").html(obj.totDes);

    //     }
    // });

});

function allUser() {
    $.ajax({
        url: "./?r=user/allUser",
        contentType: false,
        cache: false,
        processData: false,
        success: function(data) {

            obj = new Array();
            obj = JSON.parse(data);
            armaTabla(obj);

        }
    });
}

function getCodigo() {
    $.ajax({
        url: "./?r=user/obtenerNuevoUser",
        contentType: false,
        cache: false,
        processData: false,
        success: function(data) {
            obj = new Array();
            obj = JSON.parse(data);
            $("#txtUser").val(obj.newUser);
        }
    })
}

function EsUltimoAdmin() {
    $rest = false;
    $.ajax({
        url: "./?r=user/obtenerNuevoUser",
        contentType: false,
        cache: false,
        processData: false,
        success: function(data) {
            obj = new Array();
            obj = JSON.parse(data);
            $("#txtUser").val(obj.newUser);
        }
    })

    return $rest;
}

function onOFFRoot(user) {
    $.ajax({
        url: "?r=user/onOFFRoot",
        type: "POST",
        data: { xUser: user },
        success: function(data) {
            if (data.success == true) {
                allUser();
            } else {
                htmldiv = "";
                htmldiv += '<div class="alert alert-warning alert-dismissible fade show" role="alert">';
                htmldiv += '<span class="alert-icon"><i class="ni ni-like-2"></i></span>';
                htmldiv += ' <span class="alert-text"><strong>Alerta!</strong>' + data.message + '!</span>';
                htmldiv += '<button type="button" class="close" data-dismiss="alert" aria-label="Close">';
                htmldiv += '  <span aria-hidden="true">&times;</span>';
                htmldiv += '</button>';
                htmldiv += '</div>';
                $("#notifica").html(htmldiv);
                document.getElementById("link").click();
            }
        },
    });
}

function onOFF(user) {
    $.ajax({
        url: "./?r=user/onOFF",
        type: "POST",
        data: { xUser: user },
        success: function(data) {
            if (data.success == true) {
                allUser();
            } else {
                htmldiv = "";
                htmldiv += '<div class="alert alert-warning alert-dismissible fade show" role="alert">';
                htmldiv += '<span class="alert-icon"><i class="ni ni-like-2"></i></span>';
                htmldiv += ' <span class="alert-text"><strong>Alerta!</strong>' + data.message + '!</span>';
                htmldiv += '<button type="button" class="close" data-dismiss="alert" aria-label="Close">';
                htmldiv += '  <span aria-hidden="true">&times;</span>';
                htmldiv += '</button>';
                htmldiv += '</div>';
                $("#notifica").html(htmldiv);
                document.getElementById("link").click();
            }
        }
    });
}

function deleteUser(user) {
    debugger;
    
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
            url: "?r=user/registroUser",
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
                    allUser();
                    getCodigo();

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