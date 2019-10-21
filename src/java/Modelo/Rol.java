/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author daw209
 */
public class Rol {
    
    private int codRol;
    private String descripcion;

    public Rol(int codRol, String descripcion) {
        this.codRol = codRol;
        this.descripcion = descripcion;
    }

    public Rol() {
    }

    public int getCodRol() {
        return codRol;
    }

    public void setCodRol(int codRol) {
        this.codRol = codRol;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
