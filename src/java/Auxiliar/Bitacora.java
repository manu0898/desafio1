/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Auxiliar;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Este fichero se creará en el servidor:
 * glassfishXX/glassfish/domains/domain1/config
 *
 * @author fernando
 */
public class Bitacora {

    public static void escribirBitacora(String m) {

        // Aqui indicas el formato que quieres. Y el parámetro locale es para que te coja la hora del ordenador donde se ejecuta.
        SimpleDateFormat MI_FORMATO = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        // Obtenemos la fecha actual
        Date Ahora = new Date();
        // Le damos al nombre del fichero la fecha y hora actual
        String fecha = MI_FORMATO.format(Ahora);

        FileWriter fw = null;
        System.out.println(m);
        try {
            fw = new FileWriter(Constantes.ficheroBitacora, true);
            fw.write(m + " -> " + fecha + "\r\n");
            fw.close();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

}
