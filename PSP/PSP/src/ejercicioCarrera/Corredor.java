package ejercicioCarrera;

import java.util.Random;

public class Corredor implements Runnable {
    private final String nombre;
    private final Testigo testigo;
    private boolean tieneTestigo = false;
    private Corredor corredorSiguiente;

    // Variables compartidas entre todos los corredores (visibilidad con volatile)
    public static volatile boolean finCarrera = false;
    public static volatile int vueltasCompletadas = 0;
    public static final int TOTAL_VUELTAS = 3;
    // started indica si ya ha arrancado la primera entrega inicial (no cuenta como vuelta)
    private static volatile boolean started = false;

    public Corredor(String nombre, Testigo testigo) {
        this.nombre = nombre;
        this.testigo = testigo;
    }

    public void setCorredorSiguiente(Corredor corredorSiguiente) {
        this.corredorSiguiente = corredorSiguiente;
    }

    // recibir testigo: se debe llamar dentro de synchronized(testigo) para visibilidad/orden
    public void recibirTestigo() {
        this.tieneTestigo = true;
    }

    // pasar testigo: llamado por el corredor que tiene el testigo
    public void pasarTestigo() {
        this.tieneTestigo = false;
    }

    @Override
    public void run() {
        Random rand = new Random();

        while (!finCarrera) {
            // Esperar hasta que tenga testigo o la carrera termine
            synchronized (testigo) {
                while (!tieneTestigo && !finCarrera) {
                    try {
                        testigo.wait();
                    } catch (InterruptedException e) {
                        // Si nos interrumpen, comprobamos si es finCarrera
                        if (finCarrera) {
                            break;
                        }
                        // si no es finCarrera, continuar esperando
                    }
                }

                if (finCarrera) {
                    // salimos del synchronized y terminamos
                    testigo.notifyAll(); // despertar a otros si hace falta
                    break;
                }

                // Si llegamos aquí, tenemos el testigo
                // Si soy el primer corredor y ya habíamos comenzado, entonces se cuenta una vuelta
                // Necesitamos identificar "primer corredor": lo hacemos por nombre "Corredor 1"
                if ("Corredor 1".equals(nombre)) {
                    if (!started) {
                        // primera vez que Corredor 1 recibe el testigo: marca started pero NO cuenta vuelta
                        started = true;
                    } else {
                        // es una recepción posterior: se completó una vuelta
                        vueltasCompletadas++;
                        System.out.println("--- Vuelta completada " + vueltasCompletadas + " ---");
                        if (vueltasCompletadas >= TOTAL_VUELTAS) {
                            // indicamos fin y despertamos a todos
                            finCarrera = true;
                            testigo.notifyAll();
                            break;
                        }
                    }
                }

                // Mostrar mensaje y salir del synchronized para "correr" fuera del monitor
                System.out.println(nombre + ": " + testigo.toString());
                // Nota: mantenemos la lógica de pasar el testigo fuera del primer synchronized
                // para evitar mantener el monitor innecesariamente durante el sleep
            }

            // Simular correr (1000-2000 ms)
            try {
                Thread.sleep(rand.nextInt(1000) + 1000);
            } catch (InterruptedException e) {
                if (finCarrera) break;
            }

            // Pasar el testigo al siguiente corredor
            if (corredorSiguiente != null) {
                synchronized (testigo) {
                    // cambiar banderas de poseer el testigo
                    this.pasarTestigo();
                    corredorSiguiente.recibirTestigo();
                    // notificar a todos los que esperan sobre el testigo
                    testigo.notifyAll();
                }
            } else {
                // si no hay siguiente (no debería ocurrir) simplemente terminar
                break;
            }
        } // while

        // salida limpia del run
        //System.out.println(nombre + " termina.");
    }
}
