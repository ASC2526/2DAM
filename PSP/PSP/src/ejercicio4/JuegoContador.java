package ejercicio4;

public class JuegoContador implements Runnable {
    private int contador;
    private boolean detener = false;

    public JuegoContador() {
        this.contador = 0;
    }
    public void parar() {
        detener = true;
    }
    public int getContador() {
        return contador;
    }
    @Override
    public void run() {
        while (!detener) {
            contador++;
            if (contador <= 5)
            {
                System.out.println(contador);
            }
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                return;
            }
        }
    }
}
