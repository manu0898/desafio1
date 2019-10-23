<%-- 
    Document   : ventanaRealizarReserva
    Created on : 22-oct-2019, 10:44:00
    Author     : daw209
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar Reserva</title>
    </head>

    <body>

        <%

            LinkedList<Reserva> reservas = (LinkedList) session.getAttribute("reservasHoras");
            
            String fechaReserva = (String) session.getAttribute("fechaRes");
            String aula = String.valueOf(session.getAttribute("aulaRes"));
            int aulaA = Integer.parseInt(aula);
            
            session.setAttribute("fechaResVentana", fechaReserva);
            session.setAttribute("aulaResVentana", aula);
            
            out.print(fechaReserva);
        %>
        <br>
        <%
            out.print(aulaA);
        %>

        <br><br>

        <input type="text" name ="hCom" value='Hora comienzo' readonly>
        <input type="text" name ="hFin" value='Hora final' readonly>
        <input type="text" name ="res" value='Estado' readonly><br><br>

        <%
            for (Reserva paux : reservas) {
        %>

        <form name="form2" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="hInicio" value='<%= paux.getHoraInicio()%>' readonly>
            <input type="text" name ="hFin" value='<%= paux.getHoraFin()%>' readonly>
            <input type="text" name ="reservado" value='<%= paux.getReservado()%>'>

            <input type="submit" name="reservarAulaUsu" value="Reservar">
        </form>

        <%

            }

        %>

        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            <br><br><input type="submit" name="volverReserva" value="Volver">

        </form>

    </body>
</html>
