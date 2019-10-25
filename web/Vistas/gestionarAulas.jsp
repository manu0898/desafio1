<%-- 
    Document   : administrarAulas
    Created on : 18-oct-2019, 12:01:19
    Author     : daw209
--%>

<%@page import="Modelo.Aula"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar aulas</title>
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
    </head>

    <body>

        <nav>
            <ul>
                <li><a class="active" href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                <li><a href="">Ver reservas</a></li>
                <li><a href="">Gestionar aulas</a></li>
                <li><a href="">Gestionar franjas horarias</a></li>
                <li><a href="">Gestionar usuarios</a></li>
                <li><a href="">Gestionar roles</a></li>
                <li><a href="">Ver bitácora</a></li>
                <li><a href="#">Perfil</a></li>
                <li><a href="#">Cerrar sesión</a></li>
            </ul>
        </nav>
        

    <%

        LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulas");

    %>
    <div id="contenedorPrincipal">

        <input type="text" name ="codigoAula" value='Código de aula' readonly>
        <input type="text" name ="descAula" value='Descripción' readonly><br><br>

        <%                for (Aula paux : aulas) {
        %>

        <form name="for" action="../Controladores/controlador.jsp" method="POST">
            <input type="text" name ="codAula" value='<%= paux.getCodAula()%>' readonly>
            <input type="text" name ="descripcion" value='<%= paux.getDescripcion()%>'>

            <input type="submit" name="elimCRUDAula" value="Eliminar">
            <input type="submit" name="modifCRUDAula" value="Modificar">
        </form>

        <%

            }

        %>

        <div>

            <form name="form" action="../Controladores/controlador.jsp" method="POST">
                <br><input type="text" name ="codAulaAdd" value="">
                <input type="text" name ="descripcionAdd" value="">
                <input type="submit" name="crearAula" value="Añadir">

                <br><br><input type="submit" name="volverAula" value="Volver">
            </form>

        </div>
    </div>
</body>
</html>
