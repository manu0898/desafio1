<%-- 
    Document   : ventanaCrudReservasUsuario
    Created on : 23-oct-2019, 13:00:03
    Author     : daw209
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservas del usuario</title>
    </head>
    
    <body>
        
        <%

            LinkedList<Reserva> reservas = (LinkedList) session.getAttribute("reservasDelUsuario");
            
        %>

        <br><br>

        <input type="text" name ="hCom" value='Código de aula' readonly>
        <input type="text" name ="hFin" value='Código de franja' readonly>
        <input type="text" name ="res" value='Fecha de la reserva' readonly><br><br>

        <%
            for (Reserva paux : reservas) {
        %>

        <form name="form2" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="codAula" value='<%= paux.getCodAula()%>' readonly>
            <input type="text" name ="codFranja" value='<%= paux.getCodFranja()%>' readonly>
            <input type="text" name ="fecha" value='<%= paux.getFecha()%>' readonly>
        </form>

        <%

            }

        %>

        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            <br><br><input type="submit" name="mostrarDetalles" value="Mostrar detalles">
            <br><br><input type="submit" name="volverReserva" value="Volver">

        </form>
        
    </body>
</html>
