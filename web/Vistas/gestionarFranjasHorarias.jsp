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
        <title>Gestionar franjas horarias</title>
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
    </head>
    
    <body>
        
        <%
            
            LinkedList<Franja> franjas = (LinkedList) session.getAttribute("franjas");
            
        %>
        <nav>
            <ul>
                <li><a href="../Vistas/ventanaAdminAula.jsp">Principal</a></li>
                <li><a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a></li>
                <li><a href="../Vistas/gestionarAulas.jsp">Gestionar aulas</a></li>
                <li><a class="active" href="../Vistas/gestionarFranjasHorarias.jsp">Gestionar franjas horarias</a></li>
                <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
            </ul>
        </nav>

        <input type="text" name ="codigoFranja" value='Codigo franja' readonly>
        <input type="text" name ="horaInicio" value='Hora de inicio' readonly>
        <input type="text" name ="horaFin" value='Hora de fin' readonly><br><br>

        <%            
            
            for (Franja paux : franjas) {

        %>

        <form name="for" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="codFranja" value='<%= paux.getCodFranja()%>' readonly>
            <input type="text" name ="hInicio" value='<%= paux.getInicioHora()%>'>
            <input type="text" name ="hFin" value='<%= paux.getFinHora()%>'>

            <input type="submit" name="modifCRUDFranja" value="Modificar">
        </form>
            
        <%

            }

        %>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">
            <br><br><input type="submit" name="volverFranja" value="Volver">
        </form>
        
    </body>
</html>
