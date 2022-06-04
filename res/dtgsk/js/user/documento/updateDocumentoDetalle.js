var htmlprocesando = '<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />';
var nSeccion = 0;

var key = 0;

var globaly;
var globalcump;
$('.clsCumDet').click(function (event) {

    key = $("#idKeyDoc").val();
    empresa = $("#idKeyEmpresa").val();
    $(".groupImcumplimiento").attr("style", "display:none");
    var cumplimiento = this.getAttribute("data");
    globalcump = cumplimiento;
    $("#cumplimiento").val(cumplimiento);

    nSeccion = 1;
    obtenerDatosDetalle(key, cumplimiento, empresa);
    cargarImagenes(key, cumplimiento);
    document.getElementById("divAdjun1").setAttribute("style", "");

});

$('.clsCumDet2').click(function (event) {
//debugger;
    key = $("#idKeyDoc").val();
    empresa = $("#idKeyEmpresa").val();

    var cumplimiento = this.getAttribute("data");
    $("#cumplimiento_aux").val(cumplimiento);
      globalcump = cumplimiento;
    nSeccion = 2;
    if (cumplimiento == 7 || cumplimiento == 8 || cumplimiento == 9 || cumplimiento == 18 || cumplimiento == 19 ){
        $(".groupImcumplimiento").attr("style", "display:none");
        document.getElementById("divAdjun2_aux").setAttribute("style", "");
        cargarImagenes_aux(key, cumplimiento);
    }
    
    if (idArea ==3){
        document.getElementById("divAdjun2_aux").setAttribute("style", "");
        cargarImagenes_aux(key, cumplimiento);
    }
    obtenerDatosDetalle(key, cumplimiento, empresa);

});

$('.clsCumDet3').click(function (event) {
    key = $("#idKeyDoc").val();
    empresa = $("#idKeyEmpresa").val();

    var cumplimiento = this.getAttribute("data");
    nSeccion = 3;

    obtenerDatosDetalle(key, cumplimiento, empresa);

});

function cargarImagenes(parKey, parCumplimiento) {
    $.ajax({

        type: 'POST',
        url: '?r=user/cargarArchivoSeg',
        data: {
            "informe": parKey,
            "cumplimiento": parCumplimiento
        },

        beforeSend: function () {
            $('#uploadStatus').html('<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />');
        },
        error: function (ex) {
            $('#uploadStatus').html('<span style="color:#EA4335;">Error al cargar imagenes.<span>');

        },
        success: function (data) {
            debugger;
            var ht = "";
            $('#uploadStatus').html('');
            $("#imgAdj").html(ht);

            if (data.success) {

                ht = "";
                armaImagen(data.data, parKey);




            } else {

                $("#imgAdj").append("<span style='color:#EA4335;'>Error al cargar las imágenes. Vuelve a intentarlo.<span>");

            }

        }

    });
}
function cargarImagenes_aux(parKey, parCumplimiento) {
    $.ajax({

        type: 'POST',
        url: '?r=user/cargarArchivoSeg',
        data: {
            "informe": parKey,
            "cumplimiento": parCumplimiento
        },

        beforeSend: function () {
            $('#uploadStatus_aux').html('<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />');
        },
        error: function (ex) {
            $('#uploadStatus_aux').html('<span style="color:#EA4335;">Error al cargar imagenes.<span>');

        },
        success: function (data) {
            debugger;
            var ht = "";
            $('#uploadStatus_aux').html('');
            $("#imgAdj_aux").html(ht);

            if (data.success) {

                ht = "";
                armaImagen_aux(data.data, parKey);




            } else {

                $("#imgAdj_aux").append("<span style='color:#EA4335;'>Error al cargar las imágenes. Vuelve a intentarlo.<span>");

            }

        }

    });
}

