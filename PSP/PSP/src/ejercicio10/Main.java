package ejercicio10;

import java.util.Scanner;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class Main{
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("¿Cada cuántos segundos quieres que se tomen capturas?");
        int segundosCapturas = sc.nextInt();
        System.out.println("¿En qué directorio quieres que se guarden?");
        String directorio = sc.next();

        ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);
        Capturador capturador = new Capturador(directorio);
        Runnable r = () -> capturador.RealizaCaptura();
        executor.scheduleAtFixedRate(r, 0, segundosCapturas, TimeUnit.SECONDS);

        System.out.println("Pulsa ENTER para detener las capturas...");
        sc.nextLine();
        sc.nextLine();
        executor.shutdown();
        System.out.println("Capturador detenido.");
    }
}
