package ejercicio1.a;

import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduce n1");
        int n1 =  sc.nextInt();
        System.out.println("Introduce n2");
        int n2 =  sc.nextInt();

        Runnable contador = new ContadorRunable(n1, n2);
        Thread thread1 = new Thread(contador);
        thread1.start();
        System.out.println("El hilo se ha lanzado");

    }
}

