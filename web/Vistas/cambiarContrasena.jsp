<%-- 
    Document   : cambiarContrasena
    Created on : 29-oct-2019, 12:48:10
    Author     : daw209
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cambio de contraseña</title>
        <meta http-equiv="refresh" content="60; url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/cambiarContra.css">

        <script>
            function myFunction() {
                var x = document.getElementById("myLinks");
                if (x.style.display === "block") {
                    x.style.display = "none";
                } else {
                    x.style.display = "block";
                }
            }
        </script>
    </head>

    <body>

        <div id="contenedorPrincipal">

            <form name="formContra" action="../Controladores/controlador.jsp" method="POST">
                
                <h1>Cambio de contraseña</h1>
                
                <h3>Nueva contraseña:</h3> <input type="password" name ="pw" value=''><br><br>
                <h3>Repite la contraseña:</h3> <input type="password" name ="pw2" value=''><br><br> 

                <input type="submit" name="cambiarContraUsu" value="Cambiar"><br><br>
                <input type="submit" name="volverPerfil" value="Volver">
            </form>
            
        </div>
        
    </body>
</html>
