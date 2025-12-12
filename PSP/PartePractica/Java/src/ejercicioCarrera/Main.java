package ejercicioCarrera;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

public class Main {

    public static void main(String[] args) {

        final Object lockPrincipal = new Object();  // para esperar a que finalicen los carriles
        final List<Integer> podium = new ArrayList<>();

        // Crear los 4 carriles
        List<Carril> carriles = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            carriles.add(new Carril(i));
        }

        // Por cada carril creamos un hilo carril
        for (Carril carril : carriles) {

            Thread hiloCarril = new Thread(() -> {

                // Creamos un pool de 4 corredores
                ExecutorService executor = Executors.newFixedThreadPool(4);
                List<Corredor> corredoresTemp = new ArrayList<>();

                // 1. Crear los objetos corredor Y asignarlos a su posición
                for (int i = 1; i <= 4; i++) {

                    Corredor corredor = new Corredor(i, carril);

                    int posInicial = switch(i) {
                        case 1 -> 0;
                        case 2 -> 100000;
                        case 3 -> 200000;
                        default -> 300000;
                    };

                    synchronized (carril) {
                        carril.añadirCorredor(corredor, posInicial);

                        if (i == 1) { // primer corredor empieza con el testigo
                            corredor.recibirTestigo();
                        }
                    }

                    corredoresTemp.add(corredor);
                }

                // 2. AHORA sí ejecutamos los corredores
                for (Corredor c : corredoresTemp) {
                    executor.execute(c);
                }

                executor.shutdown();

                try {
                    executor.awaitTermination(5, TimeUnit.MINUTES);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                // 3. El carril ha terminado → notificamos al hilo principal
                synchronized (lockPrincipal) {
                    podium.add(carril.getId());
                    System.out.println("Carril " + carril.getId() + " ha finalizado la carrera. Notificamos a hilo principal.");
                    lockPrincipal.notify();
                }

            });

            hiloCarril.start();
        }

        // --------------------------
        //   Hilo principal esperará
        // --------------------------

        int orden = 1;

        while (orden <= 4) {
            synchronized (lockPrincipal) {
                try {
                    lockPrincipal.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                int carrilFinalizado = podium.get(orden - 1);
                System.out.println("PODIUM: Posición " + orden + "º para el equipo de carril " + carrilFinalizado);
                orden++;
            }
        }

        System.out.println("=== Todos los carriles finalizaron la carrera ===");
    }
}
