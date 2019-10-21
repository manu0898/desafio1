<%-- 
    Document   : prueba
    Created on : 17-oct-2019, 9:44:43
    Author     : daw209
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventana del profesor</title>
    </head>

    <body>

        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            Fecha <input type="date" name="fecha"><br><br>
            Elige aula 
            <select name="eligeAula">
                <option value="aula">aula</option>
            </select><br><br>

            <input type="submit" name="verCuadrante" value="Ver cuadrante"><br><br>
            
            <input type="submit" name="volver" value="Volver"/>
            <input type="submit" name="cerrarSesion" value="Cerrar sesión"/>
            

        </form>

    </body>
</html>
