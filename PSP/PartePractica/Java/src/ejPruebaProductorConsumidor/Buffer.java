package ejPruebaProductorConsumidor;

public class Buffer {
    public Integer valor = null;

    public synchronized void poner(int v) {
        while (valor != null) {
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        valor = v;
        this.notifyAll();
    }
    public synchronized Integer tomar() {
        while (valor == null) {
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.notifyAll();
        int valorTomado = valor;
        valor = null;
        return valorTomado;
    }
}
