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
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>
    
    <body>
        
        <form name="formContra" enctype="multipart/form-data" action="../Controladores/actulizaFoto.jsp" method="POST">
            Foto <input type="file" class="elemento" id="fichero2" name="fichero2"/><br><br><br><br> 
            
            <input type="submit" class="elemento" name="cambiarFotoUsu" value="Cambiar"><br><br>
        </form>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">
            <input type="submit" class="elemento" name="volverPerfil" value="Volver">
        </form>
        
    </body>
</html>