function obtenerDatosDetalle(x, y, z = "") {

    $('#idDetalles').css('display', 'block');
    globaly = y;

    if (nSeccion == 1 || (y >= 7 && y <= 9) || (y >= 18 && y <= 19)) {

        $.ajax({

            url: "?r=user/obtieneDetalleCumplimineto",

            type: "POST",

            data: {

                keyModalidad: 1,

                keyInforme: x,

                keyCumplimiento: y

            },

            success: function (data) {

                debugger;

                var aux = ". Para agregar un nuevo registro has click ";

                aux += '<button class="btn btn-icon  btn-sm btn-primary btnAddCumpliento" type="button" > ';
                aux += '<span class="btn-inner--icon"><i class="ni ni-active-40"></i></span>';
                aux += '<span class="btn-inner--text">Aquí</span>';
                aux += '</button>';
                if (data.success == true) {
                    var htmlCabTbl = ""
                    htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> Tipo </th>';
                    htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Detalle </th>';
                    htmlCabTbl += '<th scope = "col"> </th>';
                    if ((y >= 7 && y <= 9) || (y >= 18 && y <= 19)) {
                        $("#idSmsPres2").html(data.message + aux);
                        $("#tblCabCumpliento2").html(htmlCabTbl);
                    } else {
                        $("#idSmsPres").html(data.message + aux);
                        $("#tblCabCumpliento").html(htmlCabTbl);
                    }
                    if (data.data.length > 0) {
                        armaDetalle(data.data);
                    } else {
                        if ((y >= 7 && y <= 9) || (y >= 18 && y <= 19)) {
                            $("#idSmsPres2").html("no se encontratos datos" + aux);
                        } else {
                            $("#idSmsPres").html("no se encontratos datos" + aux);
                        }
                    }
                } else {
                    if ((y >= 7 && y <= 9) || (y >= 18 && y <= 19)) {
                        $("#idSmsPres2").addClass("text-warning");
                        $("#idSmsPres2").fadeIn(1000).html("");
                        $("#idSmsPres2").html(data.message + aux);

                        var htmlCabTbl = ""
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> Tipo </th>';
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Detalle </th>';
                        htmlCabTbl += '<th scope = "col"> </th>';

                        $("#tblCabCumpliento2").html(htmlCabTbl);
                        $("#tbldetCumpliento2").empty();
                    } else {
                        $("#idSmsPres").addClass("text-warning");
                        $("#idSmsPres").fadeIn(1000).html("");
                        $("#idSmsPres").html(data.message + aux);
                        $("#tblCabCumpliento3").html();
                    }
                }

                $(".btnAddCumpliento").click(function (event) {
                    var keyM = x;
                    var cumplimientoM = y;
                    if(globaly == 7 || globaly == 8 || globaly == 9){
                        $(".groupImcumplimiento").attr("style", "display:none");
                    }
                    modalEdicion(keyM, cumplimientoM);
                });
            },
            beforeSend: function (objeto) {
                if ((y >= 7 && y <= 9) || (y >= 18 && y <= 19)) {
                    $("#idSmsPres2").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
                } else {
                    $("#tbldetCumpliento").html("");
                    $("#tblCabCumpliento").html("");
                    $("#idSmsPres").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
                }
            },
            error: function (result) {
                if ((y >= 7 && y <= 9) || (y >= 18 && y <= 19)) {
                    $("#idSmsPres2").fadeIn(1000).html(result + 'Procesando ...');
                } else {
                    $("#tblCabCumpliento").html("");
                    $("#idSmsPres").fadeIn(1000).html(result + "...");
                }
                return false;
            }
        });
    } else {
        $.ajax({
            url: "?r=user/obtieneDetalleCumplimineto",
            type: "POST",
            data: {
                keyModalidad: 2,
                keyInforme: x,
                keyCumplimiento: y
            },
            success: function (data) {
                debugger;
                var aux = ". Para agregar un nuevo registro has click ";
                aux += '<button class="btn btn-icon  btn-sm btn-primary btnAddCumplientoOtro" type="button" > ';
                aux += '<span class="btn-inner--icon"><i class="ni ni-active-40"></i></span>';
                aux += '<span class="btn-inner--text">Aquí­</span>';
                aux += '</button>';
                if (y == 10) {
                    $.ajax({
                        url: "./?r=trabajadores/getEmpleadosCargoEmpresa",
                        type: "POST",
                        data: { idEmpresa: z },
                        success: function (data) {
                            datos = JSON.parse(data);
                            //$("#selTrabajadores").empty();
                            $("select[name=tipo]").empty();
                            $("#idTipo").empty();
                            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                            for (i = 0; i < datos.length; i++) {
                                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].Descripcion + "(" + datos[i].cCargo + ")" + "</option>";
                            }
                            //$("#selTrabajadores").html(html_aux);
                            $("select[name=tipo]").html(html_aux);
                        }
                    });

                    aux += '<button class="btn btn-icon  btn-sm btn-primary btnAddPersonaCargoEmpresa" type="button" > ';
                    aux += '<span class="btn-inner--icon"><i class="ni ni-badge"></i></span>';
                    aux += '<span class="btn-inner--text">Persona</span>';
                    aux += '</button>';
                } else if (y == 11) {

                    $.ajax({
                        url: "./?r=vehiculo/getVehiculosEmpresaId",
                        type: "POST",
                        data: { idEmpresa: z },
                        success: function (data) {
                            datos = JSON.parse(data);
                            $("select[name=tipo]").empty();
                            $("#idTipo").empty();
                            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                            for (i = 0; i < datos.length; i++) {
                                html_aux += "<option value=" + datos[i].nIdVehiculo + ">" + datos[i].cNombre + "(" + datos[i].cPlaca + ")" + "</option>";
                            }
                            $("select[name=tipo]").html(html_aux);
                        }
                    });

                    aux += '<button class="btn btn-icon btn-sm btn-primary btnAddVehiculosEmpresa" type="button" > ';
                    aux += '<span class="btn-inner--icon"><i class="ni ni-bus-front-12"></i></span>';
                    aux += '<span class="btn-inner--text">Vehiculos</span>';
                    aux += '</button>';
                } else {
                    $(".btnAddPersonaCargoEmpresa").remove();
                    $(".btnAddVehiculosEmpresa").remove();
                }

                if (data.success == true) {
                    var htmlCabTbl = "";
                    if ((y == 10)) {
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> Nombre del Trabajador </th>';
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Cargo </th>';
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Normas Incumplidas </th>';
                        htmlCabTbl += '<th scope = "col"> </th>';
                        $("#idSmsPres3").html(data.message + aux);
                        $("#tblCabCumpliento3").html(htmlCabTbl);

                    } else if(y== 11) {
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> N° de Placa </th>';
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Tipo de Vehiculo </th>';
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Normas Incumplidas </th>';
                        htmlCabTbl += '<th scope = "col"> </th>';

                        $("#idSmsPres3").html(data.message + aux);
                        $("#tblCabCumpliento3").html(htmlCabTbl);
                    }

                    var dataaux = data.detalle;

                    var htmlTblCumplimiento = "";
                    if (dataaux.length > 0) {

                        if (y == 10) {

                            for (i = 0; i < dataaux.length; i++) {
                                htmlTblCumplimiento += '<tr>';
                                htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cNombres + ' ' + dataaux[i].cApellidos + '</td>';
                                htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cCargo + '</td>';
                                htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cCodigo + '</td>';
                                htmlTblCumplimiento += ' <td>';
                                htmlTblCumplimiento += '     <div class="dropdown">';
                                htmlTblCumplimiento += '         <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
                                htmlTblCumplimiento += '             <i class="fas fa-ellipsis-v"> </i></a>';
                                htmlTblCumplimiento += '             <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';
                                //htmlTblCumplimiento += '                 <a class="dropdown-item" href="javascript:GestionCumplimiento10(' + dataaux[i].nId + ',' + 1 + ',' + x + ',' + y + ')"> Modificar </a>';
                                htmlTblCumplimiento += '                 <a class="dropdown-item" href="javascript:GestionCumplimiento10(' + dataaux[i].nId + ',' + 2 + ',' + x + ',' + y + ')"> Eliminar </a>';
                                htmlTblCumplimiento += '             </div>';
                                htmlTblCumplimiento += '      </div>';
                                htmlTblCumplimiento += '  </td>';
                                htmlTblCumplimiento += ' </tr>';
                            }
                        } else {
                            for (i = 0; i < dataaux.length; i++) {
                                htmlTblCumplimiento += '<tr>';
                                htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cPlaca + '</td>';
                                htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cNombre + '</td>';
                                htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cValor + '</td>';
                                htmlTblCumplimiento += ' <td>';
                                htmlTblCumplimiento += '     <div class="dropdown">';
                                htmlTblCumplimiento += '         <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
                                htmlTblCumplimiento += '             <i class="fas fa-ellipsis-v"> </i></a>';
                                htmlTblCumplimiento += '             <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';
                                //htmlTblCumplimiento += '                 <a class="dropdown-item btnPass" href="javascript:GestionCumplimiento11(' + dataaux[i].nId + ',' + 1 + ',' + x + ',' + y + ')"> Modificar </a>';
                                htmlTblCumplimiento += '                 <a class="dropdown-item btnDelete" href="javascript:GestionCumplimiento11(' + dataaux[i].nId + ',' + 2 + ',' + x + ',' + y + ')"> Eliminar </a>';
                                htmlTblCumplimiento += '             </div>';
                                htmlTblCumplimiento += '      </div>';
                                htmlTblCumplimiento += '  </td>';
                                htmlTblCumplimiento += ' </tr>';
                            }
                        }
                        $("#tbldetCumpliento3").html(htmlTblCumplimiento);

                    } else {
                        $("#idSmsPres3").html("no se encontratos datos" + aux);
                    }
                } else {

                    $("#idSmsPres3").addClass("text-warning");
                    $("#idSmsPres3").fadeIn(1000).html("");
                    $("#idSmsPres3").html(data.message + aux);

                    $("#tblCabCumpliento3").html("");
                    if ((y == 10)) {
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> Nombre del Trabajador </th>';
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Cargo </th>';
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Normas Incumplidas </th>';
                        htmlCabTbl += '<th scope = "col"> </th>';
                        $("#tblCabCumpliento3").html(htmlCabTbl);
                        $("#tbldetCumpliento3").html("");
                    } else {
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> NÂ° de Placa </th>';
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Tipo de Vehiculo </th>';
                        htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Normas Incumplidas </th>';
                        htmlCabTbl += '<th scope = "col"> </th>';
                        $("#tblCabCumpliento3").html(htmlCabTbl);
                        $("#tbldetCumpliento3").html("");
                    }
                }
                $(".btnAddCumplientoOtro").click(function (event) {
                    var keyM = x;
                    var cumplimientoM = y;
                    modalEdicionOtro(keyM, cumplimientoM);
                    //obtenerDatosDetalle(key, cumplimiento);
                });

                if (y == 10) {
                    $(".btnAddPersonaCargoEmpresa").click(function (event) {
                        MostarCargosRegistrados();
                        $("#modalAddPersonaCargoEmpresa").modal("show");
                    });
                } else if (y == 11) {
                    $(".btnAddVehiculosEmpresa").click(function (event) {
                        $("#modalAddVehiculoEmpresa").modal("show");
                    });
                }

            },
            beforeSend: function (objeto) {
                $("#idSmsPres3").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function (result) {
                $("#idSmsPres3").fadeIn(1000).html(result + 'Procesando ...');
                $("#tblCabCumpliento3").html("");
                $("#idSmsPres3").fadeIn(1000).html(result + "...");
                return false;
            }
        });
    }
}
function armaDetalle(dataaux) {
    var htmlTblCumplimiento = "";
    debugger;
    for (i = 0; i < dataaux.length; i++) {
        htmlTblCumplimiento += '<tr>';
        htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].descripcionTipo + '</td>';
        htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].detalle + '</td>';
        htmlTblCumplimiento += ' <td>';
        htmlTblCumplimiento += '     <div class="dropdown">'; //aq
        htmlTblCumplimiento += '         <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
        htmlTblCumplimiento += '             <i class="fas fa-ellipsis-v"> </i></a>';
        htmlTblCumplimiento += '             <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';
        // htmlTblCumplimiento += '                 <a class="dropdown-item btnOnOff" href="#" data="undefined"> Imprimir </a>';
        htmlTblCumplimiento += '                 <a class="dropdown-item" href="javascript:modalUpdateCumplimiento(' + dataaux[i].nIdInforme + ',' + dataaux[i].nId + ',' + dataaux[i].nIdCumplimiento + ')"> Modificar </a>';
        htmlTblCumplimiento += '                 <a class="dropdown-item" href="javascript:EliminarCumplimiento(' + dataaux[i].nIdInforme + ',' + dataaux[i].nId + ',' + dataaux[i].nIdCumplimiento + ')"> Eliminar </a>';
        htmlTblCumplimiento += '             </div>';
        htmlTblCumplimiento += '      </div>';
        htmlTblCumplimiento += '  </td>';
        htmlTblCumplimiento += ' </tr>';
    }
    if (nSeccion == 1) {
        $("#tbldetCumpliento").html(htmlTblCumplimiento);
    } else {
        $("#tbldetCumpliento2").html(htmlTblCumplimiento);
    }
}

