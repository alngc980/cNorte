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
                var recaptchaResponse_cons = document.getElementById('recaptchaResponse_cons');
                var recaptchaResponse_cons_table = document.getElementById('recaptchaResponse_cons_table');
                var recaptchaResponse_ext = document.getElementById('recaptchaResponse_ext');
                recaptchaResponse.value = token;
                recaptchaResponse_cons.value = token;
                recaptchaResponse_cons_table.value = token;
                recaptchaResponse_ext.value = token;
            });
    });
}
$(".BtngenSalir").click(function(e) {
    $("#idForm_cod").addClass("hide", { duration: 1500 });
    $("#idForm_ver").addClass("hide", { duration: 1500 });
    $("#idForm_sol").addClass("hide", { duration: 1500 });

    $("#idForm").removeClass("hide", { duration: 1500 });

    $("#idCabTit").html("Consulta tus reprogramaciones");
    $(".clasInfo").removeClass("hide", { duration: 1500 });
    $("#formPrincipal").addClass("hide", { duration: 1500 });
    limpiar();
    limpiaSms();

});
$("#btnSiguiente").click(function(e) {
    debugger;
    $(".clasInfo").addClass("hide", { duration: 1500 });
    $("#formPrincipal").removeClass("hide", { duration: 1500 });
    $("#idForm_sol").addClass("hide", { duration: 1500 });
    $("#idForm_ver").removeClass("hide", { duration: 1500 });
    $("#idForm").addClass("hide", { duration: 1500 });


});
$("#btnSolicitar").click(function(e) {
    debugger;
    $(".clasInfo").addClass("hide", { duration: 1500 });
    $("#formPrincipal").removeClass("hide", { duration: 1500 });
    $("#idForm_sol").removeClass("hide", { duration: 1500 });
    $("#formsolicitud").removeClass("hide", { duration: 1500 });
    $("#idForm_ver").addClass("hide", { duration: 1500 });
    $("#idForm").addClass("hide", { duration: 1500 });
    $("#idCabTit").html("Solicitud de reversión");
    $("#HIDDHCargaProceso_sol").html("");

});

function pasoSiguiente() {
    setTimeout(
        function() {
            $("#idForm_cod").addClass("hide", { duration: 1500 });
            $("#idForm_ver").addClass("hide", { duration: 1500 });
            $("#idForm_sol").addClass("hide", { duration: 1500 });
            $("#idForm").removeClass("hide", { duration: 1500 });
            $("#idCabTit").html("Consulta tus reprogramaciones");
            $(".clasInfo").removeClass("hide", { duration: 1500 });
            $("#formPrincipal").addClass("hide", { duration: 1500 });

            $("#idMotivo").val("");

            limpiar();
            limpiaSms();

        }, 8000);
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
    $("#formPrincipal").addClass("hide", { duration: 1500 });
    $("#idtabladet").addClass("hide", { duration: 1500 });
    $("#idCabTit").html("Consulta tus reprogramaciones");
    $(".clasInfo").removeClass("hide", { duration: 1500 });
    $("#HIDDHCargaProceso_").html("");

    Mostrar = false;
    limpiar();

});
$("#aGenCod").click(function(e) {
    $("#idForm_cod").removeClass("hide", { duration: 1500 });
    $("#idForm").addClass("hide", { duration: 1500 });
    $(".clasInfo").addClass("hide", { duration: 1500 });
    $("#formPrincipal").removeClass("hide", { duration: 1500 });
    $("#idCabTit").html("Generación de Clave");
});

$("#fnSolrev").submit(function(e) {

    debugger;
    var condiciones = $("#iAceptaSol").is(":checked");
    if (!condiciones) {
        $("#HIDDHCargaProceso_sol").html("Debe aceptar la autorización");
        e.preventDefault();
    } else {
        $("#HIDDHCargaProceso_sol").html("Validando Datos...");
        e.preventDefault();
        if (window.FormData !== undefined) {
            var formData = new FormData(this);
            $.ajax({
                url: "./?r=index/generaSol",
                data: formData,
                type: "POST",
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {
                    var myVar;
                    if (data.success == true) {
                        $("#formsolicitud").addClass("hide");
                        setTimeout(($("#HIDDHCargaProceso_sol").html(data.message)), 5000);
                        pasoSiguiente();
                        document.getElementById("fnSolrev").reset();


                    } else {
                        setTimeout(($("#HIDDHCargaProceso_sol").html(data.message)), 5000);
                    }
                    recargaCapcha();

                },
                beforeSend: function(objeto) {
                    $("#HIDDHCargaProceso_sol").html("Procesando...");

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                    $("#HIDDHCargaProceso_sol").html(result + " ...");
                    recargaCapcha();
                    return false;
                }
            });


        } else {
            $("#HIDDHCargaProceso_sol").html("Error en formulario");

        }

    }
});

