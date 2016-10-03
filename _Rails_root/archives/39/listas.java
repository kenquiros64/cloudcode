/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.ArrayList;

public class listas {
    ArrayList lista = new ArrayList();
    
    public void crearMatriz(){
        for (int i = 0; i < 8; i++) {
            ArrayList fila = new ArrayList();
            if(i%2==0){
            for (int j = 0; j < 8; j++) {
                fila.add("1");
            }lista.add(fila);
            }else{
            for (int j = 0; j < 8; j++) {
                fila.add("2");
            }lista.add(fila);    
            }
            System.out.println(fila);
        }System.out.println(lista);
    }
}
