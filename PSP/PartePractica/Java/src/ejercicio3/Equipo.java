package ejercicio3;

import java.util.Random;

public class Equipo implements Runnable{
    public Cuerda cuerda;
    public LadoEquipo ladoEquipo;

    public Equipo(Cuerda cuerda, LadoEquipo ladoEquipo) {
        this.cuerda = cuerda;
        this.ladoEquipo = ladoEquipo;
    }
    @Override
    public void run() {
        Random random = new Random();
        while(!cuerda.HayGanador())
        {
            int fuerzaAplicada = random.nextInt(1)+1;
            cuerda.Tirar();
            synchronized (cuerda)
            {
                cuerda.notify();
            }

        }
    }
}
