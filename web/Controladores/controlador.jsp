<%-- 
    Document   : controlador
    Created on : 17-oct-2019, 9:34:11
    Author     : daw209
--%>

<%@page import="Modelo.Franja"%>
<%@page import="Modelo.Aula"%>
<%@page import="Modelo.Reserva"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Auxiliar.Codificar"%>
<%@page import="Auxiliar.Bitacora"%>
<%@page import="Modelo.AsignarRol"%>
<%@page import="Modelo.Rol"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    if (request.getParameter("login") != null) {

        String usuario = request.getParameter("usuarioLogin");
        String contrasena = request.getParameter("contraLogin");

        String codClave = Codificar.codifica(contrasena);//contraseña del usuario codificada

        ConexionEstatica.nueva();
        Usuario p = ConexionEstatica.loginUsuario(usuario, codClave);//el usuario es el email

        if (p != null) {

            String correo = p.getCorreo();

            ConexionEstatica con = new ConexionEstatica();

            session.setAttribute("usuarioLogueado", p);

            LinkedList usuarios = ConexionEstatica.obtenerPersonas();
            session.setAttribute("usuarios", usuarios);

            AsignarRol asig = con.Consultar_AsignarRol(correo);
            Rol rol = con.Consultar_Rol(asig.getCodRol());

            if (rol != null) {

                if (rol.getCodRol() == 0) {
                    Bitacora.escribirBitacora("El usuario " + p.getNombre() + " ha entrado en la ventana del profesor.");

                    ConexionEstatica.nueva();

                    LinkedList aulas = ConexionEstatica.obtenerAulas();
                    session.setAttribute("aulas", aulas);

                    ConexionEstatica.cerrarBD();

                    response.sendRedirect("../Vistas/ventanaProfesor.jsp");
                } else {
                    if (rol.getCodRol() == 1) {
                        Bitacora.escribirBitacora("El usuario " + p.getNombre() + " ha entrado en la ventana del administrador de aulas.");
                        response.sendRedirect("../Vistas/ventanaAdminAula.jsp");
                    } else {
                        if (rol.getCodRol() == 2) {
                            Bitacora.escribirBitacora("El usuario " + p.getNombre() + " ha entrado en la ventana del administrador general.");
                            response.sendRedirect("../Vistas/ventanaAdminGeneral.jsp");
                        }
                    }
                }
            }

            ConexionEstatica.cerrarBD();

        } else {
            out.print("Usuario y/o contraseña incorrectos");
        }
        ConexionEstatica.cerrarBD();
    }

    //---------------------------------------
    if (request.getParameter("registrarse") != null) {

        session.setAttribute("vieneDeAdmin", "no");

        response.sendRedirect("../Vistas/registro.jsp");
    }

    //--------------------------------------
    if (request.getParameter("volver") != null) {

        String vieneAdmin = (String) session.getAttribute("vieneDeAdmin");

        if (vieneAdmin.equals("no")) {
            response.sendRedirect("../index.html");
        } else {
            if (vieneAdmin.equals("si")) {

                ConexionEstatica.nueva();

                //recargar la pagina
                LinkedList usuarios = ConexionEstatica.obtenerPersonas();
                session.setAttribute("usuarios", usuarios);

                ConexionEstatica.cerrarBD();

                response.sendRedirect("../Vistas/gestionarUsuarios.jsp");

            }
        }

    }

    //------------------------------------------
    if (request.getParameter("registrar") != null) {

        String nombre = request.getParameter("nombreReg");
        String apellido = request.getParameter("apellidoReg");
        String email = request.getParameter("correoReg");
        int edad = Integer.parseInt(request.getParameter("edadReg"));
        String contra = request.getParameter("contraReg");
        String contra2 = request.getParameter("contra2Reg");
        // lo de la foto hay que cambiarlo
        String foto = "";

        if (nombre != null && email != null && contra != "" && contra2 != "" && apellido != null && contra.equals(contra2)) {
            ConexionEstatica.nueva();
            Usuario p = ConexionEstatica.existeUsuario(email);

            if (p == null) {

                ConexionEstatica con = new ConexionEstatica();

                String codClave = Codificar.codifica(contra);//contraseña del usuario codificada

                con.Insertar_Usuario("Usuario", email, codClave, nombre, apellido, edad, foto);

                con.Insertar_Rol_Usuario("AsignarRol", 0, email);//de momento todos los usuarios nuevos serán asignados como profesor

                String vieneAdmin = (String) session.getAttribute("vieneDeAdmin");

                if (vieneAdmin.equals("no")) {
                    response.sendRedirect("../index.html");
                } else {
                    if (vieneAdmin.equals("si")) {

                        ConexionEstatica.nueva();

                        //recargar la pagina
                        LinkedList usuarios = ConexionEstatica.obtenerPersonas();
                        session.setAttribute("usuarios", usuarios);
                        ConexionEstatica.cerrarBD();

                        response.sendRedirect("../Vistas/gestionarUsuarios.jsp");
                    }
                }

                Bitacora.escribirBitacora("El usuario " + p.getNombre() + " se ha registrado en el sistema.");

            } else {
                out.print("Ya existe un usuario con ese email");
            }
            ConexionEstatica.cerrarBD();
        } else {
            out.print("Revise los datos introducidos");
        }

    }

    //------------------------------------------
    if (request.getParameter("recuperarContra") != null) {

        
        response.sendRedirect("../Vistas/ventanaRecuperarContra.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("verCuadrante") != null) {

        ConexionEstatica.nueva();

        ConexionEstatica con = new ConexionEstatica();

        //Usuario u = (Usuario) session.getAttribute("usuarioLogueado");
        //String correo = u.getCorreo();
        String fecha = request.getParameter("fechaR");
        int codAula = Integer.parseInt(request.getParameter("eligeAula"));

        session.setAttribute("fechaRes", fecha);
        session.setAttribute("aulaRes", codAula);

        LinkedList reservas = ConexionEstatica.obtenerReservasFecha(fecha, codAula);
        session.setAttribute("reservasHoras", reservas);

        ConexionEstatica.cerrarBD();

        response.sendRedirect("../Vistas/ventanaRealizarReserva.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("gestionarAulas") != null) {

        ConexionEstatica.nueva();

        //recargar la pagina
        LinkedList aulas = ConexionEstatica.obtenerAulas();
        session.setAttribute("aulas", aulas);

        ConexionEstatica.cerrarBD();

        response.sendRedirect("../Vistas/gestionarAulas.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("gestionarFranjHorarias") != null) {

        ConexionEstatica.nueva();

        //recargar la pagina
        LinkedList franjas = ConexionEstatica.obtenerFranjasHorarias();
        session.setAttribute("franjas", franjas);

        ConexionEstatica.cerrarBD();

        response.sendRedirect("../Vistas/gestionarFranjasHorarias.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("gestionarFranjasHorarias") != null) {
        response.sendRedirect("../Vistas/gestionarFranjasHorarias.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("crearAula") != null) {

        ConexionEstatica con = new ConexionEstatica();

        ConexionEstatica.nueva();

        int codAula = Integer.parseInt(request.getParameter("codAulaAdd"));
        String desc = request.getParameter("descripcionAdd");

        con.Insertar_Aula("Aula", codAula, desc);

        //recargar la pagina
        LinkedList aulas = ConexionEstatica.obtenerAulas();
        session.setAttribute("aulas", aulas);

        ConexionEstatica.cerrarBD();

        response.sendRedirect("../Vistas/gestionarAulas.jsp");

    }

    //--------------------
    if (request.getParameter("modifCRUDAula") != null) {

        ConexionEstatica.nueva();

        ConexionEstatica con = new ConexionEstatica();

        int codAula = Integer.parseInt(request.getParameter("codAula"));
        String desc = request.getParameter("descripcion");

        con.Modificar_Descripcion_Aula("Aula", codAula, desc);

        //recargar la pagina
        LinkedList aulas = ConexionEstatica.obtenerAulas();
        session.setAttribute("aulas", aulas);

        ConexionEstatica.cerrarBD();

        Bitacora.escribirBitacora("El administrador ha modificado datos del aula en la base de datos.");

        response.sendRedirect("../Vistas/gestionarAulas.jsp");

    }

    //-------------------
    if (request.getParameter("elimCRUDAula") != null) {

        ConexionEstatica.nueva();

        ConexionEstatica con = new ConexionEstatica();

        int codAula = Integer.parseInt(request.getParameter("codAula"));

        con.Borrar_Aula("Aula", codAula);

        //recargar la pagina
        LinkedList aulas = ConexionEstatica.obtenerAulas();
        session.setAttribute("aulas", aulas);

        ConexionEstatica.cerrarBD();

        Bitacora.escribirBitacora("El usuario administrador ha eliminado un aula de la base de datos.");

        response.sendRedirect("../Vistas/gestionarAulas.jsp");
    }

    //--------------------
    if (request.getParameter("modifCRUDFranja") != null) {

        ConexionEstatica.nueva();

        ConexionEstatica con = new ConexionEstatica();

        int codFranja = Integer.parseInt(request.getParameter("codFranja"));
        String horaInicio = request.getParameter("hInicio");
        String horaFin = request.getParameter("hFin");

        con.Modificar_Inicio_Franja("Franja", codFranja, horaInicio);
        con.Modificar_Fin_Franja("Franja", codFranja, horaFin);

        //recargar la pagina
        LinkedList franjas = ConexionEstatica.obtenerFranjasHorarias();
        session.setAttribute("franjas", franjas);

        ConexionEstatica.cerrarBD();

        Bitacora.escribirBitacora("El administrador ha modificado datos de la franja horaria en la base de datos.");

        response.sendRedirect("../Vistas/gestionarFranjasHorarias.jsp");

    }

    //-------------------------------------------
    if (request.getParameter("volverAula") != null) {
        response.sendRedirect("../Vistas/ventanaAdminAula.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("volverFranja") != null) {
        response.sendRedirect("../Vistas/ventanaAdminAula.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("gestionarUsuarios") != null) {

        ConexionEstatica.nueva();

        //recargar la pagina
        LinkedList usuarios = ConexionEstatica.obtenerPersonas();
        session.setAttribute("usuarios", usuarios);

        ConexionEstatica.cerrarBD();

        response.sendRedirect("../Vistas/gestionarUsuarios.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("verBitacora") != null) {
        response.sendRedirect("../Vistas/verBitacora.jsp");
    }

    //--------------------
    if (request.getParameter("modifCRUDUsuarios") != null) {

        ConexionEstatica.nueva();

        ConexionEstatica con = new ConexionEstatica();

        String correo = request.getParameter("correoCrud");
        int edad = Integer.parseInt(request.getParameter("edadCrud"));
        String nombre = request.getParameter("nombreCrud");
        String apellido = request.getParameter("apellidoCrud");

        con.Modificar_Nombre("Usuario", correo, nombre);
        con.Modificar_Apellido("Usuario", correo, apellido);
        con.Modificar_Edad("Usuario", correo, edad);

        //recargar la pagina
        LinkedList usuarios = ConexionEstatica.obtenerPersonas();
        session.setAttribute("usuarios", usuarios);

        ConexionEstatica.cerrarBD();

        Bitacora.escribirBitacora("El administrador ha modificado datos de un usuario en la base de datos.");

        response.sendRedirect("../Vistas/gestionarUsuarios.jsp");

    }

    //-------------------
    if (request.getParameter("elimCRUDUsuarios") != null) {

        ConexionEstatica.nueva();

        ConexionEstatica con = new ConexionEstatica();

        String correo = request.getParameter("correoCrud");

        con.Borrar_Usuario("Usuario", correo);

        //recargar la pagina
        LinkedList usuarios = ConexionEstatica.obtenerPersonas();
        session.setAttribute("usuarios", usuarios);

        ConexionEstatica.cerrarBD();

        Bitacora.escribirBitacora("El usuario administrador ha eliminado un usuario de la base de datos.");

        response.sendRedirect("../Vistas/gestionarUsuarios.jsp");
    }

    //------------------------------------------
    if (request.getParameter("anadirUsuario") != null) {
        session.setAttribute("vieneDeAdmin", "si");

        response.sendRedirect("../Vistas/registro.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("volverUsuario") != null) {
        response.sendRedirect("../Vistas/ventanaAdminGeneral.jsp");
    }

    //-------------------------------------------
    if (request.getParameter("cerrarSesion") != null) {

    }
    
    //------------------------------------------
    if (request.getParameter("reservarAulaUsu") != null) {
        
        ConexionEstatica.nueva();
        
        ConexionEstatica con = new ConexionEstatica();
        
        
        Usuario u = (Usuario) session.getAttribute("usuarioLogueado");
        
        String profesor = u.getCorreo();
        String fecha = (String) session.getAttribute("fechaResVentana");
        String codAulaA = (String) session.getAttribute("aulaResVentana");
        int codAula = Integer.parseInt(codAulaA);
        String inicioHora = request.getParameter("hInicio");

        con.Modificar_Reserva(profesor, fecha, codAula, inicioHora);
        
        LinkedList reservas = ConexionEstatica.obtenerReservasFecha(fecha, codAula);
        session.setAttribute("reservasHoras", reservas);
        
        response.sendRedirect("../Vistas/ventanaRealizarReserva.jsp");
        
        ConexionEstatica.cerrarBD();
        
    }
    
    //----------------------------------------
    if (request.getParameter("verMisReservas") != null) {
        
        ConexionEstatica.nueva();
        
        Usuario u = (Usuario) session.getAttribute("usuarioLogueado");
        
        String profesor = u.getCorreo();
        
        LinkedList reservas = ConexionEstatica.obtenerReservasUsuario(profesor);
        session.setAttribute("reservasDelUsuario", reservas);
        
        response.sendRedirect("../Vistas/ventanaCrudReservasUsuario.jsp");
        
        ConexionEstatica.cerrarBD();
        
    }
    
    //----------------------------------------
    if (request.getParameter("mostrarDetalles") != null) {
        
        ConexionEstatica.nueva();
        
        LinkedList aulas = ConexionEstatica.obtenerAulas();
        session.setAttribute("aulasDetalle", aulas);
        
        LinkedList franjas = ConexionEstatica.obtenerFranjasHorarias();
        session.setAttribute("franjasDetalle", franjas);
        
        response.sendRedirect("../Vistas/ventanaDetalles.jsp");
        
        ConexionEstatica.cerrarBD();
        
    }

%>
