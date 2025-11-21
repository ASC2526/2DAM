package ejercicioCarrera;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Introduce el número de corredores: ");
        int numCorredores;
        try {
            numCorredores = Integer.parseInt(sc.nextLine().trim());
        } catch (NumberFormatException e) {
            System.out.println("Número inválido. Saliendo.");
            return;
        }
        if (numCorredores <= 0) {
            System.out.println("Tiene que haber al menos 1 corredor. Saliendo.");
            return;
        }

        Testigo testigo = new Testigo();
        List<Corredor> corredores = new ArrayList<>(numCorredores);

        // Crear corredores
        for (int i = 1; i <= numCorredores; i++) {
            Corredor c = new Corredor("Corredor " + i, testigo);
            corredores.add(c);
        }

        // Establecer siguiente corredor (circular)
        for (int i = 0; i < numCorredores; i++) {
            if (i < numCorredores - 1) {
                corredores.get(i).setCorredorSiguiente(corredores.get(i + 1));
            } else {
                corredores.get(i).setCorredorSiguiente(corredores.get(0));
            }
        }

        // El primer corredor empieza con el testigo
        synchronized (testigo) {
            corredores.get(0).recibirTestigo();
        }

        // Creamos un único ExecutorService y lanzamos una vez todos los corredores
        ExecutorService executor = Executors.newFixedThreadPool(numCorredores);
        for (Corredor c : corredores) {
            executor.execute(c);
        }

        // Esperamos a que la carrera termine (política de espera)
        while (!Corredor.finCarrera) {
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                // ignorar
            }
        }

        // Cuando finCarrera == true, garantizamos que todos los hilos despierten
        synchronized (testigo) {
            testigo.notifyAll();
        }

        // Apagamos el executor y esperamos terminación
        executor.shutdown();
        try {
            if (!executor.awaitTermination(5, TimeUnit.SECONDS)) {
                executor.shutdownNow();
            }
        } catch (InterruptedException e) {
            executor.shutdownNow();
        }

        System.out.println("Carrera finalizada");
    }
}
