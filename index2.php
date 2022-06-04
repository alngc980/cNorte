<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Convertir HTML a PDF</title>
    <!-- El script de la librería-->
    <script src="https://parzibyte.github.io/ejemplos-javascript/html-a-pdf/html2pdf.bundle.min.js"></script>
    <!--Nuestro script, que se encarga de crear el PDF usando la librería-->
    <script src="script.js"></script>
    <!-- Algunos estilos -->
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <h1>Mi página web</h1>
    <strong>Presiona el siguiente botón para crear un PDF:</strong>
    <button id="btnCrearPdf">Click aquí</button>
    <h5>Estamos probando la creación de un PDF desde HTML usando JavaScript</h5>
    <a href="//parzibyte.me/blog">Creado por Parzibyte</a>
    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptas dignissimos laudantium laboriosam asperiores?
        Doloremque fuga quia odit quas. Obcaecati aliquam suscipit molestias? Architecto nisi blanditiis maxime beatae
        temporibus assumenda ex.</p>
    <img src="lake-5534341_1280.jpg" alt="Una imagen">
    <h1>Otro encabezado</h1>
    <table>
        <thead>
            <tr>
                <th>Nombre</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Luis Cabrera Benito</td>
            </tr>
        </tbody>
    </table>
</body>

</html>
<script>
/*
  ____          _____               _ _           _       
 |  _ \        |  __ \             (_) |         | |      
 | |_) |_   _  | |__) |_ _ _ __ _____| |__  _   _| |_ ___ 
 |  _ <| | | | |  ___/ _` | '__|_  / | '_ \| | | | __/ _ \
 | |_) | |_| | | |  | (_| | |   / /| | |_) | |_| | ||  __/
 |____/ \__, | |_|   \__,_|_|  /___|_|_.__/ \__, |\__\___|
         __/ |                               __/ |        
        |___/                               |___/         
    
____________________________________
/ Si necesitas ayuda, contáctame en \
\ https://parzibyte.me               /
 ------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
Creado por Parzibyte (https://parzibyte.me). Este encabezado debe mantenerse intacto,
excepto si este es un proyecto de un estudiante.
*/
document.addEventListener("DOMContentLoaded", () => {
    // Escuchamos el click del botón
    const $boton = document.querySelector("#btnCrearPdf");
    $boton.addEventListener("click", () => {
        const $elementoParaConvertir = document.body; // <-- Aquí puedes elegir cualquier elemento del DOM
        html2pdf()
            .set({
                margin: 1,
                filename: 'documento.pdf',
                image: {
                    type: 'jpeg',
                    quality: 0.98
                },
                html2canvas: {
                    scale: 3, // A mayor escala, mejores gráficos, pero más peso
                    letterRendering: true,
                },
                jsPDF: {
                    unit: "in",
                    format: "a3",
                    orientation: 'portrait' // landscape o portrait
                }
            })
            .from($elementoParaConvertir)
            .save()
            .catch(err => console.log(err));
    });
});
</script>