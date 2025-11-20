package ejercicio85;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Capsula> capsulas = new ArrayList<>();
        Contenedor contenedor = new Contenedor(capsulas);
        Runnable r1 = new Consumidor(contenedor);
        Runnable r = null;
        for (int i = 0; i < 3; i++) {
            r = new Productor(contenedor, "Suizo", 8);
        }
        Thread t1 = new Thread(r1);
        Thread t2 = new Thread(r);
        t1.start();
        t2.start();
    }
}