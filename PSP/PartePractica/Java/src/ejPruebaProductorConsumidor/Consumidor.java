package ejPruebaProductorConsumidor;

import java.util.Random;

public class Consumidor implements Runnable {
    private Buffer buffer;
    Random rand = new Random();
    public Consumidor(Buffer buffer) {
        this.buffer = buffer;
    }
    @Override
    public void run() {
        while (true) {
            synchronized (buffer) {
                int tomado = buffer.tomar();
                System.out.println("Consumido: " + tomado);
                if (tomado == 5)
                    return;
            }
        }
    }
}
