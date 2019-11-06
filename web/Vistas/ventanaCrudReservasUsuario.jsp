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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reservas del usuario</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" type="text/css" href="../css/crudReservasUsuario.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
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

        <%

            LinkedList<Reserva> reservas = (LinkedList) session.getAttribute("reservasDelUsuario");

        %>

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
                    <a href="../Vistas/ventanaCrudReservasUsuario.jsp">Ver mis reservas</a>
                    <a href="../Vistas/ventanaDetalles.jsp">Ver detalles aulas y franjas</a>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </header>

        <div id="contenedorPrincipal">
            <div id="tabla">
                <table>
                    <tr>
                        <th>Código aula</th>
                        <th>Código franja</th>
                        <th>Fecha de reserva</th>
                    </tr>

                    <%            for (Reserva paux : reservas) {
                    %>

                    <form name="form2" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="codAulaR" value='<%= paux.getCodAula()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="codFranjaR" value='<%= paux.getCodFranja()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="fechaR" value='<%= paux.getFecha()%>' readonly></td>

                            <td><input type="submit" class="elemento" name="elimReserva" value="Eliminar reserva"></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                </table>
            </div>

        </div>
    </body>
</html>
