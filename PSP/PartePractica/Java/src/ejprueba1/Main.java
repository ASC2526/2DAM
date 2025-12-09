package ejprueba1;

public class Main {
    public static void main(String[] args) {
        MonitorPalabra m = new MonitorPalabra();

        HiloEscritor h = new HiloEscritor(m);
        HiloLector hl = new HiloLector(m);
        Thread hilo1 = new Thread(h);
        Thread hilo2 = new Thread(hl);
        hilo1.start();
        hilo2.start();
    }
}
