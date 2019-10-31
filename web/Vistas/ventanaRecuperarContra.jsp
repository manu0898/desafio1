<%-- 
    Document   : ventanaRecuperarContra
    Created on : 23-oct-2019, 9:04:24
    Author     : daw209
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Fecha"%>
<%@page import="Modelo.Franja"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar contraseña</title>
        <meta http-equiv="refresh" content="60;url='../index.html'">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <form name="formContra" action="../Controladores/controlador.jsp" method="POST">
            Correo: <input type="email" class="elemento" name="emailContra"/><br><br>

            <input type="submit" class="elemento" name="enviarContra" value="Enviar"/>
            <input type="submit" class="elemento" name="volverContra" value="Volver"/>
        </form>

    </body>
</html>
