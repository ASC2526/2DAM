package ejercicio3solucion1;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

public class Main {

    /* En esta solución cada jugador sabe quién es el jugador siguiente y el anterior, además, cada
    * jugador comparte con el jugador siguiente un objeto de tipo Object que actúa de monitor, de forma
    * que cuando un jugador hace notify, solo sale de la suspensión el jugador siguiente.
    * */

    public static void main(String[] args) {


        System.out.println("Introduce el número de jugadores: ");
        Scanner sc = new Scanner(System.in);
        int numJugadores = Integer.parseInt(sc.nextLine());


        ArrayList<Jugador> jugadores= new ArrayList<>();

        for(int i = 1; i <= numJugadores; i++){
            Jugador j = new Jugador("Jugador " + i);
            jugadores.add(j);
        }

        // Establecemos el orden de los jugadores
        for(int i = 0; i < numJugadores; i++){
            if(i < numJugadores - 1){
                jugadores.get(i).setSiguienteJugador(jugadores.get(i+1));
                Object m = new Object(); // Monitor que va a permitir que dos jugadores consecutivos se notifiquen
                jugadores.get(i).setMonitorSiguiente(m);
                jugadores.get(i+1).setMonitorAnterior(m);
            } else {
                // Caso del último jugador
                jugadores.get(i).setSiguienteJugador(jugadores.get(0)); // Para el último jugador el siguiente es el primero
                Object m = new Object();
                jugadores.get(i).setMonitorSiguiente(m);
                jugadores.get(0).setMonitorAnterior(m);
            }

        }

        Pelota p = new Pelota();
        jugadores.get(0).recibePelota(p);

        // Lanzamos los hilos con un thread pool
        ExecutorService es = Executors.newCachedThreadPool();
        for(Jugador j: jugadores){
            es.execute(j);
        }

    }
}
