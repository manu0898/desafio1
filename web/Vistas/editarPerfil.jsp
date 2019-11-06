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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/editarPerfil.css">

        <script>
            function myFunction() {
                var x = document.getElementById("myLinks");
                if (x.style.display === "block") {
                    x.style.display = "none";
                } else {
                    x.style.display = "block";
                }
            }
        </script>
    </head>

    <body>

        <%

            Usuario u = (Usuario) session.getAttribute("usuarioLogueado");
            String rol = (String) session.getAttribute("rolIniciaSesion");

            if (rol.equals("AdminGeneral")) {
        %>
        <!--
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
        -->

        <header id="menu">
            <div class="topnav">
                <a class="active" href="../Vistas/ventanaAdminGeneral.jsp">Principal</a>
                <div id="myLinks">
                    <a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a>
                    <a href="../Vistas/ventanaVerTodasLasReservas.jsp">Ver reservas</a>
                    <a href="../Vistas/gestionarUsuarios.jsp">Gestionar usuarios</a>
                    <a href="../Vistas/gestionarRoles.jsp">Gestionar roles</a>
                    <a href="../Vistas/verBitacora.jsp">Ver bitácora</a>
                    <a href="../Vistas/editarPerfil.jsp">Perfil</a>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </header>

        <%
        } else {
            if (rol.equals("AdminAula")) {
        %>
        <!--
        <nav>
            <ul>
                <li><a href="../Vistas/ventanaAdminAula.jsp">Principal</a></li>
                <li><a href="../Vistas/ventanaRolAdminAula.jsp">Cambiar rol</a></li>
                <li><a href="../Vistas/gestionarAulas.jsp">Gestionar aulas</a></li>
                <li><a href="../Vistas/gestionarFranjasHorarias.jsp">Gestionar franjas horarias</a></li>
                <li><a class="active" href="../Vistas/editarPerfil.jsp">Perfil</a></li>
            </ul>
        </nav>
        -->
        <header id="menu">
            <div class="topnav">
                <a class="active" href="../Vistas/ventanaAdminAula.jsp">Principal</a>
                <div id="myLinks">
                    <a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a>
                    <a href="../Vistas/gestionarAulas.jsp">Gestionar aulas</a>
                    <a href="../Vistas/gestionarFranjasHorarias.jsp">Gestionar franjas horarias</a>
                    <a href="../Vistas/editarPerfil.jsp">Perfil</a>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </header>
        <%
        } else {
            if (rol.equals("Profesor")) {
        %>
        <!--
        <nav>
            <ul>
                <li><a href="../Vistas/ventanaProfesor.jsp">Principal</a></li>
                <li><a class="active" href="../Vistas/editarPerfil.jsp">Perfil</a></li>
            </ul>
        </nav>
        -->
        <header id="menu">
            <div class="topnav">
                <a class="active" href="../Vistas/ventanaProfesor.jsp">Principal</a>
                <div id="myLinks">
                    <a href="../Vistas/editarPerfil.jsp">Perfil</a>
                    <a href="../Vistas/ventanaCrudReservasUsuario.jsp">Ver mis reservas</a>
                    <a href="../Vistas/ventanaDetalles.jsp">Ver detalles aulas</a>
                    <a href="../Vistas/ventanaDetallesFranjas.jsp">Ver detalles franjas</a>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </header>
        <%
                    }
                }
            }

        %>

        <div id="contenedorPrincipal">

            <form name="formContra" action="../Controladores/controlador.jsp" method="POST">

                <h1>Tu perfil</h1>
                
                <h3>Nombre:</h3>
                <%= u.getNombre()%>
                
                <h3>Apellido:</h3>
                <%= u.getApellido()%>
                
                <h3>Correo:</h3>
                <%= u.getCorreo()%>
                
                <h3>Edad:</h3>
                <%= u.getEdad()%> años
                
                <h3>Foto:</h3>
                <img src='<%=u.getFotoimgString()%>' alt='Foto de perfil no encontrada' name ="ft"><br><br>

                <input type="submit" name="cambiarContra" value="Cambiar contraseña"><br><br>
                <input type="submit" name="cambiarFoto" value="Cambiar foto">
            </form>
        </div>
    </body>
</html>
