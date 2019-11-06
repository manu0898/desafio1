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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Realizar Reserva</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/realizarReserva.css">

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

        <!--
        <div id="menu">
            <nav>
                <ul>
                    <li><a class="active" href="../Vistas/ventanaProfesor.jsp">Principal</a></li>
                    <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
                </ul>
            </nav>
        </div>
        -->

        <header id="menu">
            <div class="topnav">
                <a class="active" href="../Vistas/ventanaProfesor.jsp">Principal</a>
                <div id="myLinks">
                    <a href="../Vistas/editarPerfil.jsp">Perfil</a>
                    <a href="../Vistas/ventanaDetalles.jsp">Ver detalles aulas</a>
                    <a href="../Vistas/ventanaDetallesFranjas.jsp">Ver detalles franjas</a>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </header>

        <%

            LinkedList<Reserva> reservas = (LinkedList) session.getAttribute("reservasHoras");

            String fechaReserva = (String) session.getAttribute("fechaRes");
            String aula = String.valueOf(session.getAttribute("aulaRes"));
            int aulaA = Integer.parseInt(aula);

            session.setAttribute("fechaResVentana", fechaReserva);
            session.setAttribute("aulaResVentana", aula);
        %>
        <h3>Fecha: </h3>
        <%
            out.print(fechaReserva);
        %>

        <h3>Aula: </h3>
        <%
            out.print(aulaA);
        %>

        <div id="contenedorPrincipal">
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
                            <td><input type="text" name ="hInicio" value='<%= paux.getHoraInicio()%>' readonly></td>
                            <td><input type="text" name ="hFin" value='<%= paux.getHoraFin()%>' readonly></td>
                            <td><input type="text" name ="reservado" value='<%= paux.getReservado()%>'></td>

                            <td><input type="submit" name="reservarAulaUsu" value="Reservar"></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                </table>
            </div>
            <footer>Manuel Ruiz González, 2ºDAW, CIFP Virgen de Gracia</footer>
        </div>
    </body>
</html>
