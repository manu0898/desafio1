<%-- 
    Document   : gestionarRoles
    Created on : 24-oct-2019, 13:01:51
    Author     : daw209
--%>

<%@page import="Modelo.AsignarRol"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Rol"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de roles</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/gestionarRoles.css">

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
            LinkedList<AsignarRol> roles = (LinkedList) session.getAttribute("roles");
        %>

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
                <h1>Gestión de roles</h1>
                <table>
                    <tr>
                        <th>Profesor</th>
                        <th>Código de rol</th>
                    </tr>

                    <%
                        for (AsignarRol paux : roles) {

                    %>

                    <form name="for" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" name ="profRol" value='<%= paux.getProfesor()%>' readonly></td>
                            <td><input type="number" name ="codRol" value='<%= paux.getCodRol()%>' min="0" max="2"></td>

                            <td><input type="submit" name="modifCRUDRol" value="Modificar"></td>
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
