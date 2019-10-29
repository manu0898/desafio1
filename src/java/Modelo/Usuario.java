/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

/**
 *
 * @author fernando
 */
public class Usuario {

    private String correo;
    private String nombre;
    private String apellido;
    private int edad;
    private String contra;
    //private String foto;

    private byte[] foto; //Foto en formato binario, será la leída del formulario.
    private Blob fotoBlob; //Formato en formato BLOB será la leída de MySQL.

    /*
    public Usuario(String correo, String nombre, String apellido, int edad, String contrasena, String foto) {
        this.correo = correo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.contra = contrasena;
        this.foto = foto;
    }
     */
    
    public Usuario(String correo, String nombre, String apellido, int edad, String contrasena, byte[] foto, Blob fotoBlob) {
        this.correo = correo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.contra = contrasena;
        this.foto = foto;
        this.fotoBlob = fotoBlob;
    }

    public Usuario() {

    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    /*
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    */

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public Blob getFotoBlob() {
        return fotoBlob;
    }

    public void setFotoBlob(Blob fotoBlob) {
        this.fotoBlob = fotoBlob;
    }
    
    public String getFotoimgString() {
        String image =null;
        try {
            byte[] imageBytes = this.fotoBlob.getBytes(1, (int) this.fotoBlob.length());
            String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
            image = "data:image/jpg;base64," + encodedImage;
            
        } catch (SQLException ex) {
        }
        return image;
    }

}
