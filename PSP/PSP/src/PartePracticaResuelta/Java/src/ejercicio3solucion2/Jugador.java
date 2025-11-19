package ejercicio3solucion2;

public class Jugador implements Runnable {

    private String nombre;
    private Pelota pelota = null;
    private Jugador siguienteJugador;

    private boolean tengoPelota;

    public Jugador(String nombre, Pelota pelota){
        this.nombre = nombre;
        this.pelota = pelota;
    }

    public void setSiguienteJugador(Jugador siguienteJugador){
        this.siguienteJugador = siguienteJugador;
    }
    public void recibePelota(){
        tengoPelota = true;
    }
    public void pasaPelota(){
        tengoPelota = false;
    }
    private boolean getTienePelota(){
        return tengoPelota;
    }

    @Override
    public void run() {
        while(true){

            synchronized (pelota) {
                while (!tengoPelota) { // No tengo la pelota
                    try {
                        pelota.wait();
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }
            }

            // Ya tengo la pelota. Muestro el mensaje.
            System.out.println(nombre+ ": " + pelota);

            // Hacemos la espera de 4 segundos
            try {
                Thread.sleep(4000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            // Pasamos la pelota al siguiente jugador, si existe
            if (siguienteJugador != null) {
                siguienteJugador.recibePelota(); // Pasamos la pelota y el siguiente jugador la recibe
                pasaPelota(); // Nosotros la perdemos
                synchronized (pelota){
                    pelota.notifyAll(); // Notificamos a todos los jugadores
                }
            }

        }
    }
}
