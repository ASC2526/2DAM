package ejercicio8;

public class Consumidor extends Thread {
    private final Contenedor contenedor;

    public Consumidor(Contenedor contenedor) {
        this.contenedor = contenedor;
    }

    @Override
    public void run() {
        while (true) {
            contenedor.empaquetarCapsulas();
            try { //b
                Thread.sleep((int) (1000 + Math.random() * 2000));
            } catch (InterruptedException e) {
                e.printStackTrace();
            } //b
        }
    }

}

