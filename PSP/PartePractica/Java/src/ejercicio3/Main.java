package ejercicio3;

import java.util.concurrent.*;

public class Main {

    public static void main(String[] args) {

        Cuerda cuerda = new Cuerda();

        Equipo equipoA = new Equipo(cuerda, LadoEquipo.A_IZQUIERDO);
        Equipo equipoB = new Equipo(cuerda, LadoEquipo.B_DERECHO);

        ExecutorService pool = Executors.newFixedThreadPool(2);
        pool.execute(equipoA);
        pool.execute(equipoB);

        Thread arbitro = new Thread(new Arbitro(cuerda));
        arbitro.start();

        ScheduledExecutorService ses = Executors.newScheduledThreadPool(1);

        ses.scheduleAtFixedRate(() -> {
            int pos = cuerda.GetPañueloPos();
            StringBuilder sb = new StringBuilder();

            for (int i = -50; i <= 50; i++) {
                if (i == pos)
                    sb.append("P");
                else
                    sb.append("-");
            }

            System.out.println(sb);

        }, 0, 1, TimeUnit.SECONDS);


        try {
            arbitro.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("\nGANADOR: " + cuerda.ObtenerGanador());

        pool.shutdownNow();
        ses.shutdownNow();
    }
}