$("#frmGenerarCod").submit(function(e) {


    var condiciones = $("#iAcepta").is(":checked");
    if (!condiciones) {
        $("#smsProcesCodigo").html("Debe aceptar la autorización");
        e.preventDefault();
    } else {
        $("#smsProcesCodigo").html("Validando DOI...");
        e.preventDefault();
        if (window.FormData !== undefined) {
            var formData = new FormData(this);
            $.ajax({
                url: "./?r=index/generaCod",
                data: formData,
                type: "POST",
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {

                    var myVar;
                    if (data.success == true) {

                        setTimeout(($("#smsProcesCodigo").html(data.message)), 5000);
                        limpiar();
                        myVar = setTimeout(pasoSiguiente(), 3500);

                    } else {
                        setTimeout(($("#smsProcesCodigo").html(data.message)), 5000);
                    }
                    recargaCapcha();

                },
                beforeSend: function(objeto) {
                    $("#smsProcesCodigo").html("Procesando...");

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                    $("#smsProcesCodigo").html(result + " ...");
                    recargaCapcha();
                    return false;
                }
            });


        } else {
            $("#smsProcesCodigo").html("Error en formulario");

        }

    }
});



function revertir(cred) {
    //$("#modalsmsProcesCodigo").html("Validando DOI...");
    $.ajax({
        url: "./?r=index/generaSolExtorno",
        data: { "cred": cred, "cod": cod, "doi": doi, "recaptcha_response": recaptchaResponse_ext.value },
        type: "POST",
        success: function(data) {

            $("#modalsmsProcesCodigo").html("");
            $(".BtngenNo").addClass("hide");
            $("#BtngenSi").addClass("hide");
            $("#BtngenSalir").removeClass("hide");


            if (data.success == true) {
                setTimeout(($("#modalsmsProcesCodigo").html(data.message)), 5000);

                limpiar();

            } else {
                setTimeout(($("#modalsmsProcesCodigo").html(data.message)), 5000);

            }
            setTimeout(($(".corremodal").addClass("hide")), 5000);


            return false;
        },
        beforeSend: function(objeto) {
            $("#modalsmsProcesCodigo").html("Procesando...");

        },
        error: function(xhr, ajaxOptions, thrownError) {

            $("#modalsmsProcesCodigo").html("error S001" + " ...");
            return false;
        }
    });

    return false;

}

