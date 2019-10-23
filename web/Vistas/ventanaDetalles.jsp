<%-- 
    Document   : ventanaDetalles
    Created on : 23-oct-2019, 13:17:20
    Author     : daw209
--%>

<%@page import="Modelo.Franja"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Aula"%>
<%@page import="Modelo.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles</title>
    </head>
    
    <body>
        
        <%

            LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulasDetalle");
            LinkedList<Franja> franjas = (LinkedList) session.getAttribute("franjasDetalle");
            
        %>

        Detalle de las aulas:<br><br>

        <input type="text" name ="hCom" value='Código de aula' readonly>
        <input type="text" name ="hFin" value='Descripción' readonly><br><br>

        <%
            for (Aula paux : aulas) {
        %>

        <form name="form2" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="codAula" value='<%= paux.getCodAula()%>' readonly>
            <input type="text" name ="codFranja" value='<%= paux.getDescripcion()%>' readonly>
        </form>

        <%

            }

        %>
        
        <br><br>Detalle de las franjas horarias:<br><br>

        <input type="text" name ="hCom" value='Código de franja' readonly>
        <input type="text" name ="hFin" value='Hora de inicio' readonly>
        <input type="text" name ="hFin" value='Hora de fin' readonly><br><br>

        <%
            for (Franja paux : franjas) {
        %>

        <form name="form2" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="codAula" value='<%= paux.getCodFranja()%>' readonly>
            <input type="text" name ="codFranja" value='<%= paux.getInicioHora()%>' readonly>
            <input type="text" name ="codFranja" value='<%= paux.getFinHora()%>' readonly>
        </form>

        <%

            }

        %>

        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            <br><br><input type="submit" name="volverDetalle" value="Volver">

        </form>
        
    </body>
</html>
