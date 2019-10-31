<%-- 
    Document   : ventanaDetalles
    Created on : 23-oct-2019, 13:17:20
    Author     : daw209
--%>

<%@page import="Modelo.Franja"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Aula"%>
<%@page import="Modelo.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles</title>
        <meta http-equiv="refresh" content="60;url=../index.html">
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <%

            LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulasDetalle");
            LinkedList<Franja> franjas = (LinkedList) session.getAttribute("franjasDetalle");

        %>

        <div id="menu">
            <nav>
                <ul>
                    <li><a class="active" href="../Vistas/ventanaAdminGeneral.jsp">Principal</a></li>
                    <li><a href="../Vistas/editarPerfil.jsp">Perfil</a></li>
                </ul>
            </nav>
        </div>

        <div id="contenedorPrincipal">

            Detalle de las aulas:

            <div id="tabla">
                <table>
                    <tr>
                        <th>Código de aula</th>
                        <th>Descripción</th>
                    </tr>

                    <%            for (Aula paux : aulas) {
                    %>

                    <form name="form2" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="codAula" value='<%= paux.getCodAula()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="codFranja" value='<%= paux.getDescripcion()%>' readonly></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                </table>
            </div>

            Detalle de las franjas horarias:

            <div id="tabla2">
                <table>
                    <tr>
                        <th>Código de franja</th>
                        <th>Hora de inicio</th>
                        <th>Hora de fin</th>
                    </tr>

                    <%            for (Franja paux : franjas) {
                    %>

                    <form name="form2" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="codAula" value='<%= paux.getCodFranja()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="codFranja" value='<%= paux.getInicioHora()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="codFranja" value='<%= paux.getFinHora()%>' readonly></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                </table>
            </div>

            <div id="botones">
                <form name="form" action="../Controladores/controlador.jsp" method="POST">
                    <input type="submit" class="elemento" name="volverDetalle" value="Volver">
                </form>
            </div>

        </div>
    </body>
</html>
