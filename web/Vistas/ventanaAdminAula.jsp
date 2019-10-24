<%-- 
    Document   : ventanaAdminAula
    Created on : 17-oct-2019, 10:01:27
    Author     : daw209
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventana del administrador de aulas</title>
    </head>
    
    <body>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            <input type="submit" name="verVentanaCuadrante" value="Ver cuadrante"/><br><br>
            <input type="submit" name="gestionarAulas" value="Gestionar aulas"/><br><br>
            <input type="submit" name="gestionarFranjHorarias" value="Gestionar franjas horarias"/>

        </form>
        
    </body>
</html>
