package ejercicio85;

import java.util.ArrayList;
import java.util.List;

public class Contenedor {
    private List<Capsula> capsulas = new ArrayList<Capsula>();

    public Contenedor(List<Capsula> capsulas) {
        this.capsulas = capsulas;
    }

    public int GetCapsulas() {
        return capsulas.size();
    }

    public synchronized void AddCapsula(Capsula c)
    {
        while(capsulas.size() >= 100)
        {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        capsulas.add(c);
        System.out.println("Hilo Productor: Se ha fabricado una cáspula. Total en contenedor: " +  capsulas.size());
        if(capsulas.size() >= 6)
        {
            notifyAll();
        }
    }


    public synchronized void EmpaquetarCapsulas()
    {
        while(capsulas.size() < 6)
        {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("Hilo Consumidor: Creando caja con " + capsulas.size() + " cápsulas");
        capsulas.clear();
        System.out.println("Hilo Consumidor: Caja creada");
        notifyAll();
    }
}
