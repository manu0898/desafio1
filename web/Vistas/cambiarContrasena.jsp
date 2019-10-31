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
        <title>Cambio de contraseña</title>
        <meta http-equiv="refresh" content="60; url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>
    
    <body>
        
        <form name="formContra" action="../Controladores/controlador.jsp" method="POST">
            Nueva contraseña: <input type="password" class="elemento" name ="pw" value=''><br><br>
            Repite la contraseña: <input type="password" class="elemento" name ="pw2" value=''><br><br> 
            
            <input type="submit" class="elemento" name="cambiarContraUsu" value="Cambiar"><br><br>
            <input type="submit" class="elemento" name="volverPerfil" value="Volver">
        </form>
        
    </body>
</html>
