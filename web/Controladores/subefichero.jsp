<%-- 
    Document   : subefichero
    Created on : 20-oct-2019, 18:06:24
    Author     : fernando
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Auxiliar.Bitacora"%>
<%@page import="Auxiliar.Codificar"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
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
            String correo = "";

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

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
                    String key = uploaded.getFieldName();
                    String valor = uploaded.getString();

                    if (key.equals("nombreReg")) {
                        p.setNombre(valor);
                    }
                    if (key.equals("edadReg")) {
                        p.setEdad(Integer.parseInt(valor));
                    }
                    if (key.equals("correoReg")) {
                        p.setCorreo(valor);
                        correo = p.getCorreo();
                    }
                    if (key.equals("apellidoReg")) {
                        p.setApellido(valor);
                    }
                    if (key.equals("contraReg")) {
                        p.setContra(Codificar.codifica(valor));
                    }
                }
            }

            ConexionEstatica.nueva();

            Usuario comprobar = ConexionEstatica.existeUsuario(correo);
            if (comprobar == null) {
                ConexionEstatica.insertarPersona(p);
                ConexionEstatica.insertarRolPersona(p);

                ConexionEstatica.Insertar_Rol_Usuario("AsignarRol", 0, p.getCorreo());

                String vieneAdmin = (String) session.getAttribute("vieneDeAdmin");

                if (vieneAdmin.equals("no")) {
                    response.sendRedirect("../index.html");
                } else {
                    if (vieneAdmin.equals("si")) {

                        //recargar la pagina
                        LinkedList usuarios = ConexionEstatica.obtenerPersonas();
                        session.setAttribute("usuarios", usuarios);

                        ConexionEstatica.cerrarBD();

                        response.sendRedirect("../Vistas/gestionarUsuarios.jsp");
                    }
                }
            } else {
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/registro.jsp");
            }
        %>
    </body>
</html>
