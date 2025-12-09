package ejPruebaRestaurante;

import java.util.Random;

public class Cocinero implements Runnable {
    private final Mostrador m;
    private final int idCocinero;
    Random r = new Random();

    public Cocinero(Mostrador m, int idCocinero) {
        this.m = m;
        this.idCocinero = idCocinero;
    }

    @Override
    public void run() {
        while (true) {
            Pedido p;

            synchronized (m) {
                while (m.GetCapacity() == 0) {
                    try {
                        m.wait();
                        System.out.println("El mostrador está vacío, el cocinero espera");
                    } catch (InterruptedException e) {
                        return;
                    }
                }
                p = m.retirarPedido();
            }

            System.out.println("Cocinero " + idCocinero + " cocina pedido "
                    + p.getIdPedido() + " (Cliente " + p.getIdCliente() + ")");

            try {
                Thread.sleep(r.nextInt(2000) + 500);
            } catch (InterruptedException e) {
                return;
            }

            System.out.println("Cocinero " + idCocinero + " sirve el pedido "
                    + p.getIdPedido() + " del Cliente " + p.getIdCliente());

            if (m.getNumPedidosRealizados() >= 30) {
                System.out.println("Cocinero " + idCocinero + ": No quedan pedidos. Terminando.");
                return;
            }
        }
    }
}
