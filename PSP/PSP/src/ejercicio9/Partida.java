package ejercicio9;

import java.util.*;

class Partida implements Runnable {
    private int numDados;
    private int[] resultadosDeseados;
    private Random random = new Random();

    public Partida(int numDados, int[] resultadosDeseados) {
        this.numDados = numDados;
        this.resultadosDeseados = resultadosDeseados;
    }


    @Override
    public void run() {

    }
}
