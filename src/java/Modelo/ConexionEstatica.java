package Modelo;

import Auxiliar.Constantes;
import java.sql.*;
import java.util.HashMap;
import java.util.LinkedList;
import javax.swing.JOptionPane;

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
        try {
            String sentencia = "SELECT * FROM Usuario WHERE correo = '" + correo + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString("correo"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("contra"), Conj_Registros.getString("foto"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }

    public static Usuario loginUsuario(String correo, String contra) {
        Usuario existe = null;
        try {
            String sentencia = "SELECT * FROM Usuario WHERE correo = '" + correo + "' and contra = '" + contra + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString("correo"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("contra"), Conj_Registros.getString("foto"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerPersonas() {
        LinkedList personasBD = new LinkedList<>();
        Usuario u = null;
        try {
            String sentencia = "SELECT * FROM Usuario";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                u = new Usuario(Conj_Registros.getString("correo"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellido"), Conj_Registros.getInt("edad"), Conj_Registros.getString("contra"), Conj_Registros.getString("foto"));
                personasBD.add(u);
            }
        } catch (SQLException ex) {
        }
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
        try {
            String sentencia = "SELECT * FROM Aula";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                a = new Aula(Conj_Registros.getInt("codAula"), Conj_Registros.getString("descripcion"));
                aulasBD.add(a);
            }
        } catch (SQLException ex) {
        }
        return aulasBD;
    }
    
    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerFranjasHorarias() {
        LinkedList franjasBD = new LinkedList<>();
        Franja f = null;
        try {
            String sentencia = "SELECT * FROM Franja";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                f = new Franja(Conj_Registros.getInt("codFranja"), Conj_Registros.getString("inicioHora"), Conj_Registros.getString("finHora"));
                franjasBD.add(f);
            }
        } catch (SQLException ex) {
        }
        return franjasBD;
    }

    //----------------------------------------------------------
    public void Modificar_Nombre(String tabla, String correo, String nombre) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET nombre = '" + nombre + "' WHERE correo = '" + correo + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Apellido(String tabla, String correo, String ape) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET apellido = '" + ape + "' WHERE correo = '" + correo + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Edad(String tabla, String email, int num) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET edad = '" + num + "' WHERE email = '" + email + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    public void Modificar_Descripcion_Aula(String tabla, int codAula, String desc) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET descripcion = '" + desc + "' WHERE codAula = '" + codAula + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    public void Modificar_Inicio_Franja(String tabla, int codFranja, String hora) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET inicioHOra = '" + hora + "' WHERE codFranja = '" + codFranja + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }
    
    public void Modificar_Fin_Franja(String tabla, int codFranja, String hora) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET finHOra = '" + hora + "' WHERE codFranja = '" + codFranja + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public void Insertar_Usuario(String tabla, String correo, String contra, String nombre, String apellido, int edad, String foto) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + correo + "', '" + contra + "', '" + nombre + "', '" + apellido + "', '" + edad + "','" + foto + "');";
        Sentencia_SQL.execute(Sentencia);
    }
    
    public void Insertar_Rol_Usuario(String tabla, int codRol, String profesor) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + codRol + "', '" + profesor + "');";
        Sentencia_SQL.execute(Sentencia);
    }
    
    public void Insertar_Aula(String tabla, int codAula, String desc) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla + " VALUES ('" + codAula + "', '" + desc + "');";
        Sentencia_SQL.execute(Sentencia);
    }

    //----------------------------------------------------------
    public void Borrar_Usuario(String tabla, String correo) throws SQLException {
        String Sentencia = "DELETE FROM " + tabla + " WHERE correo = '" + correo + "'";
        Sentencia_SQL.execute(Sentencia);
    }
    
    public void Borrar_Aula(String tabla, int codAula) throws SQLException {
        String Sentencia = "DELETE FROM " + tabla + " WHERE codAula = '" + codAula + "'";
        Sentencia_SQL.execute(Sentencia);
    }

    //----------------------------------------------------------
    public AsignarRol Consultar_AsignarRol(String correo) throws SQLException {
        AsignarRol asig = null;

        try {
            String sentencia = "SELECT * FROM AsignarRol WHERE profesor = '" + correo + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);

            if (ConexionEstatica.Conj_Registros.next()) { //Si devuelve true es que existe.
                asig = new AsignarRol(Conj_Registros.getInt("codRol"), Conj_Registros.getString("profesor"));
            }

        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return asig;//Si devolvemos null el usuario no existe.
    }
    
    public Rol Consultar_Rol(int codRol) throws SQLException {
        Rol rol = null;

        try {
            String sentencia = "SELECT * FROM Rol WHERE codRol = '" + codRol + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);

            if (ConexionEstatica.Conj_Registros.next()) { //Si devuelve true es que existe.
                rol = new Rol(Conj_Registros.getInt("codRol"), Conj_Registros.getString("descripcion"));
            }

        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return rol;//Si devolvemos null el usuario no existe.
    }    

}
