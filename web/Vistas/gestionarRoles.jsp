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
    </head>

    <body>

        <%
            LinkedList<AsignarRol> roles = (LinkedList) session.getAttribute("roles");
        %>
        
        <input type="text" name ="desc" value='Profesor' readonly>
        <input type="text" name ="cod" value='Código de rol' readonly><br><br>

        <%            
            
            for (AsignarRol paux : roles) {

        %>

        <form name="for" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="profRol" value='<%= paux.getProfesor()%>' readonly>
            <input type="number" name ="codRol" value='<%= paux.getCodRol()%>' min="0" max="2">
            
            <input type="submit" name="modifCRUDRol" value="Modificar">
        </form>
            
        <%

            }

        %>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">
            <br><br><input type="submit" name="volverUsuario" value="Volver">
        </form>

    </body>
</html>
