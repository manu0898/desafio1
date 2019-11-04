<%-- 
    Document   : prueba
    Created on : 17-oct-2019, 9:44:43
    Author     : daw209
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Reserva"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Modelo.Franja"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventana del profesor</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <script>
            function myFunction() {
                var x = document.getElementById("myLinks");
                if (x.style.display === "block") {
                    x.style.display = "none";
                } else {
                    x.style.display = "block";
                }
            }
        </script>
    </head>

    <body>

        <%

            LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulas");

        %>

        <!--
        <nav>
            <ul>
                <li><a class="active" href="../Vistas/ventanaProfesor.jsp">Principal</a></li>
                <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
            </ul>
        </nav>
        -->
        
        <header id="menu">
            <div class="topnav">
                <a class="active" href="../Vistas/ventanaProfesor.jsp">Principal</a>
                <div id="myLinks">
                    <a href="../Vistas/editarPerfil.jsp">Perfil</a>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </header>

        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            Fecha <input type="date" class="elemento" name="fechaR"><br><br>
            Elige aula 
            <select name="eligeAula" class="elemento">

                <%                    
                    for (Aula paux : aulas) {
                %>

                <option value='<%= paux.getCodAula()%>'><%= paux.getCodAula()%></option>

                <%

                    }

                %>

            </select><br><br>

            <input type="submit" class="elemento" name="verCuadrante" value="Ver cuadrante"><br><br>
            <input type="submit" class="elemento" name="verMisReservas" value="Ver mis reservas"><br><br>

            <br><br><input type="submit" class="elemento" name="cerrarSesion" value="Cerrar sesión"/>
        </form>

    </body>
</html>
