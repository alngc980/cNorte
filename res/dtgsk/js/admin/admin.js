function ActualizarEmpreza(id) {
    $.ajax({
        url: "./?r=empresa/obtenerEmpresasId",
        type: "POST",
        data: { idEmpresa: id },
        success: function (data) {
            datos = JSON.parse(data);
            if (datos != null) {
                $("input[name=idEmpresa]").val(datos.nId);
                $("input[name=Nombre]").val(datos.cNombre);
                $("input[name=RazonSocial]").val(datos.cRazonSocial);
                $("#modalActualizaEmpresa").modal("show");
            }
        }
    });
}

$("#frmEmpresa").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form);
        $.ajax({
            url: "?r=empresa/UpdateEmpresa",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    bootbox.alert(
                        {
                            message: data.message,
                            size: 'sm',
                            closeButton: false,
                            callback: function () {
                                form.reset();
                                location.reload();
                            }
                        });
                } else {
                    bootbox.alert("Se presentaron problemas en la actualización.");
                }
            },
            beforeSend: function (objeto) {
                //$("#smslogM").addClass("text-success");
                //$("#smslogM").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function (result) {
                bootbox.alert("Se presentaron problemas en la actualización.");
                return false;
            }
        });
    }
    return false;
});

function EliminarEmpresa(id) {
    bootbox.confirm({
        message: "¿Está seguro de eliminar el registro de la empresa?",
        buttons: {
            confirm: {
                label: 'Si',
                className: 'btn-success'
            },
            cancel: {
                label: 'No',
                className: 'btn-danger'
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: "./?r=empresa/deleteEmpresa",
                    type: "POST",
                    data: { idEmpresa: id },
                    success: function (data) {
                        if (data.success == true) {
                            bootbox.alert(
                                {
                                    message: data.message,
                                    size: 'sm',
                                    closeButton: false,
                                    callback: function () {
                                        location.reload();
                                    }
                                });
                        }
                    }
                });
            }
        }
    });
}

function ActualizarSupervision(id) {
    $.ajax({
        url: "./?r=supervision/obtenerTipoSupervisionId",
        type: "POST",
        data: { idSuper: id },
        success: function (data) {
            datos = JSON.parse(data);
            if (datos != null) {
                $("input[name=idSupervision]").val(datos.nId);
                $("input[name=NombreSupervision]").val(datos.cNombre);
                $("#modalAddTipoSupervision").modal("show");
            }
        }
    });
}

$("#frmSupervision").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form);
        $.ajax({
            url: "?r=supervision/UpdateSupervision",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    bootbox.alert(
                        {
                            message: data.message,
                            size: 'sm',
                            closeButton: false,
                            callback: function () {
                                form.reset();
                                location.reload();
                            }
                        });
                } else {
                    bootbox.alert("Se presentaron problemas en la actualización.");
                }
            },
            beforeSend: function (objeto) {
                //$("#smslogM").addClass("text-success");
                //$("#smslogM").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function (result) {
                bootbox.alert("Se presentaron problemas en la actualización.");
                return false;
            }
        });
    }
    return false;
});

function EliminarSupervision(id) {
    bootbox.confirm({
        message: "¿Está seguro de eliminar el registro?",
        buttons: {
            confirm: {
                label: 'Si',
                className: 'btn-success'
            },
            cancel: {
                label: 'No',
                className: 'btn-danger'
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: "./?r=supervision/deleteSupervision",
                    type: "POST",
                    data: { idSuper: id },
                    success: function (data) {
                        if (data.success == true) {
                            bootbox.alert(
                                {
                                    message: data.message,
                                    size: 'sm',
                                    closeButton: false,
                                    callback: function () {
                                        location.reload();
                                    }
                                });
                        }
                    }
                });
            }
        }
    });
}

function ActualizarUUNN(id) {
    $.ajax({
        url: "./?r=uunn/obtenerUUNNId",
        type: "POST",
        data: { idUUNN: id },
        success: function (data) {
            datos = JSON.parse(data);
            if (datos.length > 0) {
                for (i = 0; i < datos.length; i++) {
                    $("input[name=idUUNN]").val(datos[i].nId);
                    $("input[name=Nombre]").val(datos[i].cNombre);
                }
                $("#modalAddUUNN").modal("show");
            }
        }
    });
}

$("#frmUUNN").submit(function (e) {
    e.preventDefault();
    if (window.FormData !== undefined) {
        var form = this;
        var formData = new FormData(form);
        $.ajax({
            url: "?r=uunn/UpdateUUNN",
            type: "POST",
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data.success == true) {
                    bootbox.alert(
                        {
                            message: data.message,
                            size: 'sm',
                            closeButton: false,
                            callback: function () {
                                form.reset();
                                location.reload();
                            }
                        });
                } else {
                    bootbox.alert("Se presentaron problemas en la actualización.");
                }
            },
            beforeSend: function (objeto) {
                //$("#smslogM").addClass("text-success");
                //$("#smslogM").fadeIn(1000).html(htmlprocesando + 'Procesando ...');
            },
            error: function (result) {
                bootbox.alert("Se presentaron problemas en la actualización.");
                return false;
            }
        });
    }
    return false;
});

function EliminarUUNN(id) {
    bootbox.confirm({
        message: "¿Está seguro de eliminar el registro?",
        buttons: {
            confirm: {
                label: 'Si',
                className: 'btn-success'
            },
            cancel: {
                label: 'No',
                className: 'btn-danger'
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: "./?r=uunn/deleteUUNN",
                    type: "POST",
                    data: { idUUNN: id },
                    success: function (data) {
                        if (data.success == true) {
                            bootbox.alert(
                                {
                                    message: data.message,
                                    size: 'sm',
                                    closeButton: false,
                                    callback: function () {
                                        location.reload();
                                    }
                                });
                        }
                    }
                });
            }
        }
    });
}