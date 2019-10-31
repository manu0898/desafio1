<%-- 
    Document   : actulizaFoto
    Created on : 29-oct-2019, 13:14:56
    Author     : daw209
--%>

<%@page import="Auxiliar.Bitacora"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            Usuario u = (Usuario) session.getAttribute("usuarioLogueado");
            String correo = u.getCorreo();

            List items = upload.parseRequest(request);
            Usuario p = new Usuario();

            for (Object item : items) {
                FileItem uploaded = (FileItem) item;

                if (!uploaded.isFormField()) {
                    String rutaDestino = "perfiles/";
                    File fichero = new File(rutaDestino, uploaded.getName());
                    uploaded.write(fichero);

                    byte[] icono = new byte[(int) fichero.length()];
                    InputStream input = new FileInputStream(fichero);
                    input.read(icono);
                    p.setFoto(icono);

                } else {

                }
            }

            ConexionEstatica.nueva();

            ConexionEstatica.modificarFoto(p, correo);
            
            Usuario u2 = ConexionEstatica.existeUsuario(correo);
            session.setAttribute("usuarioLogueado", u2);
            
            Bitacora.escribirBitacora("El usuario " + correo + " ha actualizado su foto de perfil.");

            ConexionEstatica.cerrarBD();

            response.sendRedirect("../Vistas/editarPerfil.jsp");

        %>
    </body>
</html>