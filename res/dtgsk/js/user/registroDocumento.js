var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';
var smsvalida;
var dataProgramas;
var nProgramaSelec;
$(document).ready(function () {
    //obtenerProgamas();
    //$("#idEmpresa").change();
    CargarDataInformeActualizacion(gInforme);
});

// function obtenerProgamas() {
//     $.ajax({
//         url: "./?r=user/obtenerProgamas",
//         contentType: false,
//         cache: false,
//         processData: false,
//         success: function (data) {
//             obj = new Array();
//             obj = JSON.parse(data);
//             dataProgramas = obj;
//             var html_aux = "<option value=" + 0 + " disabled selected>Selecciones Programa</option>";
//             for (i = 0; i < obj.length; i++) {
//                 html_aux += "<option value=" + obj[i].nId + ">" + obj[i].cNombre + "</option>";
//             }
//             $("#idInputPrograma").html(html_aux);


//         }

//     })
// }

$('#idInputPrograma').change(function () {
    nProgramaSelec = $("#idInputPrograma").val();
    $.ajax({
        url: "./?r=user/obtenerProgamasId",
        type: "POST",
        data: { programa: nProgramaSelec },
        success: function (data) {
            datos = JSON.parse(data);
            $("#idInputCodigo").val(datos.cCodigoN);
            $("#idInputVersion").val(datos.cVersionN);
        }
    });
});
$("#idTarea").change(function (e) {
    var idtarea= $("#idTarea").val(); 
    if(idtarea ==3){
        $("#lblTareaActividad").html("Tema");
        $("#idActividad ").prop("placeholder","Ingrese el tema...");
        $("#gArea").css("display","none");
        $("#gSupervision").css("display","none");
        $("#gActa").css("display","none");
        $('#idArea').removeAttr("required");
        $('#idActa').removeAttr("required");
        
        
    }else{
        $("#lblTareaActividad").html("Actividad");
        $("#idActividad ").prop("placeholder","Ingrese la Actividad...");
        $("#gArea").css("display","");
        $("#gSupervision").css("display","");
        $("#gActa").css("display","");
        $('#idArea').prop("required", true);
        $('#idActa').prop("required", true);
    }
});

$("#fnRegisterDocumentoCab").submit(function (e) {
    e.preventDefault();
  
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        //  var formData = new FormData(this, "#fnProccessloginPro");
        var formElement = document.getElementById("fnRegisterDocumentoCab");
        var formData = new FormData(formElement);
        
        if(formData.get("KEYPROCESACAB") == 2 || formData.get("KEYPROCESACAB") == 3){
            formData.append("tipo", $("#idTipo").val());
            formData.append("programa", $("#idInputPrograma").val());
            formData.append("codigo", $("#idInputCodigo").val());
            formData.append("tarea", $("#idTarea").val());
            formData.append("empresa", $("#idEmpresa").val());
            formData.append("uunn", $("#iduunn").val());
            formData.append("actividad", $("#idActividad").val());
            formData.append("obra", $("#idObra").val());            
            formData.append("lugar", $("#idLugar").val());      
            formData.append("area", $("#idArea").val());      
            formData.append("responsable", $("#idInputResponsable").val());      
            formData.append("cargo", $("#idCargo").val());      
            formData.append("fecha", $("#idFecha").val());      
            formData.append("supervision", $("#idSupervision").val());  
            formData.append("acta", $("#idActa").val());  
            formData.append("sasd", $("#idSasd").val());  
        }
        $.ajax({
            url: "?r=user/registroDocumento",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                debugger;
                if (data.success == true) {

                    bootbox.alert({
                        message: data.message,
                        size: 'small',
                        callback: function () {
                            var url = data.ruta;
                            redirectPost(url, { datakey: data.datakey, dataInicia: data.dataInicia, dataTotal: data.dataTotal });
                        }
                    });

                    // $("#btnlogin_icono").removeClass("icon-danger");
                    // $("#btnlogin_icono").addClass("icon-success");
                    // $("#smslog").html(htmlprocesando + data.message);
                    //document.getElementById('fnRegisterDocumentoCab').reset();
                    //getCodigo();

                    // var url = data.ruta;

                    // redirectPost(url, { datakey: data.datakey, dataInicia: data.dataInicia, dataTotal: data.dataTotal });
                    return true;

                } else {

                    bootbox.alert({
                        message: data.message,
                        size: 'small'
                    });

                    // $("#btnlogin_icono").removeClass("icon-success");
                    // $("#btnlogin_icono").addClass("icon-warning");
                    // $("#smslog").addClass("text-warning");
                    // $("#smslog").fadeIn(1000).html("");
                    // $("#smslog").html(data.message + "...");
                }

            },
            beforeSend: function (objeto) {
                $("#btnlogin_icono").addClass("icon-success");
                $("#smslog").addClass("text-success");
                $("#smslog").fadeIn(1000).html(htmlprocesando + 'Procesando ...');

            },
            error: function (result) {

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

function redirectPost(url, data) {
    debugger;
    var form = document.createElement('form');
    document.body.appendChild(form);
    form.method = 'post';
    form.action = url;
    for (var name in data) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = name;
        input.value = data[name];
        form.appendChild(input);
    }
    form.submit();
}


//Added by TORE
$('.btn-add-empresa').click(function () {
    $("#modalAddEmpresa").modal("show");
});

$('.btn-add-un').click(function () {
    $("#modalAddUUNN").modal("show");
});

$('.btn-add-responsable').click(function () {
    $("#modalAddResponsable").modal("show");
});

$('.btn-add-cargo').click(function () {
    $("#modalAddCargo").modal("show");
});

$('.btn-add-tipo-super').click(function () {
    $("#modalAddTipoSupervision").modal("show");
});

/*Registro de la empresa*/
$("#frmAddEmpresa").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form)
        $.ajax({
            url: "?r=empresa/AddEmpresa",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#smslogM").addClass("text-success");
                    $("#smslogM").fadeIn(1000).html("");
                    $("#smslogM").html(data.message);
                    form.reset();
                    $.ajax({
                        url: "./?r=empresa/obtenerOtrasEmpresas",
                        type: "POST",
                        success: function (data) {
                            datos = JSON.parse(data);
                            $("#idEmpresa").empty();
                            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                            for (i = 0; i < datos.length; i++) {
                                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].cNombre + "</option>";
                            }
                            $("#idEmpresa").html(html_aux);
                        }
                    });
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
        return false;
    }

    return false;
});