function modalEdicion(x, y) {

    $("#smslogM").html("");



    $.ajax({

        url: "?r=user/obtineDatosModal",

        type: "POST",

        data: {

            keyInforme: x,

            keyCumplimiento: y

        },

        success: function (data) {

            debugger;

            $("#idInforme").val(x);

            $("#idCumplimiento").val(y);

            $("#idTipo").html("");

            $("#modalTitCumplimiento").html("");

            if (data.success == true) {

                $("#modalTitCumplimiento").html(data.data.datCumpliento.cNombre);

                //llenamos el select 

                var aux_select = ""

                for (i = 0; i < data.data.dataCodigos.length; i++) {

                    aux_select += '<option value=' + data.data.dataCodigos[i].cValor + '>' + data.data.dataCodigos[i].cDescripcion + '</option>';

                }

                $("#idTipo").html(aux_select);

                $("#modalAddCumplimiento").modal("show");

                return false;



            } else {



                $("#idSmsPres").addClass("text-warning");

                $("#idSmsPres").fadeIn(1000).html("");

                $("#idSmsPres").html(data.message + "...");

            }



        },

        beforeSend: function (objeto) {





        },

        error: function (result) {





            return false;

        }

    });

}

function modalEdicionOtro(x, y) {

    if (y == 10) {

        $("#modalAddCumplimientoTS").modal("show");

    } else {

        $("#modalAddCumplimientoUM").modal("show");

    }

}

