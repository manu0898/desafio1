<%-- 
    Document   : ventanaVerTodasLasReservas
    Created on : 28-oct-2019, 13:38:44
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
        <title>Todas las reservas</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/verTodasReservas.css">

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

            LinkedList<Reserva> reservas = (LinkedList) session.getAttribute("todasReservas");

        %>

        <!--
        <div id="menu">
            <nav>
                <ul>
                    <li><a href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                    <li><a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a></li>
                    <li><a class="active" href="../Vistas/ventanaVerTodasLasReservas.jsp">Ver reservas</a></li>
                    <li><a href="../Vistas/gestionarUsuarios.jsp">Gestionar usuarios</a></li>
                    <li><a href="../Vistas/gestionarRoles.jsp">Gestionar roles</a></li>
                    <li><a href="../Vistas/verBitacora.jsp">Ver bitácora</a></li>
                    <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
                </ul>
            </nav>
        </div>
        -->

        <header id="menu">
            <div class="topnav">
                <a class="active" href="../Vistas/ventanaAdminGeneral.jsp">Principal</a>
                <div id="myLinks">
                    <a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a>
                    <a href="../Vistas/ventanaVerTodasLasReservas.jsp">Ver reservas</a>
                    <a href="../Vistas/gestionarUsuarios.jsp">Gestionar usuarios</a>
                    <a href="../Vistas/gestionarRoles.jsp">Gestionar roles</a>
                    <a href="../Vistas/verBitacora.jsp">Ver bitácora</a>
                    <a href="../Vistas/editarPerfil.jsp">Perfil</a>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </header>

        <div id="contenedorPrincipal">

            <div id="tabla">
                <h1>Lista de reservas</h1>
                <table>
                    <tr>
                        <th>Cod Aula</th>
                        <th>Cod Franja</th>
                        <th>Profesor</th>
                        <th>Fecha</th>
                    </tr>

                    <%            for (Reserva paux : reservas) {
                    %>

                    <form name="for" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" name ="codAulaCru" value='<%= paux.getCodAula()%>' readonly></td>
                            <td><input type="text" name ="codFranjaCru" value='<%= paux.getCodFranja()%>' readonly></td>
                            <td><input type="text" name ="profesorCru" value='<%= paux.getProfesor()%>' readonly></td>
                            <td><input type="text" name ="fechaCru" value='<%= paux.getFecha()%>' readonly></td>

                            <td><input type="submit" name="elimCRUReservas" value="Eliminar"></td>
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