/*Registro de la UUNN*/
$("#frmAddUUNN").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form)
        $.ajax({
            url: "?r=uunn/AddUUNN",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#smslogMUNN").addClass("text-success");
                    $("#smslogMUNN").fadeIn(1000).html("");
                    $("#smslogMUNN").html(data.message);
                    //location.reload();
                    form.reset();
                    $.ajax({
                        url: "./?r=uunn/obtenerUUNN",
                        type: "POST",
                        success: function (data) {
                            datos = JSON.parse(data);
                            $("#iduunn").empty();
                            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                            for (i = 0; i < datos.length; i++) {
                                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].cNombre + "</option>";
                            }
                            $("#iduunn").html(html_aux);
                        }
                    });
                } else {
                    $("#smslogMUNN").addClass("text-warning");
                    $("#smslogMUNN").fadeIn(1000).html("");
                    $("#smslogMUNN").html(data.message + "...");
                }

            },
            beforeSend: function (objeto) {
                $("#smslogMUNN").addClass("text-success");
                $("#smslogMUNN").fadeIn(1000).html(htmlprocesando + 'Procesando ...');

            },
            error: function (result) {
                $("#smslogMUNN").fadeIn(1000).html("");
                $("#smslogMUNN").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        return false;
    }

    return false;
});


/*Registro de la Responsable*/
$("#frmResponsable").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form);
        debugger;
        $.ajax({
            url: "?r=trabajadores/AddNewResponsable",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#smsMResponsable").addClass("text-success");
                    $("#smsMResponsable").fadeIn(1000).html("");
                    $("#smsMResponsable").html(data.message);
                    form.reset();
                    var $idEmpresa = $("#idEmpresa").val();
                    $.ajax({
                        url: "./?r=trabajadores/getResponsables",
                        type: "POST",
                        data: { idEmpresa: $idEmpresa },
                        success: function (data) {
                            datos = JSON.parse(data);
                            $("#idInputResponsable").empty();
                            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                            for (i = 0; i < datos.length; i++) {
                                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].cNombres + " " + datos[i].cApellidos + "</option>";
                            }
                            $("#idInputResponsable").html(html_aux);
                        }
                    });
                } else {
                    $("#smsMResponsable").addClass("text-warning");
                    $("#smsMResponsable").fadeIn(1000).html("");
                    $("#smsMResponsable").html(data.message + "...");
                }

            },
            beforeSend: function (objeto) {
                $("#smsMResponsable").addClass("text-success");
                $("#smsMResponsable").fadeIn(1000).html(htmlprocesando + 'Procesando ...');

            },
            error: function (result) {
                $("#smsMResponsable").fadeIn(1000).html("");
                $("#smsMResponsable").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        return false;
    }

    return false;
});

