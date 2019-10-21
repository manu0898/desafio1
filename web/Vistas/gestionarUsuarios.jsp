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
    </head>
    
    <body>
        
        <%
            
            LinkedList<Usuario> usuarios = (LinkedList) session.getAttribute("usuarios");

        %>

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
            <br><br><input type="submit" name="volverFranja" value="Volver">
        </form>
        
    </body>
</html>
