package ejercicio3;

import java.util.concurrent.*;

public class Main {

    public static void main(String[] args) {
        Cuerda cuerda = new Cuerda();
        Equipo a = new Equipo(cuerda, LadoEquipo.A_IZQUIERDO);
        Equipo b = new Equipo(cuerda, LadoEquipo.B_DERECHO);

        Thread t1 = new Thread(a);
        Thread t2 = new Thread(b);

        t1.start();
        t2.start();

        ScheduledExecutorService ses = Executors.newScheduledThreadPool(1);
        ses.scheduleAtFixedRate(()->{
            String linea = "";
            for(int i = -50; i < 50; i++){
                linea += i == cuerda.GetPañueloPos() ? "P" : "-";
            }
            System.out.println(linea);
        }, 0, 1, TimeUnit.SECONDS);
        while(!cuerda.HayGanador()){
            try {
                cuerda.wait();
            }catch (InterruptedException e){
                e.printStackTrace();
            }
        }
        System.out.println("El ganador es: " + cuerda.ObtenerGanador());
        ses.shutdownNow();

    }
}
