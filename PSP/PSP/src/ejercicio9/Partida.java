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
        int[] resultadosObtenidos = new int[numDados];
        while (true) {
            for(int i = 0; i < numDados; i++) {
                int dado = random.nextInt(6)+1;
                resultadosObtenidos[i] = dado;
            }
            if(!Arrays.equals(resultadosDeseados, resultadosObtenidos)) {
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            } else  {
                System.out.println("¡Conseguido, los resultados obtenidos para acertar son: " + Arrays.toString(resultadosObtenidos));
                break;
            }
        }
    }
}
