package ejercicioExamen;

public class Jugador implements Runnable {
    private String nombre;
    private Pelota pelota;
    private Jugador siguiente;
    public static boolean detener = false;



    public Jugador(String nombre, Pelota pelota) {
        this.nombre = nombre;
        this.pelota = pelota;
    }
    private boolean tienePelota;

    public void pasarPelota() {
        tienePelota = false;
    }
    public void recibirPelota() {
        tienePelota = true;
    }
    public void setSiguienteJugador(Jugador jugador) {
        this.siguiente = jugador;
    }

    @Override
    public void run() {
        while(!detener) {
            synchronized (pelota) {
                while(!tienePelota && !detener) {
                    try {
                        pelota.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                if (detener) { return; }
            }
            System.out.println(nombre + ": " + pelota.toString());
            try {
                Thread.sleep(4000);
            } catch (InterruptedException e) {
                return;
            }
            if(siguiente != null){
                this.pasarPelota();
                siguiente.recibirPelota();
                synchronized (pelota) {
                    pelota.notifyAll();
                }
            }
        }
    }
}
