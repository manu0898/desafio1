<%-- 
    Document   : ventanaAdminGeneral
    Created on : 17-oct-2019, 10:01:38
    Author     : daw209
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ventana del administrador general</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" type="text/css" href="../css/rolAdminGeneral.css">
    </head>

    <body>

        <div id="contenedorPrincipal">

            <form name="form" action="../Controladores/controlador.jsp" method="POST">

                <h1>Bienvenido, Administrador general</h1>

                <input type="submit" name="gestionarUsuarios" value="Gestionar usuarios"/><br><br>
                <input type="submit" name="gestionarRoles" value="Gestionar roles"/><br><br>
                <input type="submit" name="verReservas" value="Ver reservas"/><br><br>
                <input type="submit" name="verBitacora" value="Ver bitácora"/>

            </form>
            <footer>Manuel Ruiz González, 2ºDAW, CIFP Virgen de Gracia</footer>
        </div>

    </body>
</html>
