package ejercicio3;

import java.util.Random;

public class Equipo implements Runnable {

    private Cuerda cuerda;
    private LadoEquipo lado;
    private Random rand = new Random();

    public Equipo(Cuerda cuerda, LadoEquipo lado) {
        this.cuerda = cuerda;
        this.lado = lado;
    }

    @Override
    public void run() {
        while (true) {
            synchronized (cuerda) {
                if (cuerda.HayGanador())
                    return;

                int fuerza = rand.nextInt(100000);

                cuerda.Tirar(fuerza, lado);
            }

            try {
                Thread.sleep(rand.nextInt(200) + 100);
            } catch (InterruptedException e) {
                return;
            }
        }
    }
}
