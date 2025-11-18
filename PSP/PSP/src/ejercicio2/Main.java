package ejercicio2;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduce el número de hilos a crear: ");
        int n1 = sc.nextInt();

        for (int i = 1; i <= n1; i++)
        {
            Runnable r = new HiloPrimos("Hilo " + i);
            Thread t = new Thread(r);
            t.start();
        }
    }
}