/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alex.compis;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 *
 * @author 
 */
public class nuevo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            Proyecto lexico = new Proyecto(new FileReader("texto.txt"));
            Sintactico sintactico = new Sintactico(lexico);
            sintactico.parse();
        } catch (FileNotFoundException ex) {
            System.out.println("ERROR");
            Logger.getLogger(nuevo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            System.out.println("ERROR2");
            Logger.getLogger(nuevo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
