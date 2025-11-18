package ejercicio5;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class EscritorFicheroHolas {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Indica cada cuántos segundos quieres que se guarde el saludo: ");
        int saludoSecs = sc.nextInt();
        sc.nextLine();

        Runnable r = () -> {
            try (BufferedWriter bw = new BufferedWriter(new FileWriter("saludos.txt", true))) {

                while (!Thread.currentThread().isInterrupted()) {
                    bw.write("¡Hola mundo!");
                    bw.newLine();
                    bw.flush();

                    TimeUnit.SECONDS.sleep(saludoSecs);
                }

            } catch (InterruptedException e) {
                System.out.println("Hilo interrumpido");
            } catch (IOException e) {
                System.out.println("Error escribiendo en el archivo");
            }

            System.out.println("¡Adiós!");
        };

        Thread t = new Thread(r);
        t.start();

        System.out.println("Pulsa enter para interrumpir el hilo:");
        sc.nextLine();

        System.out.println("Interrumpiendo hilo");
        t.interrupt();

        try {
            t.join();
        } catch (InterruptedException e) {
            return;
        }
    }
}
