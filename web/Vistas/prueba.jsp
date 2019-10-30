<%-- 
    Document   : prueba
    Created on : 30-oct-2019, 13:10:59
    Author     : daw209
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Franja"%>
<%@page import="Modelo.Fecha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            LinkedList<Fecha> fechas = (LinkedList) session.getAttribute("fechasPrueba");
            LinkedList<Franja> franjas = (LinkedList) session.getAttribute("franjasPrueba");
            int codAula = 100;
            String reservado = "Reservado";

            for (Fecha paux2 : fechas) {
                for (Franja paux : franjas) {
                    //out.print(paux.getCodFranja() + "--------");
                    //out.print(paux2.getFecha());
                    
                    ConexionEstatica.nueva();
                    ConexionEstatica c = new ConexionEstatica();
                    
                    out.print(codAula + " " + paux.getCodFranja() + " " + reservado + " " + paux2.getFecha());
                    //c.Insertar_Aula_Nueva_Tabla_Reservas(codAula, paux.getCodFranja(), reservado, paux2.getFecha());
                    
                    ConexionEstatica.cerrarBD();
        %>
        <br>
        <%
            }

        %>
        <br>
        <%            }

        %>

    </body>
</html>
