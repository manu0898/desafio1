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
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <div id="menu">
            <nav>
                <ul>
                    <li><a class="active" href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                    <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
                </ul>
            </nav>
        </div>

        <div id="contenedorPrincipal">
            <%

                LinkedList<Reserva> reservas = (LinkedList) session.getAttribute("reservasHoras");

                String fechaReserva = (String) session.getAttribute("fechaRes");
                String aula = String.valueOf(session.getAttribute("aulaRes"));
                int aulaA = Integer.parseInt(aula);

                session.setAttribute("fechaResVentana", fechaReserva);
                session.setAttribute("aulaResVentana", aula);
            %>
            Fecha: 
            <%
                out.print(fechaReserva);
            %>
            <br>
            Aula:
            <%
                out.print(aulaA);
            %>

            <div id="tabla">
                <table>
                    <tr>
                        <th>Hora comienzo</th>
                        <th>Hora final</th>
                        <th>Estado</th>
                    </tr>

                    <%
                        for (Reserva paux : reservas) {
                    %>

                    <form name="form2" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="hInicio" value='<%= paux.getHoraInicio()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="hFin" value='<%= paux.getHoraFin()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="reservado" value='<%= paux.getReservado()%>'></td>

                            <td><input type="submit" class="elemento" name="reservarAulaUsu" value="Reservar"></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                </table>
            </div>

            <div id="botones">
                <form name="form" action="../Controladores/controlador.jsp" method="POST">
                    <input type="submit" class="elemento" name="volverReserva" value="Volver">
                </form>
            </div>

        </div>
    </body>
</html>
