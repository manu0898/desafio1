/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Date;


/**
 *
 * @author daw209
 */
public class Reserva {
    
    private int codAula;
    private int codFranja;
    private String profesor;
    private Date fecha;

    public Reserva(int codAula, int codFranja, String profesor, Date fecha) {
        this.codAula = codAula;
        this.codFranja = codFranja;
        this.profesor = profesor;
        this.fecha = fecha;
    }

    public Reserva() {
    }

    public int getCodAula() {
        return codAula;
    }

    public void setCodAula(int codAula) {
        this.codAula = codAula;
    }

    public int getCodFranja() {
        return codFranja;
    }

    public void setCodFranja(int codFranja) {
        this.codFranja = codFranja;
    }

    public String getProfesor() {
        return profesor;
    }

    public void setProfesor(String profesor) {
        this.profesor = profesor;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
}
