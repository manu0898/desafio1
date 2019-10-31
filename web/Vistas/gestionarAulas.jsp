<%-- 
    Document   : administrarAulas
    Created on : 18-oct-2019, 12:01:19
    Author     : daw209
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Aula"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar aulas</title>
        <meta http-equiv="refresh" content="60;url='../index.html'">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <%

            LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulas");

        %>

        <div id="menu">
            <nav>
                <ul>
                    <li><a href="../Vistas/ventanaAdminAula.jsp">Principal</a></li>
                    <li><a href="../Vistas/ventanaRolAdminAula.jsp">Cambiar rol</a></li>
                    <li><a class="active" href="../Vistas/gestionarAulas.jsp">Gestionar aulas</a></li>
                    <li><a href="../Vistas/gestionarFranjasHorarias.jsp">Gestionar franjas horarias</a></li>
                    <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
                </ul>
            </nav>
        </div>

        <div id="contenedorPrincipal">
            <div id="tabla">
                <table>
                    <tr>
                        <th>Código de aula</th>
                        <th>Descripción</th>
                    </tr>

                    <%                        for (Aula paux : aulas) {
                    %>

                    <form name="for" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="codAula" value='<%= paux.getCodAula()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="descripcion" value='<%= paux.getDescripcion()%>'></td>

                            <td><input type="submit" class="elemento" name="elimCRUDAula" value="Eliminar"></td>
                            <td><input type="submit" class="elemento" name="modifCRUDAula" value="Modificar"></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                    <form name="form" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="codAulaAdd" value=""></td>
                            <td><input type="text" class="elemento" name ="descripcionAdd" value=""></td>
                            <td><input type="submit" class="elemento" name="crearAula" value="Añadir"></td>
                        </tr>

                    </form>
                </table>

                <div id="botones">
                    <form name="form2" action="../Controladores/controlador.jsp" method="POST">
                        <input type="submit" class="elemento" name="volverAula" value="Volver">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