$('.idTipo').on('change', function () {
    if (this.value == 2 || this.value == 5) {
        $(".groupImcumplimiento").removeAttr("style");
    } else {
        $(".groupImcumplimiento").attr("style", "display:none");
    }
    if(globaly == 7 || globaly == 8 || globaly == 9){
        $(".groupImcumplimiento").attr("style", "display:none");
    }
});
$("#fnRegistrarDetalleModal").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {

        //  var formData = new FormData(this, "#fnProccessloginPro");

        var formElement = document.getElementById("fnRegistrarDetalleModal");

        var formData = new FormData(formElement)

        //var formData = form.serialize();

        $.ajax({

            url: "?r=user/registroDocumentoDetalle",

            type: "POST",

            data: formData,

            contentType: false,

            cache: false,

            processData: false,

            success: function (data) {

                debugger;

                if (data.success == true) {

                    document.getElementById('fnRegistrarDetalleModal').reset();
                    $(".groupImcumplimiento").attr("style", "display:none");
                    armaDetalle(data.data);

                } else {

                }

                $("#smslogM").addClass("text-warning");

                $("#smslogM").fadeIn(1000).html("");

                $("#smslogM").html(data.message + "...");



            },

            beforeSend: function (objeto) {



                $("#smslogM").fadeIn(1000).html(htmlprocesando + 'Procesando ...');



            },

            error: function (result) {

                $("#smslogM").addClass("text-warning");

                $("#smslogM").fadeIn(1000).html("");

                $("#smslogM").fadeIn(1000).html(result + "...");



                return false;

            }

        });

        return false;

    }



    return false;

});
$("#fnUpdateDetalleModal").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined)
    //make sure that we can use FormData ie>9, chrome > 7, opera > 12 safari >5, android > 3  gecko mobile > 2, opera mobile >12 <- wil support XHR too
    {
        //  var formData = new FormData(this, "#fnProccessloginPro");
        var formElement = document.getElementById("fnUpdateDetalleModal");
        var formData = new FormData(formElement)
        //var formData = form.serialize();
        $.ajax({
            url: "?r=user/updateDocumentoDetalle",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                debugger;
                if (data.success == true) {
                    document.getElementById('fnUpdateDetalleModal').reset();
                    obtenerDatosDetalle(key, globaly);
                    document.getElementById("divAdjun1").setAttribute("style", "");
                    $("#modalUpdCumplimiento").modal("hide");
                } else {
                }
                $("#smslogM").addClass("text-warning");
                $("#smslogM").fadeIn(1000).html("");
                $("#smslogM").html(data.message + "...");
            },
            beforeSend: function (objeto) {
                $("#smslogM").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function (result) {
                $("#smslogM").addClass("text-warning");
                $("#smslogM").fadeIn(1000).html("");
                $("#smslogM").fadeIn(1000).html(result + "...");
                return false;
            }
        });
        return false;
    }
    return false;
});
$("#fnRegistrarDetalleModalTS").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var formElement = document.getElementById("fnRegistrarDetalleModalTS");
        var formData = new FormData(formElement)
        $.ajax({
            url: "?r=user/registroDocumentoDetalleTS",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    bootbox.alert({
                        title: "AVISO",
                        message: data.message,
                        size: "sm",
                        closeButton: false,
                        callback: function () {
                            formElement.reset();
                            $("#modalAddCumplimientoTS").modal("hide");
                        }
                    });
                    nSeccion = 3;
                    obtenerDatosDetalle(key, 10);
                } else {
                    bootbox.alert({
                        title: "VERIFICAR",
                        message: data.message,
                        size: "sm",
                        closeButton: false
                    });
                }
            }

        });
        return false;
    }
    return false;

});

$("#fnRegistrarDetalleModalUM").submit(function (e) {

    e.preventDefault();

    if (window.FormData !== undefined) {

        var formElement = document.getElementById("fnRegistrarDetalleModalUM");

        var formData = new FormData(formElement);

        $.ajax({

            url: "?r=user/registroDocumentoDetalleUM",

            type: "POST",

            data: formData,

            contentType: false,

            cache: false,

            processData: false,

            success: function (data) {

                debugger;

                if (data.success == true) {

                    bootbox.alert({

                        title: "AVISO",

                        message: data.message,

                        size: "sm",

                        closeButton: false,

                        callback: function () {

                            formElement.reset();

                            $("#modalAddCumplimientoUM").modal("hide");

                        }

                    });

                    obtenerDatosDetalle(key, 11);

                } else {

                    bootbox.alert({

                        title: "AVISO",

                        message: data.message,

                        size: "sm",

                        closeButton: false

                    });

                }

            }

        });

        return false;

    }



    return false;

});

$("#uploadFormActa").on('submit', function (e) {

    e.preventDefault();

    $.ajax({

        type: 'POST',

        url: '?r=user/UploadArchivoActa',

        data: new FormData(this),

        contentType: false,

        cache: false,

        processData: false,

        beforeSend: function () {

            $('#uploadStatusActa').html('<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />');

        },

        error: function (ex) {

            $('#uploadStatusActa').html('<span style="color:#EA4335;">Images upload failed, please try again.<span>');

        },

        success: function (data) {

            debugger;

            $('#uploadFormActa')[0].reset();

            $('#uploadStatusActa').html('');


            var ht = "";

            $("#imgAdjActa").html(ht);

            debugger;
            if (data.data.length > 0) {
                ht = "";
                for (i = 0; i < data.data.length; i++) {
                    ht += '<div class="col-4">';
                    ht += '     <div class="card" style="width: 18rem;">';
                    ht += '       <img class="card-img-top" src="' + data.data[i].cRuta + '" alt="Card image cap" style="height:12rem;">';
                    ht += '        <div class="card-body">';
                    ht += '          <h5 class="card-title">' + data.data[i].cNombre + '</h5>';
                    ht += '          <a href="javascript:EliminarImagenActa(' + data.data[i].nId + ',' + data.data[i].nIdInforme + ')" class="btn btn-primary">Remover</a>';
                    ht += '        </div>';
                    ht += '      </div>';
                    ht += '   </div>'
                }
                $("#imgAdjActa").html(ht);
            }
            if (data.success) {

            } else {

                $("#imgAdjActa").append("<span style='color:#EA4335;'>Error al cargar las imagenes. Vuelve a intentarlo.<span>");

            }

        }

    });

});


$("#uploadFormActaReverso").on('submit', function (e) {     //ANGC 20210910 REVERSO

    e.preventDefault();

    $.ajax({

        type: 'POST',

        url: '?r=user/UploadArchivoActaReverso',

        data: new FormData(this),

        contentType: false,

        cache: false,

        processData: false,

        beforeSend: function () {

            $('#uploadStatusActaReverso').html('<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />');

        },

        error: function (ex) {

            $('#uploadStatusActaReverso').html('<span style="color:#EA4335;">Images upload failed, please try again.<span>');

        },

        success: function (data) {

            debugger;

            $('#uploadFormActaReverso')[0].reset();

            $('#uploadStatusActaReverso').html('');

            // bootbox.alert({

            //     message: 'Acta subidas con Ã©xito',

            //     size: 'small'

            // });

            var ht = "";

            $("#imgAdjActaReverso").html(ht);

            debugger;

            if (data.success) {

                ht = "";



                ht += '<div class="col-4">';

                ht += '     <div class="card" style="width: 18rem;">';

                ht += '       <img class="card-img-top" src="' + data.data.cRutaActaReverso + '" alt="Card image cap" style="height:12rem;">';

                ht += '        <div class="card-body">';

                ht += '          <h5 class="card-title">Acta</h5>';

                ht += '        </div>';

                ht += '      </div>';

                ht += '   </div>';





                $("#imgAdjActaReverso").html(ht);



            } else {

                $("#imgAdjActaReverso").append("<span style='color:#EA4335;'>Error al cargar las imagenes. Vuelve a intentarlo.<span>");

            }

        }

    });
    // 
});



