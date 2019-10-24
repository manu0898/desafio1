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
public class Fecha {

    private int codFecha;
    private String fecha;

    public Fecha(int codFecha, String fecha) {
        this.codFecha = codFecha;
        this.fecha = fecha;
    }

    public Fecha() {
    }

    public int getCodFecha() {
        return codFecha;
    }

    public void setCodFecha(int codFecha) {
        this.codFecha = codFecha;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

}
