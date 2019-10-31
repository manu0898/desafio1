<%-- 
    Document   : registro
    Created on : 17-oct-2019, 10:24:09
    Author     : daw209
--%>

<%@page import="Modelo.Captcha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <script src="../jquery-3.4.1.min.js"></script>
        <script src="../js/registro.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <%
            //Captcha c = (Captcha) session.getAttribute("captcha");
        %>

        <form name="form" enctype="multipart/form-data" action="../Controladores/subefichero.jsp" method="POST">

            Correo <input type="email" class="elemento" id="correoReg" name="correoReg"><br><br>
            Nombre <input type="text" class="elemento" id="nombreReg" name="nombreReg"><br><br>
            Apellido <input type="text" class="elemento" id="apellidoReg" name="apellidoReg"><br><br>
            Edad <input type="number" class="elemento" id="edadReg" name="edadReg" value="0"/><br><br>
            Contraseña <input type="password" class="elemento" id="contraReg" name="contraReg"><br><br>
            Repetir contraseña <input type="password" class="elemento" id="contra2Reg" name="contra2Reg"><br><br>
            Foto <input type="file" class="elemento" id="fichero" name="fichero"/><br><br>

            <input type="submit" class="elemento" id="registrar" name="registrar" value="Aceptar"/>
        </form>

        <form name="form2" action="../Controladores/controlador.jsp" method="POST">
            <br><br><input type="submit" class="elemento" name="volver" value="Volver"/>
        </form>

    </body>
</html>
