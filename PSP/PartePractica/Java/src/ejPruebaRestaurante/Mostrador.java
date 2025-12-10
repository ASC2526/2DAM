package ejPruebaRestaurante;

import java.util.ArrayList;
import java.util.List;

public class Mostrador {
    private final List<Pedido> pedidos = new ArrayList<>();
    private final int maxCapacity = 8;
    private int numPedidosRealizados = 0;

    public Mostrador() {}

    public synchronized int getNumPedidosRealizados() {
        return numPedidosRealizados;
    }

    public synchronized int GetMaxCapacity() {
        return maxCapacity;
    }

    public synchronized int GetCapacity() {
        return pedidos.size();
    }

    public synchronized void addPedido(Pedido pedido) {
        pedidos.add(pedido);
        notifyAll();
    }

    public synchronized Pedido retirarPedido() {
        Pedido p = pedidos.remove(pedidos.size()-1);
        numPedidosRealizados++;
        notifyAll();
        return p;
    }
}
