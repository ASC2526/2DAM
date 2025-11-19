package ejercicio3solucion2;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {
    /* En esta solución cada jugador sabe quién es el jugador siguiente y el anterior. El objeto pelota
    actúa como monitor. Sobre este monitor todos los hilos hacen wait/notify. Esto implica que, cuando un jugador
    quiere despertar al siguiente porque le ha pasado la pelota, en realidad despierta a todos. Puesto que utilizamos
    bucles, aquellos jugadores que no tienen la pelota volverán a suspenderse.
    * */

    public static void main(String[] args) {

        System.out.println("Introduce el número de jugadores: ");
        Scanner sc = new Scanner(System.in);
        int numJugadores = sc.nextInt();

        ArrayList<Jugador> jugadores= new ArrayList<>();

        // Creamos los jugadores
        Pelota p = new Pelota();
        for(int i = 1; i <= numJugadores; i++){
            Jugador j = new Jugador("Jugador " + i, p);
            jugadores.add(j);
        }

        // Establecemos el orden de los jugadores
        for(int i = 0; i < numJugadores; i++){
            if(i < numJugadores - 1){
                jugadores.get(i).setSiguienteJugador(jugadores.get(i+1));

            } else {
                // Caso del último jugador
                jugadores.get(i).setSiguienteJugador(jugadores.get(0)); // Para el último jugador el siguiente es el primero
            }
        }

        // El jugador inicial tiene la pelota. Es importante decorle al primer jugador que tiene la pelota antes de lanzar el hilo.
        // De otro modo podrían entrar en su wait.
        jugadores.get(0).recibePelota();

        // Lanzamos los hilos con un thread pool
        ExecutorService es = Executors.newCachedThreadPool();
        for(Jugador j: jugadores){
            es.execute(j);
        }


    }
}
