package ejercicio9;

import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        ExecutorService exec = Executors.newFixedThreadPool(2);

        while (true) {

            System.out.println("Ingresa el número de dados a lanzar (o 0 para salir):");
            int numDados = sc.nextInt();

            if (numDados == 0) {
                System.out.println("Saliendo...");
                break;
            }

            int[] resultadosDeseados = new int[numDados];

            System.out.println("Introduce los resultados que quieras obtener:");

            for (int i = 0; i < numDados; i++) {
                resultadosDeseados[i] = sc.nextInt();
            }

            System.out.println("Tirando dados hasta conseguirlo...");

            Partida partida = new Partida(numDados, resultadosDeseados);

            exec.execute(partida);

            System.out.println("Partida lanzada. Puedes iniciar otra o poner 0 para salir.");
        }

        exec.shutdown();
        System.out.println("Programa finalizado.");
    }
}
