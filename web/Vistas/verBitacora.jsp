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
        <title>Ver bitácora</title>
        <meta http-equiv="refresh" content="60;url='../index.html'">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
    </head>

    <body>

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

        Contenido del archivo Bitácora<br><br>

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
        <br>
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

    </body>
</html>
