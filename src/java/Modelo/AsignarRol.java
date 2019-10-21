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
public class AsignarRol {
    
    private int codRol;
    private String profesor;

    public AsignarRol(int codRol, String profesor) {
        this.codRol = codRol;
        this.profesor = profesor;
    }

    public AsignarRol() {
    }

    public int getCodRol() {
        return codRol;
    }

    public void setCodRol(int codRol) {
        this.codRol = codRol;
    }

    public String getProfesor() {
        return profesor;
    }

    public void setProfesor(String profesor) {
        this.profesor = profesor;
    }
    
}
