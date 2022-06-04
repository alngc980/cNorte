(function ($) {
    $.fn.Conexion = function (m) {
        var terminado = m.terminado || function () { };
        var durante = m.durante || function () { };
        var fError = m.error || function () { };
        var bloqueo = m.bloqueo || false;
        var async = m.async || true;
        var mensaje = m.mensaje || "Cargando...";
        var contentType = m.contentType || "application/x-www-form-urlencoded; charset=UTF-8";

        var resultadoajax;

        var $espera;
        $.ajax({
            type: "POST",
            async: async,
            url: m.direccion,
            data: m.datos,
            contentType: m.contentType,
            //beforeSend: function () { durante() },
            beforeSend: function () {
                if (bloqueo) {
                    $espera = bootbox.dialog({
                        title: '<strong>Consorcio Norte</strong> <i class="fa fa-spin fa-spinner"></i>',
                        message: mensaje,
                        className: 'modal-centered',
                        size: 'sm',
                        closeButton: false,
                        backdrop: true,
                        onEscape: false
                    });
                }
            },
            error: function (v, status) {
                fError(v, status)
                if (bloqueo) { $espera.modal('hide'); }
                // if (v.responseText.search('LogOff') != -1) {
                //     $.fn.MensajeProcesos({
                //         clase: 'black',
                //         posicion: 'B',
                //         mensaje: 'El tiempo de su sesión ha expirado. Vuela a iniciar sesión para continuar.',
                //         titulo: 'Sesión Finalizado',
                //         tipo_mensaje: 'error',
                //         onhidden: function () {
                //             //window.location = '/Login/Logout';
                //         },
                //         onclick: function () {
                //             //window.location = '/Login/Logout';
                //         }
                //     });
                // }
                // else {
                //     $.fn.MensajeProcesos({
                //         clase: 'red',
                //         posicion: 'B',
                //         mensaje: 'Ha ocurrido un error al procesar la petición, por favor comun\u00CDquese con el departamento de T.I',
                //         titulo: 'Mensaje del Sistema',
                //         tipo_mensaje: 'error'
                //     });
                // }
            },
            success: function (data) {
                if (m.bloqueo) { $espera.modal('hide'); }
                terminado(data);
                resultadoajax = data;
            }
        });
        //return resultadoajax;
    }
})(jQuery);

