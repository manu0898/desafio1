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
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
    </head>
    
    <body>
        
        <%
            
            LinkedList<Usuario> usuarios = (LinkedList) session.getAttribute("usuarios");

        %>
        
        <nav>
            <ul>
                <li><a class="active" href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                <li><a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a></li>
                <li><a href="">Ver reservas</a></li>
                <li><a href="../Vistas/gestionarUsuarios.jsp">Gestionar usuarios</a></li>
                <li><a href="../Vistas/gestionarRoles.jsp">Gestionar roles</a></li>
                <li><a href="../Vistas/verBitacora.jsp">Ver bitácora</a></li>
                <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
            </ul>
        </nav>

        <input type="text" name ="correo" value='Correo' readonly>
        <input type="text" name ="nombre" value='Nombre' readonly>
        <input type="text" name ="apellido" value='Apellido' readonly>
        <input type="text" name ="edad" value='Edad' readonly><br><br>

        <%            
            
            for (Usuario paux : usuarios) {

        %>

        <form name="for" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="correoCrud" value='<%= paux.getCorreo()%>' readonly>
            <input type="text" name ="nombreCrud" value='<%= paux.getNombre()%>'>
            <input type="text" name ="apellidoCrud" value='<%= paux.getApellido()%>'>
            <input type="number" name ="edadCrud" value='<%= paux.getEdad()%>'>

            <input type="submit" name="modifCRUDUsuarios" value="Modificar">
            <input type="submit" name="elimCRUDUsuarios" value="Eliminar">
        </form>
            
        <%

            }

        %>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">
            <br><br><input type="submit" name="anadirUsuario" value="Añadir usuario">
            <br><br><input type="submit" name="volverUsuario" value="Volver">
        </form>
        
    </body>
</html>
