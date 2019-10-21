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
    </head>
    
    <body>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            <input type="submit" name="verCuadrante" value="Ver cuadrante"/><br><br>
            <input type="submit" name="gestionarAulas" value="Gestionar aulas"/><br><br>
            <input type="submit" name="gestionarFranjHorarias" value="Gestionar franjas horarias"/><br><br>
            <input type="submit" name="gestionarUsuarios" value="Gestionar usuarios"/><br><br>
            <input type="submit" name="verBitacora" value="Ver bitácora"/>

        </form>
        
    </body>
</html>
