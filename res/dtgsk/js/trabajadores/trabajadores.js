$(document).ready(function(e) {
    $("#idEmpresa").change();
});

var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';

$("#idEmpresa").change(function () {
    var valEmpresa = $("#idEmpresa").val();
    $.ajax({
        url: "./?r=trabajadores/obtenerCargoEmpresa",
        type: "POST",
        data: { IdCargo: valEmpresa },
        success: function (data) {
            //datos = new Array();
            datos = JSON.parse(data);
            var html_aux = "<option value=" + 0 + " disabled selected>Selecciones Programa</option>"
            for (i = 0; i < datos.length; i++) {
                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].cCargo + "</option>";
              
            }
            $("#idCargo").html(html_aux);
        }
    });
});

$(".btnAddTrabajador").click(function (event) {
    $("#modalAddTrabajador").modal("show");
});

$("#frmPersona").submit(function (e) {
    e.preventDefault();

    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        var form = this;
        var formData = new FormData(form);
        $.ajax({
            url: "?r=trabajadores/AddNewPersona",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#smslogM").fadeIn(1000).html(htmlprocesando + data.message);
                    form.reset();
                    document.location.reload();
                    //$("#modalAddTrabajador").modal("hide");
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
    }
    return false;
});

$("#frmPersonaEmpresa").submit(function (e) {
    e.preventDefault();

    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        var form = this;
        var formData = new FormData(form);
        $.ajax({
            url: "?r=trabajadores/AddNewPersonaEmpresa",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#smslog").fadeIn(1000).html(htmlprocesando + data.message);
                    document.location.reload();
                } else {
                    $("#smslog").addClass("text-warning");
                    $("#smslog").fadeIn(1000).html("");
                    $("#smslog").html(data.message + "...");
                }
            },
            beforeSend: function (objeto) {
                $("#smslog").addClass("text-success");
                $("#smslog").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function (result) {
                $("#smslog").fadeIn(1000).html("");
                $("#smslog").fadeIn(1000).html(result + "...");
                return false;
            }
        });
    }
    return false;
});