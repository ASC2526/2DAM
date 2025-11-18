package ejercicio3;

import java.util.Random;

public class StatusHiloPrimos implements Runnable {
    private final String nombre;
    private final int max;
    private Random random;

    public StatusHiloPrimos(String nombre) {
        this.nombre = nombre;
        this.random = new Random();
        this.max = random.nextInt(100) + 1;
        System.out.println(nombre + ": Mostrando primos hasta el " + max);
    }

    @Override
    public void run() {
        for (int i = 1; i <= max; i++) {
            if (EsPrimo(i)) {
                System.out.println(nombre + ": " + i);
                try {
                    Thread.sleep(random.nextInt(501) + 500);

                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private boolean EsPrimo(int n) {
        if (n <= 1)
            return false;
        if (n == 2)
            return true;
        if (n % 2 == 0)
            return false;
        for (int i = 3; i * i <= n; i += 2) {
            if (n % i == 0)
                return false;
        }
        return true;
    }
}
