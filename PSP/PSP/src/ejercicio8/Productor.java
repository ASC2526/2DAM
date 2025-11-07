package ejercicio8;

public class Productor extends Thread {
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
        while (true) {
            try {
                Thread.sleep((int) (500 + Math.random() * 500));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            contenedor.agregarCapsula(new Capsula(variedad, intensidad));
        }
    }
}
