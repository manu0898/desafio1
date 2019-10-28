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
        
        Bienvenido, Administrador general<br><br>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">
            
            <input type="submit" name="gestionarUsuarios" value="Gestionar usuarios"/><br><br>
            <input type="submit" name="gestionarRoles" value="Gestionar roles"/><br><br>
            <input type="submit" name="verBitacora" value="Ver bitácora"/>

        </form>
        
    </body>
</html>
