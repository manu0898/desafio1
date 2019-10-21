<%-- 
    Document   : prueba
    Created on : 17-oct-2019, 9:44:43
    Author     : daw209
--%>

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
    </head>

    <body>

        <%

            LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulas");
            LinkedList<Franja> franjas = (LinkedList) session.getAttribute("franjas");
            
        %>

        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            Fecha <input type="date" name="fechaR"><br><br>
            Elige aula 
            <select name="eligeAula">

                <%                    
                    for (Aula paux : aulas) {
                %>

                <option value='<%= paux.getCodAula()%>'><%= paux.getCodAula()%></option>

                <%

                    }

                %>

            </select><br><br>

            <input type="submit" name="verCuadrante" value="Ver cuadrante"><br><br>
        </form>

        <input type="text" name ="hCom" value='Hora comienzo' readonly>
        <input type="text" name ="hFin" value='Hora final' readonly>
        <input type="text" name ="res" value='Reservado' readonly><br><br>
                
        <%                    
            for (Franja paux2 : franjas) {
        %>

        <form name="form2" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="codFranja" value='<%= paux2.getCodFranja()%>' readonly>
            <input type="text" name ="hInicio" value='<%= paux2.getInicioHora()%>'>
            <input type="text" name ="hFin" value='<%= paux2.getFinHora()%>'>

            <input type="submit" name="modifCRUDFranja" value="Modificar">
        </form>

        <%

            }

        %>

        <form name="form3" action="../Controladores/controlador.jsp" method="POST">
            <input type="submit" name="volver" value="Volver"/>
            <input type="submit" name="cerrarSesion" value="Cerrar sesión"/>
        </form>

    </body>
</html>
