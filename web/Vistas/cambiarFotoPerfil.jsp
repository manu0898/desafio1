<%-- 
    Document   : cambiarFotoPerfil
    Created on : 29-oct-2019, 12:48:22
    Author     : daw209
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambio de foto de perfil</title>
    </head>
    
    <body>
        
        <form name="formContra" enctype="multipart/form-data" action="../Controladores/actulizaFoto.jsp" method="POST">
            Foto <input type="file" id="fichero2" name="fichero2"/><br><br><br><br> 
            
            <input type="submit" name="cambiarFotoUsu" value="Cambiar"><br><br>
            <input type="submit" name="volverPerfil" value="Volver">
        </form>
        
    </body>
</html>
