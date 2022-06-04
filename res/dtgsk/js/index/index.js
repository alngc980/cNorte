var exito = false;
var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';
$("#fnlogin").submit(function(e) {

    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        //  var formData = new FormData(this, "#fnProccessloginPro");
        var formElement = document.getElementById("fnlogin");
        var formData = new FormData(formElement)
            // var formData = form.serialize();
        $.ajax({
            url: "?r=user/processlogin",
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
                    setTimeout("fnRedir('" + data.ruta + "');", 1000);

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