var exito;

function fnRedir(ruta) {
    sleep(3000);
    window.location = ruta;
}

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds) {
            break;
        }
    }
}

function gvalidadatos(xtipo, xdato) {
    //1. Correo, 2. Textos, 3, Sexo, 4, Terminos, 5 edad; 

    switch (xtipo) {
        case 1:
            if (xdato.trim() == "") {
                respuestaregistro = "Por favor ingrese su correo";
                exito = false;
            } else {
                if (xdato.length < 16 || xdato.length > 46) {
                    respuestaregistro = "<strong>Error:</strong> Ingrese correo válido";
                    exito = false;
                } else {
                    var indices = [];
                    for (var i = 0; i < xdato.length; i++) {
                        if (xdato[i].toLowerCase() === "@") indices.push(i);
                    }

                    if (indices.length != 1) {
                        respuestaregistro = "<strong>Error:</strong> Ingrese correo valido";
                        exito = false;
                    } else {
                        exito = true;
                    }
                    return exito;

                }
            }
            break;
        case 2:
            if (xdato.trim() == "") {
                respuestaregistro = "<strong>Error:</strong> Por favor no dejar campos vacios";
                exito = false;
            } else {
                if (xdato.length < 3 || xdato.length > 30) {
                    respuestaregistro = "<strong>Error:</strong> Error: Los carecteres admitidos son entre 3 a 30";
                    exito = false;
                } else {
                    exito = true;
                    return exito;
                }
            }
            break;
        case 3:

            if (xdato.trim() == "") {
                respuestaregistro = "<strong>Error:</strong> Por favor ingrese la fecha de vencimiento";
                exito = false;
            } else {
                if (xdato.length != 10) {
                    respuestaregistro = "<strong>Error:</strong> Error: Ingrese fecha valida";
                    exito = false;
                } else {
                    var factual = new Date();
                    var fecharango = 0;
                    factual = factual.getFullYear();
                    var fechaingresada = new Date(xdato);
                    fechaingresada = fechaingresada.getFullYear();
                    fecharango = factual - fechaingresada;
                    if (fecharango < 16 || fecharango > 80) {
                        //respuestaregistro="<strong>Error:</strong> Error: El rango de edad es de 16 a 80";
                        exito = true;
                    } else {
                        exito = true;
                        return exito;
                    }
                }
            }
            break;
        case 4:
            if (xdato.trim() == "") {
                respuestaregistro = "<strong>Error:</strong> Por favor elija su agencia";
                exito = false;
            } else {

                respuestaregistro = "";
                exito = true;


            }

            break;
        case 6:
            if (xdato.trim() == "") {
                respuestaregistro = "<strong>Error:</strong> Por favor ingrese su contraseña";
                exito = false;
            } else {
                if (xdato.length < 6 || xdato.length > 30) {
                    respuestaregistro = "<strong>Error:</strong> Error: Los carecteres admitidos son entre 6 a 30";
                    exito = false;
                } else {
                    exito = true;
                    return exito;
                }
            }
            break;
    }
}