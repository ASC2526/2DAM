package ejPruebaRestaurante;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class Main {
    public static void main(String[] args) {
        Mostrador mostrador = new Mostrador();
        Mesero m1 = new Mesero(mostrador, 1);
        Mesero m2 = new Mesero(mostrador, 2);
        Mesero m3 = new Mesero(mostrador, 3);
        Cocinero c1 = new Cocinero(mostrador, 1);
        Cocinero c2 = new Cocinero(mostrador, 2);

        ExecutorService pool = Executors.newFixedThreadPool(5);
        pool.execute(m1);
        pool.execute(m2);
        pool.execute(m3);
        pool.execute(c1);
        pool.execute(c2);

        pool.shutdown();

        try {
            if (!pool.awaitTermination(60, TimeUnit.SECONDS)) {
                pool.shutdownNow();
            }
        } catch (InterruptedException e) {
            pool.shutdownNow();
        }

        System.out.println("=== Todos los pedidos han sido servidos. Restaurante cerrado. ===");

    }
}
