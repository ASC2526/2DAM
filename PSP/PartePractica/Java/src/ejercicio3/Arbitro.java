package ejercicio3;

public class Arbitro implements Runnable {

    private final Cuerda cuerda;

    public Arbitro(Cuerda cuerda) {
        this.cuerda = cuerda;
    }

    @Override
    public void run() {
        while (true) {
            synchronized (cuerda) {

                if (cuerda.HayGanador())
                    return;

                try {
                    cuerda.wait();
                } catch (InterruptedException e) {
                    return;
                }
            }
        }
    }
}
