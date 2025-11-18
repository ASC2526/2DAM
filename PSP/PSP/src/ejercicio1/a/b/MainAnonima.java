package ejercicio1.a.b;

import java.util.Random;
import java.util.Scanner;

public class MainAnonima {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduce n1");
        int n1 =  sc.nextInt();
        System.out.println("Introduce n2");
        int n2 =  sc.nextInt();

        Runnable r = new Runnable() {
            @Override
            public void run() {
                Random random = new Random();
                for (int i = n1; i <= n2; i++) {
                    System.out.println(i);

                    try {
                        Thread.sleep(random.nextInt(1000) + 1);
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        };
        Thread hilo1 = new Thread(r);
        hilo1.start();
        System.out.println("El hilo se ha lanzado");
    }
}