package ejercicio85;

import java.util.Random;

public class Productor implements Runnable{
    private final Contenedor contenedor;
    private final String variedad;
    private final int intensidad;

    public Productor(Contenedor contenedor, String variedad, int intensidad) {
        this.contenedor = contenedor;
        this.variedad = variedad;
        this.intensidad = intensidad;
    }

    @Override
    public void run() {
        Random random = new Random();
        while(true){
            try{
                Thread.sleep(random.nextInt(1000)+500);
            }catch(InterruptedException e){
                e.printStackTrace();
            }
            contenedor.AddCapsula(new Capsula(variedad, intensidad));
        }
    }
}
