<%-- 
    Document   : ventanaRolAdminGeneral
    Created on : 24-oct-2019, 12:45:48
    Author     : daw209
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventana rol adminGeneral</title>
    </head>
    
    <body>
        
        <form name="form" action="../Controladores/controlador.jsp" method="POST">

            Elige el rol con el que quieres acceder 
            <br><br><select name="eligeRolAG">
                ç<option value='adminGeneral'>Adiministrador general</option>
                <option value='adminAula'>Adiministrador de aulas</option>
                <option value='profesor'>Profesor</option>
            </select><br><br>

            <input type="submit" name="entrarAdminGen" value="Entrar"><br><br>
            <input type="submit" name="cerrarSesion" value="Cerrar sesión"/>
        </form>
        
    </body>
</html>
