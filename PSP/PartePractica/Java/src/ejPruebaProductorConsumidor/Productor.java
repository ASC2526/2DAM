package ejPruebaProductorConsumidor;

public class Productor implements Runnable {
    private final Buffer buffer;
    public Productor(Buffer buffer) {
        this.buffer = buffer;
    }
    @Override
    public void run() {
        while (true) {
            for (int i = 1; i <= 5; i++) {
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                synchronized (buffer) {
                    buffer.poner(i);
                    System.out.println("Produciendo: " + i);
                    if(i == 5)
                        return;
                }
            }
        }
    }
}
