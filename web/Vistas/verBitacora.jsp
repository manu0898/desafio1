<%-- 
    Document   : verBitacora
    Created on : 18-oct-2019, 13:20:57
    Author     : daw209
--%>

<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="Auxiliar.Constantes"%>
<%@page import="Auxiliar.Bitacora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver bitácora</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/bitacora.css">

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

        <!--
        <nav>
            <ul>
                <li><a href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                <li><a href="../Vistas/ventanaRolAdminGeneral.jsp">Cambiar rol</a></li>
                <li><a href="../Vistas/ventanaVerTodasLasReservas.jsp">Ver reservas</a></li>
                <li><a href="../Vistas/gestionarUsuarios.jsp">Gestionar usuarios</a></li>
                <li><a href="../Vistas/gestionarRoles.jsp">Gestionar roles</a></li>
                <li><a class="active" href="../Vistas/verBitacora.jsp">Ver bitácora</a></li>
                <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
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

        <div id="contenedorPrincipal">

            <h1>Contenido del archivo Bitácora</h1>

            <%
                //String texto;
                //Bitacora b = new Bitacora();
                //texto = b.LeerFichero(Constantes.rutaBitacora);
                //out.print(texto);

                File archivo = null;
                FileReader fr = null;
                BufferedReader br = null;

                try {
                    archivo = new File(Constantes.rutaBitacora);
                    fr = new FileReader(archivo);
                    br = new BufferedReader(fr);

                    String linea;
                    while ((linea = br.readLine()) != null) {
                        out.print(linea);
            %>
            <br><br>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (null != fr) {
                            fr.close();
                        }
                    } catch (Exception e2) {
                        e2.printStackTrace();
                    }
                }
            %>
            <footer>Manuel Ruiz González, 2ºDAW, CIFP Virgen de Gracia</footer>
        </div>
    </body>
</html>
