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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recuperar contraseña</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" type="text/css" href="../css/recuperarContra.css">
    </head>

    <body>

        <div id="contenedorPrincipal">

            <h1>Recuperar contraseña</h1>

            <form name="formContra" action="../Controladores/controlador.jsp" method="POST">
                Correo <input type="email" name="emailContra" placeholder="correo@correo.com"/><br><br>

                <input type="submit" name="enviarContra" value="Enviar"/>
                <input type="submit" name="volverContra" value="Volver"/>
            </form>
            <footer>Manuel Ruiz González, 2ºDAW, CIFP Virgen de Gracia</footer>
        </div>

    </body>
</html>
