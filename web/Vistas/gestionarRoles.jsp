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
        <title>Gestión de roles</title>
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <%
            LinkedList<AsignarRol> roles = (LinkedList) session.getAttribute("roles");
        %>

        <div id="menu">
            <nav>
                <ul>
                    <li><a href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                    <li><a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a></li>
                    <li><a href="../Vistas/ventanaVerTodasLasReservas.jsp">Ver reservas</a></li>
                    <li><a href="../Vistas/gestionarUsuarios.jsp">Gestionar usuarios</a></li>
                    <li><a class="active" href="../Vistas/gestionarRoles.jsp">Gestionar roles</a></li>
                    <li><a href="../Vistas/verBitacora.jsp">Ver bitácora</a></li>
                    <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
                </ul>
            </nav>
        </div>

        <div id="contenedorPrincipal">
            <div id="tabla">
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
                            <td><input type="text" class="elemento" name ="profRol" value='<%= paux.getProfesor()%>' readonly></td>
                            <td><input type="number" class="elemento" name ="codRol" value='<%= paux.getCodRol()%>' min="0" max="2"></td>
                            
                            <td><input type="submit" class="elemento" name="modifCRUDRol" value="Modificar"></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                </table>
            </div>

            <div id="botones">
                <form name="form" action="../Controladores/controlador.jsp" method="POST">
                    <input type="submit" class="elemento" name="volverUsuario" value="Volver">
                </form>
            </div>

        </div>
    </body>
</html>
