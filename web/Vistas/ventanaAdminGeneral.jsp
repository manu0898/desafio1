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
        <title>Ventana del administrador general</title>
        <meta http-equiv="refresh" content="60;url='../index.html'">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>
    
    <body>
        
        Bienvenido, Administrador general<br><br>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">
            
            <input type="submit" class="elemento" name="gestionarUsuarios" value="Gestionar usuarios"/><br><br>
            <input type="submit" class="elemento" name="gestionarRoles" value="Gestionar roles"/><br><br>
            <input type="submit" class="elemento" name="verReservas" value="Ver reservas"/><br><br>
            <input type="submit" class="elemento" name="verBitacora" value="Ver bitácora"/>

        </form>
        
    </body>
</html>
