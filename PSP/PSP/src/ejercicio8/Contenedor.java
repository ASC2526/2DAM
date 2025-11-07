package ejercicio8;

import java.util.ArrayList;
import java.util.List;

public class Contenedor {
    private List<Capsula> capsulas = new ArrayList<>();

    public synchronized void agregarCapsula(Capsula c) {
        while (capsulas.size() >= 100) //d
        {
            try {
                wait();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        } //d
        capsulas.add(c);
        System.out.println("Hilo Productor: Se ha fabricado una cápsula. Total en contenedor: " + capsulas.size());

        if (capsulas.size() >= 6) {
            notifyAll();
        }
    }


    public synchronized void empaquetarCapsulas() {
        while (capsulas.size() < 6) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("Hilo Consumidor: Creando caja con 6 cápsulas");
        for (int i = 0; i < 6; i++) {
            capsulas.remove(0);
        }
        System.out.println("Hilo Consumidor: Caja creada");
        notifyAll();
    }
}

