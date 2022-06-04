var estado = false;
var descripcion = "Validando";

$("#fnsetPass").submit(function(e) {
    e.preventDefault();
    if ($("#iPassword").val().trim() == $("#iCPassword").val().trim()) {
        if (gvalidadatos(6, $("#iPassword").val().trim())) {
            if (window.FormData !== undefined) {
                var formData = new FormData(this);
                formData.append("key", $("#keyid").html().trim());
                estado = prossRecueperar(formData);
            }
        }
    } else {
        estado = false;
        respuestaregistro = "Contraseñas no coinciden";
    }

    $("#UARespuestaReg").html(respuestaregistro);
    return estado;

});


function prossRecueperar(formData) {
    debugger;
    //Añadimos la imagen de carga en el contenedor

    $.ajax({
        url: "./?r=index/processSetPass",
        type: "POST",
        data: formData,
        contentType: false,
        cache: false,
        processData: false,
        success: function(data) {
            if (data.success == false) {
                $("#UARespuestaReg").fadeIn(1000).html(data.message);
                setTimeout("fnRedir('" + data.ruta + "');", 5000);

                //  $('#UARespuestaReg').css({display:'block'});

            } else {
                $("#UARespuestaReg").fadeIn(1000).html("");
                $("#UARespuestaReg").fadeIn(1000).html(data.message + "...");
                // $('#aEspera').css({display:'none'});
                // $("#aRespuesta").fadeIn(1000).html("");

                // 
                //  setTimeout ('$("#aRespuesta").fadeIn(1000).html("'+data.mensaje+'...");',5000);
                //  setTimeout ("$('#aEspera').css({display:'none'})",5000);

            }


        },
        beforeSend: function(objeto) {

            $('#aEspera').css({ display: 'block' });
        },
        error: function(result) {
            $("#aRespuesta").html("");
            $("#aRespuesta").html("Error..." + result.e);
            return false;
        }
    });
}