package ejercicioExamenCuerda;

import java.util.Random;

public class Equipo implements Runnable {
    private final Cuerda cuerda;
    private final LadoEquipo ladoEquipo;
    private Random random = new Random();
    public Equipo(Cuerda cuerda,  LadoEquipo ladoEquipo) {
        this.cuerda = cuerda;
        this.ladoEquipo = ladoEquipo;
    }
    @Override
    public void run() {
        while (true) {
            int randomTirada = random.nextInt(1)+1;
            synchronized (cuerda)
            {
                if(cuerda.HayGanador())
                    return;
                cuerda.Tirar(randomTirada, ladoEquipo);
                cuerda.notifyAll();
            }

        }
    }
}
