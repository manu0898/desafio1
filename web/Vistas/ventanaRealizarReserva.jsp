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

            out.print(session.getAttribute("fechaRes") + "\n");
            out.print(session.getAttribute("aulaRes"));
        %>
        
        
        
        <input type="text" name ="hCom" value='Hora comienzo' readonly>
        <input type="text" name ="hFin" value='Hora final' readonly>
        <input type="text" name ="res" value='Reservado' readonly><br><br>
                
        <%                    
            for (Reserva paux2 : reservas) {
        %>

        <form name="form2" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="hInicio" value='<%= paux2.getHoraInicio()%>' readonly>
            <input type="text" name ="hFin" value='<%= paux2.getHoraFin()%>' readonly>
            <input type="text" name ="reservado" value='<%= paux2.getReservado()%>'>

            <input type="submit" name="modifCRUDFranja" value="Modificar">
        </form>

        <%

            }

        %>

    </body>
</html>
