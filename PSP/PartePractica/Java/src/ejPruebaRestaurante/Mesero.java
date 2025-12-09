package ejPruebaRestaurante;

import java.util.Random;

public class Mesero implements Runnable {
    private final Mostrador m;
    private final int idMesero;
    private final Random random = new Random();
    public Mesero(Mostrador m, int idMesero) {
        this.m = m;
        this.idMesero = idMesero;
    }

    @Override
    public void run() {
        for (int i = 1; i <= 10; i++) {
            synchronized (m) {
                while (m.GetCapacity() >= m.GetMaxCapacity()) {
                    try {
                        System.out.println("El mostrador está lleno," +
                                " el mesero espera a que haya hueco");
                        m.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                int idCliente = random.nextInt(30)+1;
                Pedido p = new Pedido(i, idCliente, idMesero);
                m.addPedido(p);
                System.out.println(p.ToString());
            }
            try {
                Thread.sleep(random.nextInt(2000)+500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("El mesero " + idMesero + " ha terminado");
    }
}