/*Registro de la Supervision*/
$("#frmAddSupervision").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form)
        //var formData = form.serialize();
        $.ajax({
            url: "?r=supervision/AddSupervision",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#smsMSupervidor").addClass("text-success");
                    $("#smsMSupervidor").fadeIn(1000).html("");
                    $("#smsMSupervidor").html(data.message);
                    form.reset();
                    $.ajax({
                        url: "./?r=supervision/obtenerTipoSupervision",
                        type: "POST",
                        success: function (data) {
                            datos = JSON.parse(data);
                            $("#idSupervision").empty();
                            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                            for (i = 0; i < datos.length; i++) {
                                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].cNombre + "</option>";
                            }
                            $("#idSupervision").html(html_aux);
                        }
                    });
                    //return true;
                    //location.reload();
                } else {
                    $("#smsMSupervidor").addClass("text-warning");
                    $("#smsMSupervidor").fadeIn(1000).html("");
                    $("#smsMSupervidor").html(data.message + "...");
                }

            },
            beforeSend: function (objeto) {
                $("#smsMSupervidor").addClass("text-success");
                $("#smsMSupervidor").fadeIn(1000).html(htmlprocesando + 'Procesando ...');

            },
            error: function (result) {
                $("#smsMSupervidor").fadeIn(1000).html("");
                $("#smsMSupervidor").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        return false;
    }

    return false;
});

/*Registro de un nuevo cargo de la empresa*/
$("#frmAddEmpresaCargo").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form)
        $.ajax({
            url: "?r=cargos/registroCargo",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#smsMCargo").addClass("text-success");
                    $("#smsMCargo").fadeIn(1000).html("");
                    $("#smsMCargo").html(data.message);
                    form.reset();
                    var $idEmpresa = $("#idEmpresa").val();
                    $.ajax({
                        url: "./?r=cargos/obtenerCargosEmpresaId",
                        type: "POST",
                        data: { idEmpresa: $idEmpresa },
                        success: function (data) {
                            datos = JSON.parse(data);
                            $("#idCargo").empty();
                            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                            for (i = 0; i < datos.length; i++) {
                                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].cCargo + "</option>";
                            }
                            $("#idCargo").html(html_aux);
                        }
                    });
                    //return true;
                    //location.reload();
                } else {
                    $("#smsMCargo").addClass("text-warning");
                    $("#smsMCargo").fadeIn(1000).html("");
                    $("#smsMCargo").html(data.message + "...");
                }

            },
            beforeSend: function (objeto) {
                $("#smsMCargo").addClass("text-success");
                $("#smsMCargo").fadeIn(1000).html(htmlprocesando + 'Procesando ...');

            },
            error: function (result) {
                $("#smsMCargo").fadeIn(1000).html("");
                $("#smsMCargo").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        return false;
    }

    return false;
});

$("#idEmpresa").change(function () {
    var selEmpresa = document.getElementById("idEmpresa");
    var selEmpresaText = selEmpresa.options[selEmpresa.selectedIndex].text;

    /*Cargar a los responsables por Empresa*/
    $.ajax({
        url: "./?r=trabajadores/getResponsables",
        data: { idEmpresa: selEmpresa.value },
        type: "POST",
        success: function (data) {
            datos = JSON.parse(data);
            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
            for (i = 0; i < datos.length; i++) {
                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].cNombres + " " + datos[i].cApellidos + "</option>";
            }
            $("#idInputResponsable").html(html_aux);
        }
    });

    $.ajax({
        url: "./?r=cargos/obtenerCargosEmpresaId",
        data: { idEmpresa: selEmpresa.value },
        type: "POST",
        success: function (data) {
            datos = JSON.parse(data);
            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
            for (i = 0; i < datos.length; i++) {
                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].cCargo + "</option>";
            }
            $("#idCargo").html(html_aux);
        }
    });

    $("#idEmpresaCargo, #idEmpresaResponsable").val(selEmpresa.value);
    $("#alert-cargo, #alert-responsable").html(selEmpresaText);
});

function CargarDataInformeActualizacion(data) {
    if (data != null) {
        $("select[name='tipo']").val(data.nIdTipoDocumento).attr("disabled", true);
        $("select[name='tarea']").val(data.nIdTarea).attr("disabled", true);
        $("select[name='empresa']").val(data.nIdEmpresa).attr("disabled", true);
        $("select[name='uunn']").val(data.nIdUUNN).attr("disabled", true);
        $("textarea[name='actividad']").val(data.cActividad);
        $("textarea[name='obra']").val(data.cObra);
        $("input[name='lugar']").val(data.cLugar);
        $("input[name='area']").val(data.cArea);
        $("select[name='supervision']").val(data.nIdSupervision);
        document.getElementById('idFecha').value = data.cFecha.substring(0, 10);
        document.getElementById("idActa").value = data.nActa;
        $("input[name='sasd']").val(data.cESAS);

        $("#idEmpresa").change();
        setTimeout(function () {
            $("select[name='responsable']").val(data.nIdResponsable);
            $("select[name='cargo']").val(data.nIdCargo);
            $("select[name=programa]").val(data.nIdPrograma).change().attr("disabled", true);
        
        }, 180);
    }else{
        $("#idEmpresa").change();
        $("select[name='tipo']").attr("disabled", false);
        $("select[name='tarea']").attr("disabled", false);
        $("select[name='empresa']").attr("disabled", false);
        $("select[name='uunn']").attr("disabled", false);
        $("select[name=programa]").attr("disabled", false);
    }
}


