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
        <script src="../jquery-3.4.1.min.js"></script>
        <script src="../js/registro.js"></script>
    </head>

    <body>

        <form name="form" enctype="multipart/form-data" action="../Controladores/subefichero.jsp" method="POST">

            Correo <input type="email" id="correoReg" name="correoReg"><br><br>
            Nombre <input type="text" id="nombreReg" name="nombreReg"><br><br>
            Apellido <input type="text" id="apellidoReg" name="apellidoReg"><br><br>
            Edad <input type="number" id="edadReg" name="edadReg" value="0"/><br><br>
            Contraseña <input type="password" id="contraReg" name="contraReg"><br><br>
            Repetir contraseña <input type="password" id="contra2Reg" name="contra2Reg"><br><br>
            Foto <input type="file" id="fichero" name="fichero"/><br><br>

            <input type="submit" name="registrar" value="Aceptar"/>
        </form>
        
        <form name="form2" action="../Controladores/controlador.jsp" method="POST">
            <input type="submit" name="volver" value="Volver"/>
        </form>

    </body>
</html>
