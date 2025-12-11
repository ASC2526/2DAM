package ejercicioExamenCuerda;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

public class Main {
    public static void main(String[] args) {
        Cuerda cuerda = new Cuerda();
        Equipo equipoA = new Equipo(cuerda, LadoEquipo.A_IZQUIERDO);
        Equipo equipoB = new Equipo(cuerda, LadoEquipo.B_DERECHO);

        Thread t1 = new Thread(equipoA);
        Thread t2 = new Thread(equipoB);
        t1.start();
        t2.start();

        ScheduledExecutorService ses = Executors.newScheduledThreadPool(1);

        ses.scheduleAtFixedRate(() -> {
            int pos;
            synchronized (cuerda) {
                pos = cuerda.getPañueloPos();
            }

            StringBuilder linea = new StringBuilder();

            for (int i = -50; i <= 50; i++) {
                linea.append(i == pos ? 'P' : '-');
            }

            System.out.println(linea);

        }, 0, 1, TimeUnit.SECONDS);

        synchronized (cuerda){
            while (!cuerda.HayGanador()) {
                try {
                    cuerda.wait();
                } catch (InterruptedException e) {
                    return;
                }
            }
            System.out.println("El ganador es "+ cuerda.ObtenerGanador());
        }


        ses.shutdown();

    }
}
