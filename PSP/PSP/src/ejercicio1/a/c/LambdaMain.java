package ejercicio1.a.c;

import java.util.Random;
import java.util.Scanner;

public class LambdaMain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduce n1");
        int n1 =  sc.nextInt();
        System.out.println("Introduce n2");
        int n2 =  sc.nextInt();

        Runnable r = () -> {
            Random random = new Random();
            for (int i = n1; i <= n2; i++) {
                System.out.println(i);

                try {
                    Thread.sleep(random.nextInt(1000) + 1);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        };
        Thread t = new Thread(r);
        t.start();
        System.out.println("El hilo se ha lanzado");
    }
}