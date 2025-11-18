package ejercicio3;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduce el número de hilos a crear: ");
        int n1 = sc.nextInt();

        List<Thread> listaHilos = new ArrayList<>();

        for (int i = 1; i <= n1; i++) {
            Runnable r = new StatusHiloPrimos("Hilo " + i);
            Thread t = new Thread(r,  "Hilo " + i);
            listaHilos.add(t);
            t.start();
        }

        boolean quedanHilosVivos = true;

        while (quedanHilosVivos) {
            for (Thread t : listaHilos) {
                System.out.println(t.getId() + " " + t.getName() + " " + t.getState());
            }

            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            quedanHilosVivos = false;
            for (Thread t : listaHilos) {
                if (t.isAlive()) {
                    quedanHilosVivos = true;
                }
            }
        }

        System.out.println("Todos los hilos han finalizado.");
    }

}