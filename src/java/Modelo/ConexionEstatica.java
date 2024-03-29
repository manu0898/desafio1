package Modelo;

import Auxiliar.Constantes;
import java.sql.*;
import java.util.HashMap;
import java.util.Date;
import java.util.LinkedList;
import javax.swing.JOptionPane;

/*
 * Esta select funciona:
 * SELECT Franja.inicioHora, Franja.finHora, Reserva.Reservado FROM Franja, Reserva WHERE Reserva.codAula = '103' and Reserva.fecha = '2019-10-30' AND Franja.codFranja = Reserva.codFranja
 * 
 * Esta funciona introduciendo tú el codFranja:
 * SELECT Franja.inicioHora, Franja.finHora, Reserva.Reservado FROM Franja, Reserva WHERE Reserva.codAula = '103' and Reserva.fecha = '2019-10-30' AND Franja.codFranja = '1'
 */
public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    public static void nueva() {
        try {
            //Cargar el driver/controlador
            String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);

            String URL_BD = "jdbc:mysql://localhost/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";

            //Realizamos la conexión a una BD con un usuario y una clave.
            Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static Usuario existeUsuario(String correo) {
        Usuario existe = null;
        ConexionEstatica.nueva();
        try {
            String sentencia = "SELECT * FROM Usuario WHERE correo =? ";
            //Preparamos la sentencia para evitar la inyección.
            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
            sentenciaPreparada.setString(1, correo);
            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();

            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString(1), Conj_Registros.getString(3), Conj_Registros.getString(4), Conj_Registros.getInt(5), Conj_Registros.getString(2), Conj_Registros.getBytes(6), Conj_Registros.getBlob(6));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        return existe;//Si devolvemos null el usuario no existe.
    }

    public static Usuario loginUsuario(String correo, String contra) {
        Usuario existe = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Usuario WHERE correo =? AND contra =?";
        
        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contra);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString(1), Conj_Registros.getString(3), Conj_Registros.getString(4), Conj_Registros.getInt(5), Conj_Registros.getString(2), Conj_Registros.getBytes(6), Conj_Registros.getBlob(6));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        return existe;//Si devolvemos null el usuario no existe.
        
        
        /*
        try {
            String sentencia = "SELECT * FROM Usuario WHERE correo = '"+correo+"' and contra = '"+contra+"'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString(1), Conj_Registros.getString(3), Conj_Registros.getString(4), Conj_Registros.getInt(5), Conj_Registros.getString(2), Conj_Registros.getBytes(6), Conj_Registros.getBlob(6));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        
        return existe;//Si devolvemos null el usuario no existe.*/
        
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerPersonas() {
        LinkedList personasBD = new LinkedList<>();
        Usuario u = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Usuario";
        
        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                u = new Usuario(Conj_Registros.getString(1), Conj_Registros.getString(3), Conj_Registros.getString(4), Conj_Registros.getInt(5), Conj_Registros.getString(2), Conj_Registros.getBytes(6), Conj_Registros.getBlob(6));
                personasBD.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM Usuario";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                u = new Usuario(Conj_Registros.getString("correo"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("contra"), Conj_Registros.getBytes("foto"), Conj_Registros.getBlob("foto"));
                personasBD.add(u);
            }
        } catch (SQLException ex) {
        }
        */
        
        return personasBD;
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerAulas() {
        LinkedList aulasBD = new LinkedList<>();
        Aula a = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Aula";
        
        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                a = new Aula(Conj_Registros.getInt(1), Conj_Registros.getString(2));
                aulasBD.add(a);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM Aula";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                a = new Aula(Conj_Registros.getInt("codAula"), Conj_Registros.getString("descripcion"));
                aulasBD.add(a);
            }
        } catch (SQLException ex) {
        }
        */
        
        return aulasBD;
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerRoles() {
        LinkedList rolesBD = new LinkedList<>();
        Rol r = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Rol";
        
        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                r = new Rol(Conj_Registros.getInt(1), Conj_Registros.getString(2));
                rolesBD.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM Rol";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                r = new Rol(Conj_Registros.getInt("codRol"), Conj_Registros.getString("descripcion"));
                rolesBD.add(r);
            }
        } catch (SQLException ex) {
        }
        */
        
        return rolesBD;
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerAsignarRoles() {
        LinkedList rolesBD = new LinkedList<>();
        AsignarRol r = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM AsignarRol";
        
        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                r = new AsignarRol(Conj_Registros.getInt(1), Conj_Registros.getString(2));
                rolesBD.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM AsignarRol";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                r = new AsignarRol(Conj_Registros.getInt("codRol"), Conj_Registros.getString("profesor"));
                rolesBD.add(r);
            }
        } catch (SQLException ex) {
        }
        */
        
        return rolesBD;
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerFranjasHorarias() {
        LinkedList franjasBD = new LinkedList<>();
        Franja f = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Franja";
        
        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                f = new Franja(Conj_Registros.getInt(1), Conj_Registros.getString(2), Conj_Registros.getString(3));
                franjasBD.add(f);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM Franja";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                f = new Franja(Conj_Registros.getInt("codFranja"), Conj_Registros.getString("inicioHora"), Conj_Registros.getString("finHora"));
                franjasBD.add(f);
            }
        } catch (SQLException ex) {
        }
        */
        
        return franjasBD;
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerFranjasHorariasHoras() {
        LinkedList franjasBD = new LinkedList<>();
        Franja f = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Franja";
        
        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                f = new Franja(Conj_Registros.getString(2), Conj_Registros.getString(3));
                franjasBD.add(f);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM Franja";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                f = new Franja(Conj_Registros.getString("inicioHora"), Conj_Registros.getString("finHora"));
                franjasBD.add(f);
            }
        } catch (SQLException ex) {
        }
        */
        
        return franjasBD;
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerFechas() {
        LinkedList fechasBD = new LinkedList<>();
        Fecha f = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Fecha";
        
        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                f = new Fecha(Conj_Registros.getInt(1), Conj_Registros.getString(2));
                fechasBD.add(f);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM Fecha";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                f = new Fecha(Conj_Registros.getInt("codFecha"), Conj_Registros.getString("fecha"));
                fechasBD.add(f);
            }
        } catch (SQLException ex) {
        }
        */
        
        return fechasBD;
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerReservasFecha(String fecha, int codAula) {
        LinkedList franjasBD = new LinkedList<>();
        Reserva r = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT f.inicioHora, f.finHora, r.Reservado FROM Reserva as r left JOIN Franja as f ON (r.codFranja = f.codFranja) WHERE r.codAula =? and r.fecha =?";

        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, codAula);
            ps.setString(2, fecha);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                r = new Reserva(Conj_Registros.getString(1), Conj_Registros.getString(2), Conj_Registros.getString(3));
                franjasBD.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT f.inicioHora, f.finHora, r.Reservado \n"
                    + "FROM Reserva as r left JOIN Franja as f ON \n"
                    + "(r.codFranja = f.codFranja)\n"
                    + "WHERE \n"
                    + "r.codAula = '" + codAula + "' and r.fecha = '" + fecha + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                r = new Reserva(Conj_Registros.getString("f.inicioHora"), Conj_Registros.getString("f.finHora"), Conj_Registros.getString("r.Reservado"));
                franjasBD.add(r);
            }
        } catch (SQLException ex) {
        }
        */

        return franjasBD;
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerReservasUsuario(String profesor) {
        LinkedList franjasBD = new LinkedList<>();
        Reserva r = null;

        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Reserva WHERE profesor =?";

        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, profesor);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                r = new Reserva(Conj_Registros.getInt(1), Conj_Registros.getInt(2), Conj_Registros.getString(4));
                franjasBD.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM Reserva WHERE profesor = '" + profesor + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                r = new Reserva(Conj_Registros.getInt("codAula"), Conj_Registros.getInt("codFranja"), Conj_Registros.getString("fecha"));
                franjasBD.add(r);
            }
        } catch (SQLException ex) {
        }
        */

        return franjasBD;
    }

    public static Usuario existeUsuarioBD(String usuario) {
        Usuario existe = null;
        ConexionEstatica.nueva();
        try {
            String sentencia = "SELECT * FROM Usuario WHERE correo =? ";
            //Preparamos la sentencia para evitar la inyección.
            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
            sentenciaPreparada.setString(1, usuario);
            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();

            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString(1), Conj_Registros.getString(2), Conj_Registros.getString(3), Conj_Registros.getInt(4), Conj_Registros.getString(4), Conj_Registros.getBytes(5), Conj_Registros.getBlob(6));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        return existe;//Si devolvemos null el usuario no existe.
    }

    public static String obtenerRolUsuario(String usuario) {
        String rol = "";

        ConexionEstatica.nueva();

        try {
            String sentencia = "SELECT descripcion FROM Rol WHERE codRol = (SELECT codRol FROM AsignarRol WHERE profesor = '" + usuario + "');";
            //Preparamos la sentencia para evitar la inyección.
            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();

            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                rol = Conj_Registros.getString(1);
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }

        ConexionEstatica.cerrarBD();

        return rol;
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerTodasLasReservas() {
        LinkedList franjasBD = new LinkedList<>();
        Reserva r = null;

        try {
            String sentencia = "SELECT * FROM Reserva WHERE profesor != ''";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                r = new Reserva(Conj_Registros.getInt("codAula"), Conj_Registros.getInt("codFranja"), Conj_Registros.getString("profesor"), Conj_Registros.getString("fecha"));
                franjasBD.add(r);
            }
        } catch (SQLException ex) {
        }

        return franjasBD;
    }

    //----------------------------------------------------------
    public void Modificar_Nombre(String tabla, String correo, String nombre) throws SQLException {
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "UPDATE Usuario SET nombre =? WHERE correo =?";

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "UPDATE " + tabla + " SET nombre = '" + nombre + "' WHERE correo = '" + correo + "'";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Apellido(String tabla, String correo, String ape) throws SQLException {
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "UPDATE Usuario SET apellido =? WHERE correo =?";

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setString(1, ape);
            ps.setString(2, correo);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "UPDATE " + tabla + " SET apellido = '" + ape + "' WHERE correo = '" + correo + "'";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Edad(String tabla, String correo, int edad) throws SQLException {
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "UPDATE Usuario SET edad =? WHERE correo =?";

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setInt(1, edad);
            ps.setString(2, correo);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "UPDATE " + tabla + " SET edad = '" + edad + "' WHERE correo = '" + correo + "'";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Descripcion_Aula(String tabla, int codAula, String desc) throws SQLException {
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "UPDATE Aula SET descripcion =? WHERE codAula =?";

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setString(1, desc);
            ps.setInt(2, codAula);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "UPDATE " + tabla + " SET descripcion = '" + desc + "' WHERE codAula = '" + codAula + "'";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Inicio_Franja(String tabla, int codFranja, String hora) throws SQLException {
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "UPDATE Franja SET inicioHora =? WHERE codFranja =?";

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setString(1, hora);
            ps.setInt(2, codFranja);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "UPDATE " + tabla + " SET inicioHOra = '" + hora + "' WHERE codFranja = '" + codFranja + "'";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Fin_Franja(String tabla, int codFranja, String hora) throws SQLException {
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "UPDATE Franja SET finHOra =? WHERE codFranja =?";

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setString(1, hora);
            ps.setInt(2, codFranja);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "UPDATE " + tabla + " SET finHOra = '" + hora + "' WHERE codFranja = '" + codFranja + "'";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Aisgnar_Rol(String tabla, String profesor, int codRol) throws SQLException {
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "UPDATE AsignarRol SET codRol =? WHERE profesor =?";

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setInt(1, codRol);
            ps.setString(2, profesor);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "UPDATE " + tabla + " SET codRol = '" + codRol + "' WHERE profesor = '" + profesor + "'";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Reserva(String profesor, String fecha, int codAula, String inicioHora) throws SQLException {
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "UPDATE Reserva SET profesor =?, Reservado = 'Reservado' WHERE fecha =? AND codAula =? AND codFranja = (SELECT codFranja FROM Franja WHERE inicioHora =?)";

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setString(1, profesor);
            ps.setString(2, fecha);
            ps.setInt(3, codAula);
            ps.setString(4, inicioHora);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "UPDATE Reserva SET profesor = '" + profesor + "', Reservado = 'Reservado' \n"
        //        + "WHERE fecha = '" + fecha + "' AND\n"
        //        + "codAula = '" + codAula + "' AND\n"
        //        + "codFranja = (SELECT codFranja FROM Franja WHERE inicioHora = '" + inicioHora + "')";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    public void Modificar_Reserva_Usuario_Eliminado(String profesor) throws SQLException {
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "UPDATE Reserva SET profesor ='', Reservado = 'Libre' WHERE profesor =? ";

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setString(1, profesor);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }

    public static void Modificar_Contrasena(String correo, String contraNueva) throws SQLException {
        PreparedStatement ps = null;
        String sql = "UPDATE Usuario SET contra =? WHERE correo =?";
        ConexionEstatica.nueva();

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, contraNueva);
            ps.setString(2, correo);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }

    public static void modificarFoto(Usuario p, String correo) {

        ConexionEstatica.nueva();
        String sql = "UPDATE Usuario SET foto =? WHERE correo =?";
        PreparedStatement ps = null;

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setBytes(1, p.getFoto());
            ps.setString(2, correo);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }

    //----------------------------------------------------------
    public static void Insertar_Usuario(String tabla, String correo, String contra, String nombre, String apellido, int edad, String foto) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "INSERT INTO Usuario (correo, contra, nombre, apellido, edad, foto) VALUES (?,?,?,?,?,?);";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contra);
            ps.setString(3, nombre);
            ps.setString(4, apellido);
            ps.setInt(5, edad);
            ps.setString(6, foto);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }

        //String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + correo + "', '" + contra + "', '" + nombre + "', '" + apellido + "', '" + edad + "','" + foto + "');";
        //Sentencia_SQL.execute(Sentencia);
    }

    //----------------------------------------------------------
    public static void insertarPersona(Usuario p) {

        ConexionEstatica.nueva();
        String sql = "INSERT INTO Usuario (correo, contra, nombre, apellido, edad, foto) VALUES (?,?,?,?,?,?);";
        PreparedStatement ps = null;

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, p.getCorreo());
            ps.setString(2, p.getContra());
            ps.setString(3, p.getNombre());
            ps.setString(4, p.getApellido());
            ps.setInt(5, p.getEdad());
            ps.setBytes(6, p.getFoto());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }

    public static void insertarRolPersona(Usuario p) {

        ConexionEstatica.nueva();
        String sql = "INSERT INTO AsignarRol (codRol, profesor) VALUES (?,?);";
        PreparedStatement ps = null;

        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, 0);
            ps.setString(2, p.getCorreo());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }

    //----------------------------------------------------------
    public static void Insertar_Usuario_Foto(String tabla, String correo, String contra, String nombre, String apellido, int edad, Blob foto) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "INSERT INTO Usuario VALUES (?, ?, ?, ?, ?, ?);";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setString(1, correo);
            ps.setString(2, contra);
            ps.setString(3, nombre);
            ps.setString(4, apellido);
            ps.setInt(5, edad);
            ps.setBlob(6, foto);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }

        //String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + correo + "', '" + contra + "', '" + nombre + "', '" + apellido + "', '" + edad + "','" + foto + "');";
        //Sentencia_SQL.execute(Sentencia);
    }

    public static void Insertar_Rol_Usuario(String tabla, int codRol, String profesor) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "INSERT INTO AsignarRol VALUES (?, ?);";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setInt(1, codRol);
            ps.setString(2, profesor);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + codRol + "', '" + profesor + "');";
        //Sentencia_SQL.execute(Sentencia);
    }

    public void Insertar_Aula(String tabla, int codAula, String desc) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "INSERT INTO Aula VALUES (?, ?);";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setInt(1, codAula);
            ps.setString(2, desc);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + codAula + "', '" + desc + "');";
        //Sentencia_SQL.execute(Sentencia);
    }

    public void Insertar_Reserva(String tabla, int codAula, int codFranja, String profesor, String fecha) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "INSERT INTO Reserva VALUES (?, ?, ?, ?);";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setInt(1, codAula);
            ps.setInt(2, codFranja);
            ps.setString(3, profesor);
            ps.setString(4, fecha);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + codAula + "', '" + codFranja + "', '" + profesor + "', '" + fecha + "');";
        //Sentencia_SQL.execute(Sentencia);
    }

    public void Insertar_Aula_Reservas(int codAula, int codFranja, String profesor, String reservado, String fecha) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "INSERT INTO Reserva (`codAula`, `codFranja`, `profesor`, `fecha`, `Reservado`) VALUES (?, ?, ?, ?, ?, ?);";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, codAula);
            ps.setInt(2, codFranja);
            ps.setString(3, profesor);
            ps.setString(4, fecha);
            ps.setString(5, reservado);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "INSERT INTO Reserva (`codAula`, `codFranja`, `profesor`, `fecha`, `Reservado`) VALUES ('" + codAula + "', '" + codFranja + "', '" + profesor + "', '" + fecha + "', '" + reservado + "');";
        //Sentencia_SQL.execute(Sentencia);
    }

    public static void Insertar_Aula_Nueva_Tabla_Reservas(int codAula, int codFranja, String fecha, String reservado) {
       ConexionEstatica.nueva();
        String sql = "INSERT INTO Reserva (`codAula`, `codFranja`, `fecha`, `Reservado`) VALUES (?, ?, ?, ?);";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, codAula);
            ps.setInt(2, codFranja);
            ps.setString(3, fecha);
            ps.setString(4, reservado);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    //----------------------------------------------------------
    public void Borrar_Usuario(String tabla, String correo) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "DELETE FROM Usuario WHERE correo =?";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setString(1, correo);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "DELETE FROM " + tabla + " WHERE correo = '" + correo + "'";
        //Sentencia_SQL.execute(Sentencia);
    }

    public void Borrar_Aula(String tabla, int codAula) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "DELETE FROM Aula WHERE codAula =?";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            //ps.setString(1, tabla);
            ps.setInt(1, codAula);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "DELETE FROM " + tabla + " WHERE codAula = '" + codAula + "'";
        //Sentencia_SQL.execute(Sentencia);
    }

    public void Borrar_Reserva(int codAula, int codFranja, String profesor, String fecha) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "DELETE FROM Reserva WHERE codAula =? AND codFranja =? AND profesor =? AND fecha =?";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, codAula);
            ps.setInt(2, codFranja);
            ps.setString(3, profesor);
            ps.setString(4, fecha);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }

        //String Sentencia = "DELETE FROM Reserva WHERE codAula = '" + codAula + "' AND codFranja = '" + codFranja + "' AND profesor = '" + profesor + "' AND fecha = '" + fecha + "'";
        //Sentencia_SQL.execute(Sentencia);
    }

    public void Borrar_Asignar_Rol(String profesor) throws SQLException {
        
        ConexionEstatica.nueva();
        String sql = "DELETE FROM AsignarRol WHERE profesor =?";
        PreparedStatement ps = null;
        
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, profesor);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        
        //String Sentencia = "DELETE FROM AsignarRol WHERE profesor = '" + profesor + "'";
        //Sentencia_SQL.execute(Sentencia);
    }

    //----------------------------------------------------------
    public AsignarRol Consultar_AsignarRol(String correo) throws SQLException {
        AsignarRol asig = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM AsignarRol WHERE profesor =?";

        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, correo);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                asig = new AsignarRol(Conj_Registros.getInt(1), Conj_Registros.getString(2));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM AsignarRol WHERE profesor = '" + correo + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);

            if (ConexionEstatica.Conj_Registros.next()) { //Si devuelve true es que existe.
                asig = new AsignarRol(Conj_Registros.getInt("codRol"), Conj_Registros.getString("profesor"));
            }

        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        */
        
        return asig;//Si devolvemos null el usuario no existe.
    }

    public Rol Consultar_Rol(int codRol) throws SQLException {
        Rol rol = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Rol WHERE codRol =?";

        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, codRol);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                rol = new Rol(Conj_Registros.getInt(1), Conj_Registros.getString(2));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        /*
        try {
            String sentencia = "SELECT * FROM Rol WHERE codRol = '" + codRol + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);

            if (ConexionEstatica.Conj_Registros.next()) { //Si devuelve true es que existe.
                rol = new Rol(Conj_Registros.getInt("codRol"), Conj_Registros.getString("descripcion"));
            }

        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        */
        
        return rol;//Si devolvemos null el usuario no existe.
    }
    
    public Captcha Consultar_Captcha(int cod) throws SQLException {
        Captcha c = null;
        
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        String sql = "SELECT * FROM Captcha WHERE cod =?";

        try {
            //Preparamos la sentencia para evitar la inyección.
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, cod);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

            while (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                c = new Captcha(Conj_Registros.getInt(1), Conj_Registros.getString(2), Conj_Registros.getBytes(3), Conj_Registros.getBlob(3));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        ConexionEstatica.cerrarBD();
        
        return c;//Si devolvemos null el usuario no existe.
    }

}
