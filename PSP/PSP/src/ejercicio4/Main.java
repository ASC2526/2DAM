package ejercicio4;

import java.util.Random;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rand = new Random();
        int randomNumber = rand.nextInt(10) + 10;
        System.out.println("Pulsa enter cuando creas que el contador ha llegado a " + randomNumber);
        JuegoContador jc = new JuegoContador();
        Thread t = new Thread(jc);
        t.start();

        sc.nextLine();
        jc.parar();
        try {
            t.join();
        } catch (InterruptedException e) {
            return;
        }

        int numFinal = jc.getContador();
        if (numFinal == randomNumber) {
            System.out.println("Lo conseguiste!");
        } else  {
            System.out.println("Inténtalo de nuevo, has parado en el número " + numFinal);
        }
    }
}