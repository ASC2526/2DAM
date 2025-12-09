package ejprueba1;

public class HiloLector implements Runnable {
    private MonitorPalabra m;
    public HiloLector(MonitorPalabra m) { this.m = m;}
    @Override
    public void run() {
        synchronized (m) {
            while (m.palabra == null)
            {
                try {
                    m.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("La palabra es " + m.palabra);
        }
    }
}
