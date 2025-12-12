package ejercicioCarrera;

public class Corredor implements Runnable {

    private final int idCorredor;
    private final Carril carril;
    private boolean tieneTestigo = false;
    private boolean haTerminado = false;

    public Corredor(int idCorredor, Carril carril) {
        this.idCorredor = idCorredor;
        this.carril = carril;
    }

    public synchronized int getIdCorredor() {
        return idCorredor;
    }

    public synchronized void recibirTestigo() {
        tieneTestigo = true;
    }

    public synchronized void perderTestigo() {
        tieneTestigo = false;
    }

    @Override
    public void run() {

        synchronized (carril) {
            if (!tieneTestigo) {
                System.out.println("Carril " + carril.getId() +
                        " Corredor " + idCorredor + ": A la espera de recibir el testigo");
            }
        }

        while (!haTerminado) {

            synchronized (carril) {

                while (!tieneTestigo && !haTerminado) {
                    try {
                        carril.wait();
                        System.out.println("Carril " + carril.getId() +
                                " Corredor " + idCorredor +
                                ": Me han despertado. " +
                                (tieneTestigo ? "Tengo el testigo" : "No tengo el testigo"));
                    } catch (InterruptedException e) {
                        return;
                    }
                }

                if (haTerminado) return;

                System.out.println("Carril " + carril.getId() +
                        " Corredor " + idCorredor +
                        ": Tengo el testigo y empiezo a correr");
            }

            // Correr
            while (true) {

                synchronized (carril) {

                    Corredor siguiente = carril.puedePasarTestigo(idCorredor);

                    if (siguiente != null) {
                        this.perderTestigo();
                        siguiente.recibirTestigo();
                        System.out.println("Carril " + carril.getId() +
                                " Corredor " + idCorredor + ": Pierdo el testigo");
                        System.out.println("Carril " + carril.getId() +
                                " Corredor " + siguiente.getIdCorredor() + ": Recibo el testigo");

                        carril.notifyAll();
                        return;
                    }

                    boolean pudoAvanzar = carril.avanzarCorredor(idCorredor);

                    if (!pudoAvanzar) {
                        int pos = carril.obtenerPosicion(idCorredor);
                        if (pos >= carril.getLongitud() - 1) {

                            System.out.println("Carril " + carril.getId() +
                                    " Corredor " + idCorredor +
                                    ": He terminado de correr. Posición final: " + pos);

                            this.perderTestigo();
                            haTerminado = true;
                            carril.notifyAll();
                            return;
                        }
                    }
                }

                Thread.yield();
            }
        }
    }
}
