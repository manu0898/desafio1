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
        <title>Todas las reservas</title>
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <%

            LinkedList<Reserva> reservas = (LinkedList) session.getAttribute("todasReservas");

        %>

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

        <div id="contenedorPrincipal">
            <div id="tabla">
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
                            <td><input type="text" class="elemento" name ="codAulaCru" value='<%= paux.getCodAula()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="codFranjaCru" value='<%= paux.getCodFranja()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="profesorCru" value='<%= paux.getProfesor()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="fechaCru" value='<%= paux.getFecha()%>' readonly></td>
                            
                            <td><input type="submit" class="elemento" name="elimCRUReservas" value="Eliminar"></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>
                </table>
            </div>

            <div id="botones">
                <form name="form" action="../Controladores/controlador.jsp" method="POST">
                    <br><br><input type="submit" class="elemento" name="volverUsuario" value="Volver">
                </form>
            </div>

        </div>
    </body>
</html>
