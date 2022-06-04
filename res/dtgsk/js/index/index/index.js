var ht = "";
var tipoReg = 1;
var respuestaregistro;
var dniruc;


$(document).ready(function() {
    dniruc = document.getElementById("idni");

    ht = '';
    ht += '<br><span id="idSpanUser"><strong>Solicitud de reprogramación - Personal</strong></span>';
    $("#btnlogin_icono").html(ht);
    demo.initFormExtendedDatetimepickers();
    tipoReg = 1
});

$("#fnRegistro").submit(function(e) {
    exito = true;
    $("#HIDDHCargaProceso").html("Validando registro...");
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
        url: "?r=index/processregister",
        type: "POST",
        data: formData,
        contentType: false,
        cache: false,
        processData: false,
        success: function(data) {

            if (data.success == true) {
                setTimeout(($("#HIDDHCargaProceso").html(data.message)), 5000);
                limpiar();

            } else {
                setTimeout(($("#HIDDHCargaProceso").html(data.message)), 5000);
            }

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
    $("#iplazo").val("");
    $("#idireccion").val("");
    $("#icomentario").val("");
    $("#icorreo").val("");

}
$(".tipoInm").change(function() {

    if ($("#tipoInm").is(':checked')) {
        ht = '';
        tipoReg = 1;
        ht += '<br><span id="idSpanUser"><strong>Solicitud de reprogramación - Personal </strong></span>';
        $("#btnlogin_icono").html(ht);
        $("#ilblNombre").html("Nombres (*)");
        $("#ilbldni").html("DNI Titular (*)");
        $("#ilblGroupapellido").show();
        $("#ilblNombregroup").removeClass("col-md-12");
        $("#ilblNombregroup").addClass("col-md-6");
        $("#iNombres").val("");
        $('#iApellidos').prop("required", true);
        $("#idni").val("");
        $("#iApellidos").val("");


        dniruc.setAttribute("minlength", "8");
        dniruc.setAttribute("maxlength", "8");

    } else {
        ht = '';
        tipoReg = 2;
        ht += '<br><span id="idSpanUser"><strong>Solicitud de reprogramación - Empresarial </strong></span>';
        $("#btnlogin_icono").html(ht);

        $("#ilblNombre").html("Razon Social (*)");
        $("#ilbldni").html("RUC (*)");
        $("#ilblGroupapellido").hide();
        $("#ilblNombregroup").removeClass("col-md-6");
        $("#ilblNombregroup").addClass("col-md-12");
        $("#iNombres").val("");
        $('#iApellidos').removeAttr("required");
        dniruc.setAttribute("minlength", "11");
        dniruc.setAttribute("maxlength", "11");
        $("#idni").val("");
        $("#iApellidos").val("");


    }
});

function validaPersona() {
    debugger;
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
    debugger;
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