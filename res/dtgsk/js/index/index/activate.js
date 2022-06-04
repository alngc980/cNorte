var ht = "";
var tipoReg = 1;
var respuestaregistro;
var dniruc;


$(document).ready(function() {
    recargaCapcha();
    dniruc = document.getElementById("idni");

    ht = '';
    ht += '<br><span id="idSpanUser"><strong>Solicitud - Personal</strong></span>';
    $("#btnlogin_icono").html(ht);
    demo.initFormExtendedDatetimepickers();
    $(".perJur ").addClass('hidedata');
    tipoReg = 1
});

function recargaCapcha() {
    grecaptcha.ready(function() {
        grecaptcha.execute('6LfYSvcUAAAAAHUTP5Bsu5W-9l_-Diufdmhx0bza', { action: 'contact' })
            .then(function(token) {
                var recaptchaResponse = document.getElementById('recaptchaResponse');
                console.log(recaptchaResponse)
                recaptchaResponse.value = token;
            });
    });
}
$("#fnRegistro").submit(function(e) {



    exito = true;
    exito = validarRegistro();
    if (exito == true) {
        e.preventDefault();
        if (window.FormData !== undefined) {
            var formData = new FormData(this);

            RTRegistro(formData);

            return exito;
        } else {
            $("#HIDDHCargaProceso").html(respuestaregistro);

        }
    } else {
        $("#HIDDHCargaProceso").html(respuestaregistro);
        return false;
    }
});



function RTRegistro(formData) {

    $.ajax({
        url: "activar",
        type: "POST",
        data: formData,
        contentType: false,
        cache: false,
        processData: false,
        success: function(dato) {

            if (dato.success == true) {
                $("#idModalSms").html(dato.message);
                $("#idModal").removeClass("hidedata");
                setTimeout(($("#HIDDHCargaProceso").html(dato.message)), 5000);


                limpiar();

            } else {
                setTimeout(($("#HIDDHCargaProceso").html(dato.message)), 5000);
            }
            recargaCapcha();

        },
        beforeSend: function(objeto) {
            $("#HIDDHCargaProceso").html("Procesando...");
        },
        error: function(result) {
            $("#HIDDHCargaProceso").html(result + " ...");
            return false;
        }
    });
}

function limpiar() {
    $("#iNombres").val("");
    $("#iApellidos").val("");
    $("#idni").val("");
    $("#irepresentante").val("");
    $("#imonto").val("");
    $("#ifono").val("");
    $("#idireccion").val("");
    $("#icomentario").val("");
    $("#icorreo").val("");
    $("#idActividad").val("");
    $("#idniRuc").val("");



}
$(".tipoInm").change(function() {

    if ($("#tipoInm").is(':checked')) {
        ht = '';
        tipoReg = 1;
        ht += '<br><span id="idSpanUser"><strong>Solicitud - Personal </strong></span>';
        $("#btnlogin_icono").html(ht);
        $("#ilblNombre").html("Nombres (*)");
        $("#ilbldni").html("DNI Titular (*)");
        $("#ilblGroupapellido").show();
        $("#ilblNombregroup").removeClass("col-md-12");
        $("#ilblNombregroup").addClass("col-md-6");
        $("#iNombres").val("");
        $('#iApellidos').prop("required", true);
        $('#idniRuc').prop("required", true);
        $("#idni").val("");
        $("#iApellidos").val("");


        $("#ilbldniGroupRucTit").removeClass("hidedata");
        // $("#ilbldniGroup").addClass("col-md-12");
        // $("#ilbldniGroup").removeClass("col-md-6");


        dniruc.setAttribute("minlength", "8");
        dniruc.setAttribute("maxlength", "8");
        $(".perJur").removeClass('showdata');
        $(".perJur").addClass('hidedata');
        $('#iNombres').prop("pattern", '([[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+])\w');


    } else {
        ht = '';
        tipoReg = 2;
        ht += '<br><span id="idSpanUser"><strong>Solicitud - Empresarial </strong></span>';
        $("#btnlogin_icono").html(ht);
        $("#ilbldniGroupRucTit").addClass("hidedata");
        $("#ilblNombre").html("Razon Social (*)");

        $('#iNombres').removeAttr("pattern");
        //  $('#iNombres').prop("pattern", "[-a-zA-Z0-9~!$%^&amp;*_=+}{'?]+(\.[-a-zA-Z0-9~!$%^&amp;*_=+}{'?]+)*@([a-zA-Z0-9_][-a-zA-Z0-9_]*(\.[-a-zA-Z0-9_]+)*\.([cC][oO][mM]))(:[0-9]{1,5})?");
        $("#ilbldni").html("RUC (*)");
        $("#ilblGroupapellido").hide();

        // $("#ilbldniGroup").removeClass("col-md-12");
        // $("#ilbldniGroup").addClass("col-md-6");
        $("#ilblNombregroup").removeClass("col-md-12");
        $("#ilblNombregroup").addClass("col-md-6");
        $("#iNombres").val("");
        $('#iApellidos').removeAttr("required");
        $('#idniRuc').removeAttr("required");
        dniruc.setAttribute("minlength", "11");
        dniruc.setAttribute("maxlength", "11");
        $("#idni").val("");
        $("#iApellidos").val("");
        $(".perJur ").removeClass('hidedata');
        $(".perJur ").addClass('showdata');


    }
});

function validaPersona() {

    exito = false;
    if (gvalidadatos(2, $("#iNombres").val().trim())) {
        if (gvalidadatos(2, $("#iApellidos").val().trim())) {
            if ($("#iAgencia").val() == null) {
                exito = false;
                respuestaregistro = "<strong>Error: </strong> Por favor elija su agencia";
            } else {
                // if ($("#idni").val().trim().length == 0 exito = true;
            }

        }

    } else {
        exito = false;
    }
    return exito;
}

function validadEmpresa() {

    exito = false;
    if (gvalidadatos(2, $("#iNombres").val().trim())) {
        if ($("#iAgencia").val() == null) {
            exito = false;
            respuestaregistro = "<strong>Error: </strong> Por favor elija su agencia";
        } else {
            exito = true;
        }



    } else {
        exito = false;
    }
    return exito;
}

function validarRegistro() {
    estadovalida = true;
    try {

        switch (tipoReg) {
            case 1:
                estadovalida = validaPersona();
                break;
            case 2:
                estadovalida = validadEmpresa();
                break;

        }

    } catch (e) {
        estadovalida = false;
        respuestaregistro = "<string>Error:</string> No dejar campos vacios";
        // console.log(e.name); // muestra 'Error'
        // console.log(e.message); 
    }
    return estadovalida;
}