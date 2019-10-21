<%-- 
    Document   : registro
    Created on : 17-oct-2019, 10:24:09
    Author     : daw209
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    
    <body>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            Correo <input type="email" name="correoReg"><br><br>
            Nombre <input type="text" name="nombreReg"><br><br>
            Apellido <input type="text" name="apellidoReg"><br><br>
            Edad <input type="number" name="edadReg" value="0"/><br><br>
            Contraseña <input type="password" name="contraReg"><br><br>
            Repetir contraseña <input type="password" name="contra2Reg"><br><br>
            Foto <input type="text" name="fotoReg" readonly><br><br>

            <input type="submit" name="registrar" value="Aceptar"/>
            <input type="submit" name="volver" value="Volver"/>

        </form>
        
    </body>
</html>
