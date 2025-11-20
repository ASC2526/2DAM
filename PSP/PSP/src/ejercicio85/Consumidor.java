package ejercicio85;

import java.util.Random;

public class Consumidor implements Runnable {
    private final Contenedor contenedor;
    public Consumidor(Contenedor contenedor) {
        this.contenedor = contenedor;
    }

    @Override
    public void run() {
        Random random = new Random();
        while (true) {
            contenedor.EmpaquetarCapsulas();
            try {
                Thread.sleep(random.nextInt(1000)+2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
