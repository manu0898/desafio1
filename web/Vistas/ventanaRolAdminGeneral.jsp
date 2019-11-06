<%-- 
    Document   : ventanaRolAdminGeneral
    Created on : 24-oct-2019, 12:45:48
    Author     : daw209
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ventana rol adminGeneral</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" type="text/css" href="../css/rolAdminGeneral.css">
    </head>

    <body>

        <div id="contenedorPrincipal">

            <form name="form" action="../Controladores/controlador.jsp" method="POST">

                <h1>Elige el rol con el que quieres acceder</h1>

                <br><br><select name="eligeRolAG">
                    <option value='adminGeneral'>Adiministrador general</option>
                    <option value='adminAula'>Adiministrador de aulas</option>
                    <option value='profesor'>Profesor</option>
                </select><br><br>

                <input type="submit" name="entrarAdminGen" value="Entrar"><br><br>
                <input type="submit" name="cerrarSesion" value="Cerrar sesión"/>
            </form>
            <footer>Manuel Ruiz González, 2ºDAW, CIFP Virgen de Gracia</footer>
        </div>
    </body>
</html>
