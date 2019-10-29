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
    </head>
    
    <body>
        
        <form name="formContra" action="../Controladores/controlador.jsp" method="POST">
            Nueva contraseña: <input type="password" name ="pw" value=''><br><br>
            Repite la contraseña: <input type="password" name ="pw2" value=''><br><br> 
            
            <input type="submit" name="cambiarContraUsu" value="Cambiar"><br><br>
            <input type="submit" name="volverPerfil" value="Volver">
        </form>
        
    </body>
</html>
