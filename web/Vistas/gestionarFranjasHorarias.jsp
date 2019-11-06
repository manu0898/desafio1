<%-- 
    Document   : gestionarFranjasHorarias
    Created on : 18-oct-2019, 12:02:46
    Author     : daw209
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Franja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestionar franjas horarias</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/gestionarFranjas.css">

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

            LinkedList<Franja> franjas = (LinkedList) session.getAttribute("franjas");

        %>

        <!--
        <div id="menu">
            <nav>
                <ul>
                    <li><a href="../Vistas/ventanaAdminAula.jsp">Principal</a></li>
                    <li><a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a></li>
                    <li><a href="../Vistas/gestionarAulas.jsp">Gestionar aulas</a></li>
                    <li><a class="active" href="../Vistas/gestionarFranjasHorarias.jsp">Gestionar franjas horarias</a></li>
                    <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
                </ul>
            </nav>
        </div>
        -->

        <header id="menu">
            <div class="topnav">
                <a class="active" href="../Vistas/ventanaAdminAula.jsp">Principal</a>
                <div id="myLinks">
                    <a href="../Vistas/ventanaRolAdminAula.jsp">Cambiar rol</a>
                    <a href="../Vistas/gestionarAulas.jsp">Gestionar aulas</a>
                    <a href="../Vistas/gestionarFranjasHorarias.jsp">Gestionar franjas horarias</a>
                    <a href="../Vistas/editarPerfil.jsp">Perfil</a>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </header>

        <div id="contenedorPrincipal">
            <div id="tabla">
                <h1>Gestión de franjas</h1>
                <table>
                    <tr>
                        <th>Código franja</th>
                        <th>Hora de inicio</th>
                        <th>Hora de fin</th>
                    </tr>

                    <%                        for (Franja paux : franjas) {
                    %>

                    <form name="for" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" name ="codFranja" value='<%= paux.getCodFranja()%>' readonly></td>
                            <td><input type="text" name ="hInicio" value='<%= paux.getInicioHora()%>'></td>
                            <td><input type="text" name ="hFin" value='<%= paux.getFinHora()%>'></td>

                            <td><input type="submit" name="modifCRUDFranja" value="Modificar"></td> 
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
