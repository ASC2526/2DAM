package ejercicioExamen;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduce el número de jugadores:");
        int numJugadores = sc.nextInt();

        Pelota pelota = new Pelota();
        ArrayList<Jugador> jugadores = new ArrayList<Jugador>();
        for (int i = 1; i <= numJugadores; i++) {
            Jugador j = new Jugador("Jugador " + i, pelota);
            jugadores.add(j);
        }

        for (int i = 0; i < numJugadores; i++) {
            if(i < numJugadores - 1)
            {
                jugadores.get(i).setSiguienteJugador(jugadores.get(i+1));
            }
            else {
                jugadores.get(i).setSiguienteJugador(jugadores.get(0));
            }
        }

        jugadores.get(0).recibirPelota();

        ExecutorService es = Executors.newCachedThreadPool();
        for(Jugador j: jugadores){
            es.execute(j);
        }

        System.out.println("Pulsa ENTER para detener el juego...");
        sc.nextLine();
        sc.nextLine();

        Jugador.detener = true;


        synchronized (pelota) {
            pelota.notifyAll();
        }

        es.shutdownNow();
        System.out.println("Juego detenido.");

    }
}
