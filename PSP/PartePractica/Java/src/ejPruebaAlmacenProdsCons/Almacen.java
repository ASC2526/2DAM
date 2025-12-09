package ejPruebaAlmacenProdsCons;

import java.util.ArrayList;
import java.util.List;

public class Almacen {
    private List<Producto> productos = new ArrayList<>();
    private int maxCantidad = 5;
    private int numCajasRetiradas = 0;

    public Almacen() {}

    public synchronized int numCajasRetiradas() {
        return numCajasRetiradas;
    }

    public synchronized int getMaxCantidad() {
        return maxCantidad;
    }
    public synchronized int getNumProductos() {
        return productos.size();
    }
    public synchronized void agregarProducto(Producto producto) {
        productos.add(producto);
        notifyAll();
    }

    public synchronized Producto retirarProducto() {
        Producto p = productos.remove(productos.size() - 1);
        numCajasRetiradas++;
        notifyAll();
        return p;
    }
}
