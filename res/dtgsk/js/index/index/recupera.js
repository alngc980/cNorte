var doi;
var cod;
var valnum;
var nNotifica = 0;
var countdownTimer;
var seconds = 4000;
var Mostrar = false;
$(document).ready(function() {
    recargaCapcha();
});

function recargaCapcha() {
    grecaptcha.ready(function() {
        grecaptcha.execute('6LfYSvcUAAAAAHUTP5Bsu5W-9l_-Diufdmhx0bza', { action: 'consulta' })
            .then(function(token) {
                var recaptchaResponse = document.getElementById('recaptchaResponse');
                recaptchaResponse.value = token;

            });
    });
}


function pasoSiguiente() {
    setTimeout(
        function() {
            window.close();

        }, 3000);
}

function SalirTiempo() {

    $("#idCabTit").html("Consulta tus reprogramaciones");
    $("#idForm_cod").addClass("hide", { duration: 1500 });
    $("#idForm_ver").removeClass("hide", { duration: 1500 });
    $("#idForm").addClass("hide", { duration: 1500 });
    $("#idtabladet").addClass("hide", { duration: 1500 });
    $("#modalrevertir").modal("hide");
    limpiaSms();

}
$("#btnsalir").click(function(e) {
    $("#idtabladet").addClass("hide", { duration: 1500 });
    $("#idCabTit").html("Consulta tus reprogramaciones");
    $("#idForm").removeClass("hide", { duration: 1500 });
    $("#HIDDHCargaProceso_").html("");
    $("#formPrin").addClass("col-md-offset-2");
    $("#formPrin").addClass("col-md-4");

    Mostrar = false;
    limpiar();

});
$("#aGenCod").click(function(e) {
    $("#idForm_cod").removeClass("hide", { duration: 1500 });
    $("#idForm").addClass("hide", { duration: 1500 });
    $("#idCabTit").html("Generación de Clave");
});

$("#fnRecupera").submit(function(e) {
    $("#HIDDHCargaProceso_").html("Validando DOI...");
    e.preventDefault();
    if (window.FormData !== undefined) {
        var formData = new FormData(this);
        $.ajax({
            url: "./?r=index/recuperaClave",
            data: formData,
            type: "POST",
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {

                var myVar;
                if (data.success == true) {
                    setTimeout(($("#HIDDHCargaProceso_").html(data.message)), 5000);
                    limpiar();
                    myVar = setTimeout(pasoSiguiente(), 3500);

                } else {
                    setTimeout(($("#HIDDHCargaProceso_").html(data.message)), 5000);
                }
                recargaCapcha();

            },
            beforeSend: function(objeto) {
                $("#HIDDHCargaProceso_").html("Procesando...");

            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.status);
                console.log(thrownError);
                $("#HIDDHCargaProceso_").html(result + " ...");
                recargaCapcha();
                return false;
            }
        });


    } else {
        $("#smsProcesCodigo").html("Error en formulario");

    }


});






$("#btnTiempoNo").click(function(e) {
    finTiempo();
});
$("#btnTiempoSi").click(function(e) {
    seconds = 4000;
    secondPassed();
    $("#modalTime").modal("hide");
});

function listar(datacal) {

    var html;
    for (i = 0; i < datacal.length; i++) {
        html += '<tr>';
        html += '   <td data-head="N° Cuenta" class="td-name">';
        html += '       <a href="#dowloand">' + datacal[i].cCtacod + '</a>';
        html += '   </td>';

        html += '   <td data-head="Monto Des."  class="td-name">';
        html += '       S/ ' + datacal[i].nMontoDesem + '</small>';
        html += '       </td>';

        html += '<td data-head="Fecha Vig."   class="td-name">';
        html += '' + datacal[i].cFecgaVig + '';
        html += '</td>';
        html += '<td data-head="Acción" class="td-name ">';
        html += '           <a href=""  target="_ablank" data="' + datacal[i].cCtacod + '" class="btn btn-success btn-sm descarga">Acción</a>';
        // html += '           <a href=""  target="_ablank" data="' + datacal[i].cCtacod + '" class="btn btn-success btn-sm descarga">Ver Cronograma</a>';
        // html += '           <a href=""  target="_ablank" data="' + datacal[i].cCtacod + '" class="btn btn-danger btn-sm revertir">Quiero Revertir</a>';
        html += '</td>';
        html += '</tr> ';

    }
    Mostrar = true;
    $("#tblDetalle").html(html);
    seconds = 4000;

    secondPassed();
    $('.descarga').on('click', function(e) {
        e.preventDefault();
        descargar($(this).attr('data'));
    });
    $('.revertir').on('click', function(e) {
        e.preventDefault();
        modalrevertir($(this).attr('data'));

    });
}



$("#frmReversion").submit(function(e) {
    $(".BtngenNo").removeClass("hide");
    $("#BtngenSalir").addClass("hide");
    revertir(valnum);
    return false;
});


$(".salir").click(function(e) {
    $("#modalrevertir").modal("hide");
    limpiar();
});


function limpiar() {
    $(".limpiar").val("");

}



$('.limpiar').change(function() {
    limpiaSms();

});

function limpiaSms() {
    $("#HIDDHCargaProceso_").html("");
    $("#smsProcesCodigo").html("");

}
//número de segundos a contar
function secondPassed() {
    if (Mostrar == true) {
        var minutes = Math.round((seconds - 30) / 60); //calcula el número de minutos
        var remainingSeconds = seconds % 60; //calcula los segundos
        //si los segundos usan sólo un dígito, añadimos un cero a la izq
        if (remainingSeconds < 10) {
            remainingSeconds = "0" + remainingSeconds;
        }
        document.getElementById('countdown').innerHTML = minutes + ":" + remainingSeconds;
        if (seconds == 10) {

            $("#modalTime").modal("show");

            seconds--
        } else {
            if (seconds == 0) {
                finTiempo();
            } else {
                seconds--;
            }

        }
    }
}

function finTiempo() {
    //clearInterval(countdownTimer);
    $("#modalTime").modal("hide");
    document.getElementById('countdown').innerHTML = "0:00";
    SalirTiempo();
    Mostrar = false;
}


countdownTimer = setInterval(secondPassed, 1000);