$("#fnConsulta").submit(function(e) {
    doi = $("#idDOI").val();
    cod = $("#idCodigo").val();
    exito = true;
    $("#tableCred").addClass("hide");
    e.preventDefault();

    if (window.FormData !== undefined) {
        var formData = new FormData(this);
        $.ajax({
            url: "./?r=index/generaConsulta",
            data: formData,
            type: "POST",
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                debugger;
                if (data.success == true) {

                    $("#idForm_ver").addClass("hide");
                    setTimeout(($("#HIDDHCargaProceso").html(data.message)), 5000);
                    $("#idtabladet").removeClass("hide", { duration: 1500 });
                    $("#idCabTit").html("Créditos Reprogramados");
                    $("#idForm").addClass("hide", { duration: 1500 });
                    $("#tableCred").removeClass("hide", { duration: 1500 });
                    listar(data.datacab);
                    limpiar();

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
                recargaCapcha();
                $("#HIDDHCargaProceso_").html("Error comuniquese con Call Center...");
            }
        });


    } else {
        recargaCapcha();
        $("#HIDDHCargaProceso_").html("Error en formulario");

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
        html += '       <strong>' + datacal[i].cCtacod + '</strong>';
        html += '   </td>';

        html += '   <td data-head="Monto Desemb."  class="td-name text-rigth">';
        html += '      <center> S/ ' + datacal[i].nMontoDesem + '</center>';
        html += '       </td>';

        html += '<td data-head="Fecha Desemb."   class="td-name" >';
        html += '<center>' + datacal[i].cFecgaVig + '</center>';
        html += '</td>';
        html += '<td data-head="Quiero" class="td-name" style="background-color:white; border: 1px solid rgba(0, 0, 0, 0);">';

        html += '<li><a href=""  target="_ablank" data="' + datacal[i].cCtacod + '" class="btn btn-round btn-default btn-xs descarga" style="max-width:200px">Descargar <br>Cronograma</a></li>';
        // html += '<li><a href=""  target="_ablank" data="' + datacal[i].cCtacod + '" class="btn btn-round btn-info btn-xs revertir">Solicitar</a></li>';

        html += '           ';
        html += '           ';
        html += '</td>';
        html += '</tr> ';

    }
    Mostrar = true;
    $("#nombreCliente").html(datacal[0].titular);
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

function modalrevertir(data) {

    valnum = data;
    $("#modalSms").html("Al revertir su crédito, se regresará al cronograma antes de la reprogramación. En tal sentido, le recomendamos realizar el pago según las condiciones pactadas al desembolso. <br>¿Está seguro de realizar la solicitud reversión?");
    $("#BtngenSi").removeClass("hide");
    $(".BtngenNo").removeClass("hide");
    $("#BtngenSalir").addClass("hide");
    $("#modalrevertir").modal("show");
    $(".corremodal").removeClass("hide");
    $("#modalsmsProcesCodigo").html("");
    recargaCapcha();

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

function descargar(cred) {

    $.ajax({
        url: "./?r=index/descargar",
        data: { "cred": cred, "cod": cod, "doi": doi, "recaptcha_response": recaptchaResponse_cons_table.value },
        type: "POST",
        success: function(data) {
            if (data.success == true) {
                setTimeout(($("#HIDDHCargaProceso").html(data.message)), 5000);
                generarCalendario(data.datacab, data.datadet, doi);
                limpiar();

            } else {
                setTimeout(($("#HIDDHCargaProceso").html(data.message)), 5000);
            }
            recargaCapcha();
        },
        beforeSend: function(objeto) {
            $("#HIDDHCargaProceso").html("Descargando...");

        },
        error: function(xhr, ajaxOptions, thrownError) {
            console.log(xhr.status);
            console.log(thrownError);
            $("#HIDDHCargaProceso").html("Error comuniquese con Call Center...");
            recargaCapcha();
        }
    });
}

function limpiar() {
    $(".limpiar").val("");

}


function generarCalendario(cabezera, detalle, xdoi) {

    var dataJSON = JSON.stringify(cabezera);
    var dataJSON_det = JSON.stringify(detalle);

    // create the form
    var form = document.createElement('form');
    form.setAttribute('method', 'post');
    form.setAttribute('action', './?r=index/PDF');

    // create hidden input containing JSON and add to form
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "idCabezera");
    hiddenField.setAttribute("value", dataJSON);

    var hiddenField_det = document.createElement("input");
    hiddenField_det.setAttribute("type", "hidden");
    hiddenField_det.setAttribute("name", 'idDetalle');
    hiddenField_det.setAttribute("value", dataJSON_det);

    var hiddenField_doi = document.createElement("input");
    hiddenField_doi.setAttribute("type", "hidden");
    hiddenField_doi.setAttribute("name", 'idDOI');
    hiddenField_doi.setAttribute("value", xdoi);


    form.appendChild(hiddenField);
    form.appendChild(hiddenField_det);
    form.appendChild(hiddenField_doi);

    // add form to body and submit
    document.body.appendChild(form);
    form.submit();
    setTimeout(($("#HIDDHCargaProceso").html("Calendario generado con éxito, su contraseña es su DNI / Ruc")), 5000);
    recargaCapcha();

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
        // document.getElementById('countdown').innerHTML = minutes + ":" + remainingSeconds;
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
    // document.getElementById('countdown').innerHTML = "0:00";
    SalirTiempo();
    Mostrar = false;
}


countdownTimer = setInterval(secondPassed, 1000);