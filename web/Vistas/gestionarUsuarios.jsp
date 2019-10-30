<%-- 
    Document   : gestionarUsuarios
    Created on : 18-oct-2019, 13:21:40
    Author     : daw209
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar usuarios</title>
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <%

            LinkedList<Usuario> usuarios = (LinkedList) session.getAttribute("usuarios");

        %>

        <div id="menu">
            <nav>
                <ul>
                    <li><a href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                    <li><a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a></li>
                    <li><a href="../Vistas/ventanaVerTodasLasReservas.jsp">Ver reservas</a></li>
                    <li><a class="active" href="../Vistas/gestionarUsuarios.jsp">Gestionar usuarios</a></li>
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
                        <th>Correo</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Edad</th>
                    </tr>

                    <%            for (Usuario paux : usuarios) {

                    %>

                    <form name="for" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="correoCrud" value='<%= paux.getCorreo()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="nombreCrud" value='<%= paux.getNombre()%>'></td>
                            <td><input type="text" class="elemento" name ="apellidoCrud" value='<%= paux.getApellido()%>'></td>
                            <td><input type="number" class="elemento" name ="edadCrud" value='<%= paux.getEdad()%>'></td>

                            <td><input type="submit" class="elemento" name="modifCRUDUsuarios" value="Modificar"></td>
                            <td><input type="submit" class="elemento" name="elimCRUDUsuarios" value="Eliminar"></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                </table>
            </div>

            <div id="botones">
                <form name="form" action="../Controladores/controlador.jsp" method="POST">
                    <input type="submit" class="elemento" name="anadirUsuario" value="Añadir usuario">
                    <input type="submit" class="elemento" name="volverUsuario" value="Volver">
                </form>
            </div>
        </div>

    </body>
</html>
