<%-- 
    Document   : editarPerfil
    Created on : 25-oct-2019, 8:57:52
    Author     : daw209
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <%

            Usuario u = (Usuario) session.getAttribute("usuarioLogueado");
            String rol = (String) session.getAttribute("rolIniciaSesion");

            if (rol.equals("AdminGeneral")) {
        %>
        <nav>
            <ul>
                <li><a href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                <li><a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a></li>
                <li><a href="../Vistas/ventanaVerTodasLasReservas.jsp">Ver reservas</a></li>
                <li><a href="../Vistas/gestionarUsuarios.jsp">Gestionar usuarios</a></li>
                <li><a href="../Vistas/gestionarRoles.jsp">Gestionar roles</a></li>
                <li><a href="../Vistas/verBitacora.jsp">Ver bitácora</a></li>
                <li><a class="active" href="../Vistas/editarPerfil.jsp">Perfil</a></li>
            </ul>
        </nav>
        <%
        } else {
            if (rol.equals("AdminAula")) {
        %>
        <nav>
            <ul>
                <li><a href="../Vistas/ventanaAdminAula.jsp">Principal</a></li>
                <li><a href="../Vistas/ventanaRolAdminAula.jsp">Cambiar rol</a></li>
                <li><a href="../Vistas/gestionarAulas.jsp">Gestionar aulas</a></li>
                <li><a href="../Vistas/gestionarFranjasHorarias.jsp">Gestionar franjas horarias</a></li>
                <li><a class="active" href="../Vistas/editarPerfil.jsp">Perfil</a></li>
            </ul>
        </nav>
        <%
        } else {
            if (rol.equals("Profesor")) {
        %>
        <nav>
            <ul>
                <li><a href="../Vistas/ventanaProfesor.jsp">Principal</a></li>
                <li><a class="active" href="../Vistas/editarPerfil.jsp">Perfil</a></li>
            </ul>
        </nav>
        <%
                    }
                }
            }

        %>
        
        Nombre: <%= u.getNombre()%><br><br>
        Apellido: <%= u.getApellido()%><br><br>
        Correo: <%= u.getCorreo()%><br><br>
        Edad: <%= u.getEdad()%> años<br><br>
        Foto: <img src='<%=u.getFotoimgString() %>' alt='Foto de perfil no encontrada' name ="ft"><br><br>
        
        <form name="formContra" action="../Controladores/controlador.jsp" method="POST">
            <input type="submit" class="elemento" name="cambiarContra" value="Cambiar contraseña"><br><br>
            <input type="submit" class="elemento" name="cambiarFoto" value="Cambiar foto">
        </form>

    </body>
</html>
