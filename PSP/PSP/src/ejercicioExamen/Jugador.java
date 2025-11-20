package ejercicioExamen;

public class Jugador implements Runnable {
    private String nombre;
    private Pelota pelota;
    private Jugador siguiente;
    public static boolean[] detener = new boolean[]{false};


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
    private boolean getTienePelota() {
        return tienePelota;
    }

    @Override
    public void run() {
        while(!detener[0]) {
            synchronized (pelota) {
                while(!tienePelota && !detener[0]) {
                    try {
                        pelota.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
            System.out.println(nombre + ": " + pelota.toString());
            try {
                Thread.sleep(4000);
            } catch (InterruptedException e) {
                e.printStackTrace();
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
