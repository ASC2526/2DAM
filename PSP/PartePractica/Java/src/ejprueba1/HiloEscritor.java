package ejprueba1;

public class HiloEscritor implements Runnable {
    private MonitorPalabra m;
    public HiloEscritor(MonitorPalabra m) { this.m = m;}
    @Override
    public void run() {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        synchronized (m) {
            m.palabra = "Hola";
            m.notify();
        }
    }
}
