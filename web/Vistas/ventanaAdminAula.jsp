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
        <meta http-equiv="refresh" content="60;url='../index.html'">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>
    
    <body>
        
        Bienvenido, Administrador de aulas<br><br>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            <input type="submit" class="elemento" name="gestionarAulas" value="Gestionar aulas"/><br><br>
            <input type="submit" class="elemento" name="gestionarFranjHorarias" value="Gestionar franjas horarias"/>

        </form>
        
    </body>
</html>
