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
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
    </head>

    <body>

        <%

            LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulas");

        %>

        <nav>
            <ul>
                <li><a class="active" href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
            </ul>
        </nav>

        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            Fecha <input type="date" name="fechaR"><br><br>
            Elige aula 
            <select name="eligeAula">

                <%                    for (Aula paux : aulas) {
                %>

                <option value='<%= paux.getCodAula()%>'><%= paux.getCodAula()%></option>

                <%

                    }

                %>

            </select><br><br>

            <input type="submit" name="verCuadrante" value="Ver cuadrante"><br><br>
            <input type="submit" name="verMisReservas" value="Ver mis reservas"><br><br>

            <br><br><input type="submit" name="volver" value="Volver"/>
            <input type="submit" name="cerrarSesion" value="Cerrar sesión"/>
        </form>

    </body>
</html>