$("#uploadForm").on('submit', function (e) {

    e.preventDefault();

    $.ajax({

        type: 'POST',

        url: '?r=user/UploadArchivoSeg',

        data: new FormData(this),

        contentType: false,

        cache: false,

        processData: false,

        beforeSend: function () {

            $('#uploadStatus').html('<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />');

        },

        error: function (ex) {

            $('#uploadStatus').html('<span style="color:#EA4335;">Images upload failed, please try again.<span>');

        },

        success: function (data) {


            $('#uploadForm')[0].reset();

            $('#uploadStatus').html('');

            bootbox.alert({

                message: 'ImÃ¡genes subidas con Ã©xito',

                size: 'small'

            });

            var ht = "";

            $("#imgAdj").html(ht);

            if (data.success) {


                armaImagen(data.data, key);




            } else {

                $("#imgAdj").append("<span style='color:#EA4335;'>Error al cargar las imï¿½genes. Vuelve a intentarlo.<span>");

            }

        }

    });

});
$("#uploadForm_aux").on('submit', function (e) {

    e.preventDefault();

    $.ajax({

        type: 'POST',

        url: '?r=user/UploadArchivoSeg',

        data: new FormData(this),

        contentType: false,

        cache: false,

        processData: false,

        beforeSend: function () {

            $('#uploadStatus_aux').html('<img src="res/img/load-espera.gif" style="width:30px;heigth:30px" />');

        },

        error: function (ex) {

            $('#uploadStatus_aux').html('<span style="color:#EA4335;">Images upload failed, please try again.<span>');

        },

        success: function (data) {

debugger;
            $('#uploadForm_aux')[0].reset();

            $('#uploadStatus_aux').html('');

            bootbox.alert({

                message: 'ImÃ¡genes subidas con Ã©xito',

                size: 'small'

            });

            var ht = "";

            $("#imgAdj_aux").html(ht);

            if (data.success) {


                armaImagen_aux(data.data, key);




            } else {

                $("#imgAdj_aux").append("<span style='color:#EA4335;'>Error al cargar las imï¿½genes. Vuelve a intentarlo.<span>");

            }

        }

    });

});


function armaImagen(data, parKey) {
    var ht = "";
    for (i = 0; i < data.length; i++) {

        ht += '<div class="col-4">';
        ht += '     <div class="card" style="width: 18rem;">';
        ht += '       <img class="card-img-top" src="' + data[i].cRuta + '" alt="Card image cap" style="height:12rem;">';
        ht += '        <div class="card-body">';
        ht += '          <h5 class="card-title">' + data[i].cNombre + '</h5>';
        ht += '          <a href="javascript:EliminarImagenCumplimiento(' + data[i].nId + ',' + parKey + ')" class="btn btn-primary">Remover</a>';
        ht += '        </div>';
        ht += '      </div>';
        ht += '   </div>';

    }

    $("#imgAdj").html(ht);
}
function armaImagen_aux(data, parKey) {
    var ht = "";
    for (i = 0; i < data.length; i++) {

        ht += '<div class="col-4">';
        ht += '     <div class="card" style="width: 18rem;">';
        ht += '       <img class="card-img-top" src="' + data[i].cRuta + '" alt="Card image cap" style="height:12rem;">';
        ht += '        <div class="card-body">';
        ht += '          <h5 class="card-title">' + data[i].cNombre + '</h5>';
        ht += '          <a href="javascript:EliminarImagenCumplimiento(' + data[i].nId + ',' + parKey + ')" class="btn btn-primary">Remover</a>';
        ht += '        </div>';
        ht += '      </div>';
        ht += '   </div>';

    }

    $("#imgAdj_aux").html(ht);
}
function MostarCargosRegistrados(_Empresa) {
    var modo = $("label[for=Cargo]");
    var texto = $("a[for=Cargo]");
    if (modo.attr("link-cargo") == "on") {
        modo.attr("link-cargo", "off");
        texto.text("[Ocultar Cargos]");
        $("input[name=Cargo]").hide();
        $.ajax({
            url: "./?r=cargos/obtenerCargosEmpresaId",
            type: "POST",
            data: { idEmpresa: _Empresa },
            success: function (data) {
                datos = JSON.parse(data);
                $("select[name=Cargo]").empty();
                var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                for (i = 0; i < datos.length; i++) {
                    html_aux += "<option value=" + datos[i].nId + ">" + datos[i].cCargo + "</option>";
                }
                $("select[name=Cargo]").html(html_aux);
                $("select[name=Cargo]").next(".select2-container").show();
            }
        });
    } else {
        modo.attr("link-cargo", "on");
        texto.text("[Mostrar Cargos]");
        $("select[name=Cargo]").next(".select2-container").hide();
        $("input[name=Cargo]").show();
    }
}

