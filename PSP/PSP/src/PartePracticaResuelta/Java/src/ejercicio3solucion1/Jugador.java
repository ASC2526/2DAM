package ejercicio3solucion1;

public class Jugador implements Runnable {

    private String nombre;
    private Pelota p = null;
    private Jugador siguienteJugador;

    private Object monitorAnterior;
    private Object monitorSiguiente;

    public Jugador(String nombre){
        this.nombre = nombre;
    }

    public void setMonitorAnterior(Object m1){
        monitorAnterior  = m1;
    }

    public void setMonitorSiguiente(Object m2){
        monitorSiguiente = m2;
    }

    public void setSiguienteJugador(Jugador siguienteJugador){
        this.siguienteJugador = siguienteJugador;
    }
    public void recibePelota(Pelota p){
        this.p = p;
    }

    private void pierdePelota(){
        this.p = null;
    }


    @Override
    public void run() {
        while(true){

            synchronized (monitorAnterior) {
                while (p == null) { // No tengo la pelota
                    try {
                        monitorAnterior.wait();
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }
            }

            // Ya tengo la pelota. Muestro el mensaje.
            System.out.println(nombre+ ": " + p);

            // Hacemos la espera de 4 segundos
            try {
                Thread.sleep(4000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            // Pasamos la pelota al siguiente jugador, si existe
            if (siguienteJugador != null) {
                siguienteJugador.recibePelota(p); // Pasamos la pelota
                pierdePelota(); // Nosotros la perdemos
                synchronized (monitorSiguiente) {
                    monitorSiguiente.notify(); // Notificamos al siguiente jugador
                }
            }

        }
    }
}
