var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';
var smsvalida;
$(document).ready(function() {



});

// function getCodigo() {
//     $.ajax({
//         url: "./?r=user/obtenerNuevoUser",
//         contentType: false,
//         cache: false,
//         processData: false,
//         success: function(data) {
//             obj = new Array();
//             obj = JSON.parse(data);
//             $("#txtUser").val(obj.newUser);

//         }
//     })
// }

$("#fnRegisterPersona").submit(function(e) {
    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        //  var formData = new FormData(this, "#fnProccessloginPro");
        var formElement = document.getElementById("fnRegisterPersona");
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
                    document.getElementById('fnRegisterPersona').reset();
                    //getCodigo();


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
        return false;
    }

    return false;
});