$("#frmAddPersonaCargoEmpresa").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form)
        $.ajax({
            url: "?r=trabajadores/AddPersonaCargoEmpresa",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#modalAddPersonaCargoEmpresa").modal("hide");
                    $.ajax({
                        url: "./?r=trabajadores/getEmpleadosCargoEmpresa",
                        type: "POST",
                        data: { idEmpresa: formData.get("Empresa") },
                        success: function (data) {
                            datos = JSON.parse(data);
                            $("#selTrabajadores").empty();
                            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                            for (i = 0; i < datos.length; i++) {
                                html_aux += "<option value=" + datos[i].nId + ">" + datos[i].Descripcion + "(" + datos[i].cCargo + ")" + "</option>";
                            }
                            $("#selTrabajadores").html(html_aux);
                        }
                    });
                    form.reset();
                    bootbox.alert(data.message);
                } else {
                    bootbox.alert(data.message);
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


// $("#frmAddPersonaCargoEmpresa").submit(function (e) {
//     e.preventDefault();
//     if (window.FormData !== undefined) {
//         var form = this;
//         var formData = new FormData(form)
//         $.ajax({
//             url: "?r=trabajadores/AddPersonaCargoEmpresa",
//             type: "POST",
//             data: formData,
//             contentType: false,
//             cache: false,
//             processData: false,
//             success: function (data) {
//                 if (data.success == true) {
//                     $("#modalAddPersonaCargoEmpresa").modal("hide");
//                     $.ajax({
//                         url: "./?r=trabajadores/getEmpleadosCargoEmpresa",
//                         type: "POST",
//                         data: { idEmpresa: formData.get("Empresa") },
//                         success: function (data) {
//                             datos = JSON.parse(data);
//                             $("#selTrabajadores").empty();
//                             var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
//                             for (i = 0; i < datos.length; i++) {
//                                 html_aux += "<option value=" + datos[i].nId + ">" + datos[i].Descripcion + "(" + datos[i].cCargo + ")" + "</option>";
//                             }
//                             $("#selTrabajadores").html(html_aux);
//                         }
//                     });
//                     form.reset();
//                     bootbox.alert(data.message);
//                 } else {
//                     bootbox.alert(data.message);
//                 }
//             },
//             beforeSend: function (objeto) {
//                 $("#smsMCargo").addClass("text-success");
//                 $("#smsMCargo").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
//             },
//             error: function (result) {
//                 $("#smsMCargo").fadeIn(1000).html("");
//                 $("#smsMCargo").fadeIn(1000).html(result + "...");
//                 return false;
//             }
//         });
//         return false;
//     }
//     return false;
// });

$("#frmAddVehiculoEmpresa").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form)
        $.ajax({
            url: "?r=vehiculo/registroVehiculo",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    $("#modalAddVehiculoEmpresa").modal("hide");
                    $.ajax({
                        url: "./?r=vehiculo/getVehiculosEmpresaId",
                        type: "POST",
                        data: { idEmpresa: formData.get("EMPRESA") },
                        success: function (data) {
                            datos = JSON.parse(data);
                            $("select[name=tipo]").empty();
                            $("#idTipo").empty();
                            var html_aux = "<option value=" + 0 + " disabled selected>Seleccione opción</option>"
                            for (i = 0; i < datos.length; i++) {
                                html_aux += "<option value=" + datos[i].nIdVehiculo + ">" + datos[i].cNombre + "(" + datos[i].cPlaca + ")" + "</option>";
                            }
                            $("select[name=tipo]").html(html_aux);
                        }
                    });
                    form.reset();
                    bootbox.alert(data.message);
                } else {
                    bootbox.alert(data.message);
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

function GestionCumplimiento10(key, modalidad, informe, cumplimiento) {
    if (modalidad == 1) {
        $.ajax({
            url: ".?r=user/obtieneDetalleCumplimineto",
            data: {
                keyModalidad: 2,
                keyInforme: informe,
                keyCumplimiento: cumplimiento
            },
            type: "POST",
            success: function (data) {
                if (data.success == true) {
                    $("#modalAddCumplimientoTS").modal("show");
                    for (i = 0; i < data.detalle.length; i++) {
                        if (data.detalle[i].nId == key) {
                            $("select[name='tipo']").val(data.detalle[i].nId);
                            $("select[name='norma']").val(data.detalle[i].nCodigo);
                        }
                    }
                } else {
                    bootbox.alert({
                        title: "VERIFICAR",
                        message: data.message,
                        size: "sm",
                        closeButton: false
                    });
                }
            }
        });
    } else if (modalidad == 2) {
        bootbox.confirm({
            title: "CONFIRMAR",
            message: "Está seguro de eliminar el registro?",
            closeButton: false,
            size: "sm",
            buttons: {
                cancel: {
                    label: 'NO'
                },
                confirm: {
                    label: 'SI'
                }
            },
            callback: function (result) {
                if (result == true) {
                    $.ajax({
                        url: ".?r=user/EliminarTrabajadorSupervisado",
                        data: { idTrabajadorSupervisado: key },
                        type: "POST",
                        success: function (data) {
                            if (data.success == true) {
                                $.ajax({
                                    url: "?r=user/obtieneDetalleCumplimineto",
                                    type: "POST",
                                    data: {
                                        keyModalidad: 2,
                                        keyInforme: informe,
                                        keyCumplimiento: cumplimiento
                                    },
                                    success: function (data) {
                                        var aux = ". Para agregar un nuevo registro has click ";
                                        aux += '<button class="btn btn-icon  btn-sm btn-primary btnAddCumplientoOtro" type="button" > ';
                                        aux += '<span class="btn-inner--icon"><i class="ni ni-active-40"></i></span>';
                                        aux += '<span class="btn-inner--text">Aquí­</span>';
                                        aux += '</button>';
                                        aux += '<button class="btn btn-icon  btn-sm btn-primary btnAddPersonaCargoEmpresa" type="button" > ';
                                        aux += '<span class="btn-inner--icon"><i class="ni ni-badge"></i></span>';
                                        aux += '<span class="btn-inner--text">Persona</span>';
                                        aux += '</button>';
                                        if (data.success == true) {
                                            var htmlCabTbl = "";
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> Nombre del Trabajador </th>';
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Cargo </th>';
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Normas Incumplidas </th>';
                                            htmlCabTbl += '<th scope = "col"> </th>';
                                            $("#idSmsPres3").html(data.message + aux);
                                            $("#tblCabCumpliento3").html(htmlCabTbl);

                                            var dataaux = data.detalle;

                                            var htmlTblCumplimiento = "";

                                            if (dataaux.length > 0) {
                                                for (i = 0; i < dataaux.length; i++) {
                                                    htmlTblCumplimiento += '<tr>';
                                                    htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cNombres + ' ' + dataaux[i].cApellidos + '</td>';
                                                    htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cCargo + '</td>';
                                                    htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cCodigo + '</td>';
                                                    htmlTblCumplimiento += ' <td>';
                                                    htmlTblCumplimiento += '     <div class="dropdown">';
                                                    htmlTblCumplimiento += '         <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
                                                    htmlTblCumplimiento += '             <i class="fas fa-ellipsis-v"> </i></a>';
                                                    htmlTblCumplimiento += '             <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';
                                                    htmlTblCumplimiento += '                 <a class="dropdown-item btnPass" href="javascript:ModificarCumplimiento1011(' + modalidad + ',' + informe + ',' + cumplimiento + ')"> Modificar </a>';
                                                    htmlTblCumplimiento += '                 <a class="dropdown-item btnDelete" href="javascript:EliminarCumplimiento1011(' + modalidad + ',' + informe + ',' + cumplimiento + ')"> Eliminar </a>';
                                                    htmlTblCumplimiento += '             </div>';
                                                    htmlTblCumplimiento += '      </div>';
                                                    htmlTblCumplimiento += '  </td>';
                                                    htmlTblCumplimiento += ' </tr>';
                                                }
                                                $("#tbldetCumpliento3").html(htmlTblCumplimiento);
                                            } else {
                                                $("#idSmsPres3").html("no se encontratos datos" + aux);
                                            }
                                        } else {
                                            $("#idSmsPres3").addClass("text-warning");
                                            $("#idSmsPres3").fadeIn(1000).html("");
                                            $("#idSmsPres3").html(data.message + aux);
                                            $("#tblCabCumpliento3").html("");
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> Nombre del Trabajador </th>';
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Cargo </th>';
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Normas Incumplidas </th>';
                                            htmlCabTbl += '<th scope = "col"> </th>';
                                            $("#tblCabCumpliento3").html(htmlCabTbl);
                                            $("#tbldetCumpliento3").html("");
                                        }

                                        $(".btnAddCumplientoOtro").click(function (event) {
                                            var keyM = informe;
                                            var cumplimientoM = cumplimiento
                                            modalEdicionOtro(keyM, cumplimientoM);
                                            //obtenerDatosDetalle(key, cumplimiento);
                                        });

                                        $(".btnAddPersonaCargoEmpresa").click(function (event) {
                                            MostarCargosRegistrados();
                                            $("#modalAddPersonaCargoEmpresa").modal("show");
                                        });
                                    },
                                    beforeSend: function (objeto) {
                                        $("#idSmsPres3").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
                                    },
                                    error: function (result) {
                                        $("#idSmsPres3").fadeIn(1000).html(result + 'Procesando ...');
                                        $("#tblCabCumpliento3").html("");
                                        $("#idSmsPres3").fadeIn(1000).html(result + "...");
                                        return false;
                                    }
                                });
                            } else {
                                bootbox.alert({
                                    title: "VERIFICAR",
                                    message: data.message,
                                    size: "sm",
                                    closeButton: false
                                });
                            }
                        }
                    });
                }
            }

        });

    }

}

function GestionCumplimiento11(key, modalidad, informe, cumplimiento) {
    if (modalidad == 1) {
        $.ajax({
            url: ".?r=user/obtieneDetalleCumplimineto",
            data: {
                keyModalidad: 2,
                keyInforme: informe,
                keyCumplimiento: cumplimiento
            },
            type: "POST",
            success: function (data) {
                if (data.success == true) {
                    //$("#modalAddCumplimientoTS").modal("show");
                    for (i = 0; i < data.detalle.length; i++) {
                        if (data.detalle[i].nId == key) {
                            $("select[name='tipo']").val(data.detalle[i].nId);
                            $("select[name='norma']").val(data.detalle[i].nCodigo);
                        }
                    }
                } else {
                    bootbox.alert({
                        title: "VERIFICAR",
                        message: data.message,
                        size: "sm",
                        closeButton: false
                    });
                }
            }
        });
    } else if (modalidad == 2) {
        bootbox.confirm({
            title: "CONFIRMAR",
            message: "¿Está seguro de eliminar el registro?",
            closeButton: false,
            size: "sm",
            buttons: {
                cancel: {
                    label: 'NO'
                },
                confirm: {
                    label: 'SI'
                }
            },
            callback: function (result) {
                if (result == true) {
                    $.ajax({
                        url: ".?r=user/EliminarInfoVehiculoInforme",
                        data: { Id: key },
                        type: "POST",
                        success: function (data) {
                            if (data.success == true) {
                                $.ajax({
                                    url: "?r=user/obtieneDetalleCumplimineto",
                                    type: "POST",
                                    data: {
                                        keyModalidad: 2,
                                        keyInforme: informe,
                                        keyCumplimiento: cumplimiento
                                    },
                                    success: function (data) {
                                        debugger;
                                        var aux = ". Para agregar un nuevo registro has click ";
                                        aux += '<button class="btn btn-icon  btn-sm btn-primary btnAddCumplientoOtro" type="button" > ';
                                        aux += '<span class="btn-inner--icon"><i class="ni ni-active-40"></i></span>';
                                        aux += '<span class="btn-inner--text">Aquí­</span>';
                                        aux += '</button>';
                                        aux += '<button class="btn btn-icon btn-sm btn-primary btnAddVehiculosEmpresa" type="button" > ';
                                        aux += '<span class="btn-inner--icon"><i class="ni ni-bus-front-12"></i></span>';
                                        aux += '<span class="btn-inner--text">Vehiculos</span>';
                                        aux += '</button>';

                                        if (data.success == true) {

                                            var htmlCabTbl = "";

                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> NÂ° de Placa </th>';
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Tipo de Vehiculo </th>';
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Normas Incumplidas </th>';
                                            htmlCabTbl += '<th scope = "col"> </th>';
                                            $("#idSmsPres3").html(data.message + aux);
                                            $("#tblCabCumpliento3").html(htmlCabTbl);

                                            var dataaux = data.detalle;

                                            var htmlTblCumplimiento = "";
                                            if (dataaux.length > 0) {


                                                for (i = 0; i < dataaux.length; i++) {
                                                    htmlTblCumplimiento += '<tr>';
                                                    htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cPlaca + '</td>';
                                                    htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cNombre + '</td>';
                                                    htmlTblCumplimiento += ' <td class="budget">' + dataaux[i].cValor + '</td>';
                                                    htmlTblCumplimiento += ' <td>';
                                                    htmlTblCumplimiento += '     <div class="dropdown">';
                                                    htmlTblCumplimiento += '         <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
                                                    htmlTblCumplimiento += '             <i class="fas fa-ellipsis-v"> </i></a>';
                                                    htmlTblCumplimiento += '             <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';
                                                    htmlTblCumplimiento += '                 <a class="dropdown-item btnPass" href="#" data="undefined"> Modificar </a>';
                                                    htmlTblCumplimiento += '                 <a class="dropdown-item btnDelete" href="#" data="undefined"> Eliminar </a>';
                                                    htmlTblCumplimiento += '             </div>';
                                                    htmlTblCumplimiento += '      </div>';
                                                    htmlTblCumplimiento += '  </td>';
                                                    htmlTblCumplimiento += ' </tr>';
                                                }

                                                $("#tbldetCumpliento3").html(htmlTblCumplimiento);

                                            } else {
                                                $("#idSmsPres3").html("no se encontratos datos" + aux);
                                            }
                                        } else {

                                            $("#idSmsPres3").addClass("text-warning");
                                            $("#idSmsPres3").fadeIn(1000).html("");
                                            $("#idSmsPres3").html(data.message + aux);

                                            $("#tblCabCumpliento3").html("");

                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "name"> NÂ° de Placa </th>';
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Tipo de Vehiculo </th>';
                                            htmlCabTbl += '<th scope = "col" class = "sort" data - sort = "budget" > Normas Incumplidas </th>';
                                            htmlCabTbl += '<th scope = "col"> </th>';
                                            $("#tblCabCumpliento3").html(htmlCabTbl);
                                            $("#tbldetCumpliento3").html("");

                                        }
                                        $(".btnAddCumplientoOtro").click(function (event) {
                                            var keyM = informe;
                                            var cumplimientoM = cumplimiento
                                            modalEdicionOtro(keyM, cumplimientoM);
                                        });

                                        $(".btnAddVehiculosEmpresa").click(function (event) {
                                            $("#modalAddVehiculoEmpresa").modal("show");
                                        });
                                    },
                                    beforeSend: function (objeto) {
                                        $("#idSmsPres3").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
                                    },
                                    error: function (result) {
                                        $("#idSmsPres3").fadeIn(1000).html(result + 'Procesando ...');
                                        $("#tblCabCumpliento3").html("");
                                        $("#idSmsPres3").fadeIn(1000).html(result + "...");
                                        return false;
                                    }
                                });
                            } else {
                                bootbox.alert({
                                    title: "VERIFICAR",
                                    message: data.message,
                                    size: "sm",
                                    closeButton: false
                                });
                            }
                        }
                    });
                }
            }
        });
    }
}

function EliminarCumplimiento(informe, keyCumplimiento, cumplimiento) {
    $.ajax({
        url: ".?r=user/DeleteCumplimiento",
        data: { informe: informe, keyCumplimiento: keyCumplimiento, cumplimiento: cumplimiento },
        type: "POST",
        success: function (data) {
            debugger;
            bootbox.alert({
                message: data.message,
                size: 'sm'
            });
            $("#tblCumpliento").html();
            htmlTblCumplimiento = "";
            for (i = 0; i < data.data.length; i++) {
                htmlTblCumplimiento += '<tr>';
                htmlTblCumplimiento += ' <td class="budget">' + data.data[i].descripcionTipo + '</td>';
                htmlTblCumplimiento += ' <td class="budget">' + data.data[i].detalle + '</td>';
                //htmlTblCumplimiento += ' <td class="budget">' + data.data[i].dCreate + '</td>';
                htmlTblCumplimiento += '<td class="text-right">';
                htmlTblCumplimiento += '  <div class="dropdown">';
                htmlTblCumplimiento += '    <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
                htmlTblCumplimiento += '      <i class="fas fa-ellipsis-v"> </i>';
                htmlTblCumplimiento += '    </a>';
                htmlTblCumplimiento += '    <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">';
                // htmlTblCumplimiento += '      <a class="dropdown-item" href="javascript:ModificarCumplimiento(' + data.data[i].nIdInforme + ',' + data.data[i].nId + ',' + data.data[i].nIdCumplimiento + ')">';
                // htmlTblCumplimiento += ' Modificar </a>';
                htmlTblCumplimiento += '      <a class="dropdown-item" href="javascript:EliminarCumplimiento(' + data.data[i].nIdInforme + ',' + data.data[i].nId + ',' + data.data[i].nIdCumplimiento + ')">';
                htmlTblCumplimiento += ' Eliminar </a>';
                htmlTblCumplimiento += '    </div>';
                htmlTblCumplimiento += '  </div>';
                htmlTblCumplimiento += '</td>';
                htmlTblCumplimiento += ' </tr>';
            }
            if (nSeccion == 1) {
                $("#tbldetCumpliento").html(htmlTblCumplimiento);
            } else {
                $("#tbldetCumpliento2").html(htmlTblCumplimiento);
            }
        }
    });
}
function EliminarImagenCumplimiento(parId, parKeyInforme) {
    $.ajax({
        url: ".?r=user/DeleteImagenCumplimiento",
        data: { nIdImg: parId, nIdInforme: parKeyInforme },
        type: "POST",
        success: function (data) {
          
            bootbox.alert({
                message: data.message,
                size: 'sm'
            });
            cargarImagenes(key, globalcump);
            cargarImagenes_aux(key, globalcump);
        }
    });
}

function EliminarImagenActa(parId, parKeyInforme) {
    $.ajax({
        url: ".?r=user/DeleteImagenCumplimiento",
        data: { nIdImg: parId, nIdInforme: parKeyInforme },
        type: "POST",
        success: function (data) {
            debugger;
            bootbox.alert({
                message: data.message,
                size: 'sm'
            });
            document.getElementById("EnviarActa").click(); //cargarImagenes(key, globalcump);
        }
    });
}

//modalUpdateCumplimiento
function modalUpdateCumplimiento(informe, keyCumplimiento, cumplimiento) {
    $.ajax({
        url: "?r=user/obtineDatosModalUpdate",
        type: "POST",
        data: {
            keyInforme: informe,
            keyCumplimientoDes: keyCumplimiento,
            keyCumplimiento: cumplimiento
        },
        success: function (data) {
            debugger;
            $("#modalUpdCumplimiento").modal("show");
            $("#idUpdInforme").val(informe);
            $("#idUpdCumplimiento").val(keyCumplimiento);
            $("#idUpdTipo").html("");

            $("#modalTitUpdCumplimiento").html("");

            if (data.success == true) {
                $("#modalTitUpdCumplimiento").html(data.data.datCumpliento.cNombre);
                //llenamos el select 
                var aux_select = ""
                for (i = 0; i < data.data.dataCodigos.length; i++) {
                    aux_select += '<option value=' + data.data.dataCodigos[i].cValor + '>' + data.data.dataCodigos[i].cDescripcion + '</option>';
                }

                $("#idUpdTipo").html(aux_select);
                $("#idDetalleUpd").val(data.data.dataDescripcion.cDescripcion);

                if ($("#idUpdTipo").select().val() == 2 || $("#idUpdTipo").select().val() == 5) {
                    $(".groupImcumplimiento").removeAttr("style");
                    
                    $("select[name=motivo]").val(data.data.dataDescripcion.nValorInc);
                } else {
                    $(".groupImcumplimiento").attr("style", "display:none");
                }

                $("#modalUpdCumplimiento").modal("show");
                return false;
            } else {
                $("#smslogMUpd").addClass("text-warning");
                $("#smslogMUpd").fadeIn(1000).html("");
                $("#smslogMUpd").html(data.message + "...");
            }
        },
        beforeSend: function (objeto) {
        },
        error: function (result) {
            return false;
        }
    });
}