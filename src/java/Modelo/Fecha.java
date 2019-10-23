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

    /* Código para asignar las fechas del año lectivo a todas las aulas
    
        ConexionEstatica.nueva();
        ConexionEstatica con = new ConexionEstatica();

        LinkedList aulas = ConexionEstatica.obtenerAulas();
        session.setAttribute("aulasParaReserva", aulas);

        LinkedList franjas = ConexionEstatica.obtenerFranjasHorarias();
        session.setAttribute("franjasParaReserva", franjas);

        LinkedList fechas = ConexionEstatica.obtenerFechas();
        session.setAttribute("fechasParaReserva", fechas);

        ConexionEstatica.cerrarBD();
    
        ---------------------------------------------------------------------------------
    
            LinkedList<Aula> aulas = (LinkedList) session.getAttribute("aulasParaReserva");
            LinkedList<Franja> franjas = (LinkedList) session.getAttribute("franjasParaReserva");
            LinkedList<Fecha> fechas = (LinkedList) session.getAttribute("fechasParaReserva");

            out.print("Aulas: ");
            out.print(aulas);
            out.print("\nFranjas: ");
            out.print(franjas);
            out.print("\nFechas: ");
            out.print(fechas);

            for (Aula paux : aulas) {
                for (Franja paux2 : franjas) {
                    for (Fecha paux3 : fechas) {

                        ConexionEstatica.nueva();
                        ConexionEstatica con = new ConexionEstatica();

                        con.Insertar_Aula_Reservas(paux.getCodAula(), paux2.getCodFranja(), "", "Libre", paux3.getFecha());

                        ConexionEstatica.cerrarBD();

                    }
                }

            }
    
     */
}
