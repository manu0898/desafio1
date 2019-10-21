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
public class Franja {
    
    private int codFranja;
    private String inicioHora;
    private String finHora;

    public Franja(int codFranja, String inicioHora, String finHora) {
        this.codFranja = codFranja;
        this.inicioHora = inicioHora;
        this.finHora = finHora;
    }
    
    public Franja() {
        
    }

    public int getCodFranja() {
        return codFranja;
    }

    public void setCodFranja(int codFranja) {
        this.codFranja = codFranja;
    }

    public String getInicioHora() {
        return inicioHora;
    }

    public void setInicioHora(String inicioHora) {
        this.inicioHora = inicioHora;
    }

    public String getFinHora() {
        return finHora;
    }

    public void setFinHora(String finHora) {
        this.finHora = finHora;
    }   
    
}
