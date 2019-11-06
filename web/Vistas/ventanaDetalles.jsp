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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalles</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
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

            LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulasDetalle");
            LinkedList<Franja> franjas = (LinkedList) session.getAttribute("franjasDetalle");

        %>

        <!--
        <div id="menu">
            <nav>
                <ul>
                    <a class="active" href="../Vistas/ventanaProfesor.jsp">Principal</a>
                    <a href="../Vistas/editarPerfil.jsp">Perfil</a>
                    <a href="../Vistas/ventanaCrudReservasUsuario.jsp">Ver mis reservas</a>
                    <a href="../Vistas/ventanaDetalles.jsp">Ver detalles aulas y franjas</a>
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

            Detalle de las aulas:

            <div id="tabla">
                <table>
                    <tr>
                        <th>Código de aula</th>
                        <th>Descripción</th>
                    </tr>

                    <%            for (Aula paux : aulas) {
                    %>

                    <form name="form2" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="codAula" value='<%= paux.getCodAula()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="codFranja" value='<%= paux.getDescripcion()%>' readonly></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                </table>
            </div>

            Detalle de las franjas horarias:

            <div id="tabla2">
                <table>
                    <tr>
                        <th>Código de franja</th>
                        <th>Hora de inicio</th>
                        <th>Hora de fin</th>
                    </tr>

                    <%            for (Franja paux : franjas) {
                    %>

                    <form name="form2" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="codAula" value='<%= paux.getCodFranja()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="codFranja" value='<%= paux.getInicioHora()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="codFranja" value='<%= paux.getFinHora()%>' readonly></td>
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
