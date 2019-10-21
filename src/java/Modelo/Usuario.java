/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

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
    private String foto;

    public Usuario(String correo, String nombre, String apellido, int edad, String contrasena, String foto) {
        this.correo = correo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.contra = contrasena;
        this.foto = foto;
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

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
}
