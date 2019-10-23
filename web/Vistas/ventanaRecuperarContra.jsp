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
    </head>

    <body>

        <%

            LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulasParaReserva");
            LinkedList<Franja> franjas = (LinkedList) session.getAttribute("franjasParaReserva");
            LinkedList<Fecha> fechas = (LinkedList) session.getAttribute("fechasParaReserva");

            out.print("Aulas: ");
            out.print(aulas);
            out.print("\nFranjas: ");
            out.print(franjas);
            out.print("\nFechas: ");
            out.print(fechas);

            for (Aula paux : aulas) {
                for (Franja paux2 : franjas) {
                    for (Fecha paux3 : fechas) {

                        ConexionEstatica.nueva();
                        ConexionEstatica con = new ConexionEstatica();

                        con.Insertar_Aula_Reservas(paux.getCodAula(), paux2.getCodFranja(), "", "Libre", paux3.getFecha());

                        ConexionEstatica.cerrarBD();

                    }
                }

            }

        %>

    </body>
</html>
