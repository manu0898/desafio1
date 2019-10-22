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
    private String fecha;
    
    private String horaInicio;
    private String horaFin; 
    private String reservado;

    public Reserva(int codAula, int codFranja, String profesor, String fecha) {
        this.codAula = codAula;
        this.codFranja = codFranja;
        this.profesor = profesor;
        this.fecha = fecha;
    }
    
    public Reserva(String horaInicio, String horaFin, String reservado) {
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.reservado = reservado;
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

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(String horaFin) {
        this.horaFin = horaFin;
    }

    public String getReservado() {
        return reservado;
    }

    public void setReservado(String reservado) {
        this.reservado = reservado;
    }
    
}
