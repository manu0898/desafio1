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
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
    </head>

    <body>

        <%

            LinkedList<Reserva> reservas = (LinkedList) session.getAttribute("todasReservas");

        %>

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

        <input type="text" name ="codAula" value='Cod Aula' readonly>
        <input type="text" name ="codFranja" value='Cod Franja' readonly>
        <input type="text" name ="prof" value='Profesor' readonly>
        <input type="text" name ="fecha" value='Fecha' readonly><br><br>

        <%            
            for (Reserva paux : reservas) {
        %>

        <form name="for" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="codAulaCru" value='<%= paux.getCodAula()%>' readonly>
            <input type="text" name ="codFranjaCru" value='<%= paux.getCodFranja()%>' readonly>
            <input type="text" name ="profesorCru" value='<%= paux.getProfesor()%>' readonly>
            <input type="text" name ="fechaCru" value='<%= paux.getFecha()%>' readonly>

            <input type="submit" name="elimCRUReservas" value="Eliminar">
        </form>

        <%

            }

        %>

        <form name="form" action="../Controladores/controlador.jsp" method="POST">
            <br><br><input type="submit" name="volverUsuario" value="Volver">
        </form>

    </body>
</html>
