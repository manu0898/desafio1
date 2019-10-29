<%-- 
    Document   : ventanaCrudReservasUsuario
    Created on : 23-oct-2019, 13:00:03
    Author     : daw209
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservas del usuario</title>
        <link rel="stylesheet" type="text/css" href="../css/micss.css">
        <link rel="stylesheet" type="text/css" href="../css/menu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablas.css">
    </head>

    <body>

        <%

            LinkedList<Reserva> reservas = (LinkedList) session.getAttribute("reservasDelUsuario");

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
            <div id="tabla">
                <table>
                    <tr>
                        <th>Código aula</th>
                        <th>Código franja</th>
                        <th>Fecha de reserva</th>
                    </tr>

                    <%            for (Reserva paux : reservas) {
                    %>

                    <form name="form2" action="../Controladores/controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" class="elemento" name ="codAulaR" value='<%= paux.getCodAula()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="codFranjaR" value='<%= paux.getCodFranja()%>' readonly></td>
                            <td><input type="text" class="elemento" name ="fechaR" value='<%= paux.getFecha()%>' readonly></td>

                            <td><input type="submit" class="elemento" name="elimReserva" value="Eliminar reserva"></td>
                        </tr>
                    </form>

                    <%

                        }

                    %>

                </table>
            </div>

            <div id="botones">
                <form name="form" action="../Controladores/controlador.jsp" method="POST">
                    <input type="submit" class="elemento" name="mostrarDetalles" value="Mostrar detalles">
                    <input type="submit" class="elemento" name="volverReserva" value="Volver">
                </form>
            </div>

        </div>
    </body>
</html>
