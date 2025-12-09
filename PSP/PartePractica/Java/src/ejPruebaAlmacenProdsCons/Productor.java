package ejPruebaAlmacenProdsCons;

public class Productor implements Runnable {
    private final Almacen almacen;
    private final int Id;
    public Productor(Almacen almacen, int Id) {
        this.almacen = almacen;
        this.Id = Id;
    }
    @Override
    public void run() {
        for (int i = 1; i <= 10; i++) {
            synchronized (almacen) {
                while (almacen.getNumProductos() >= almacen.getMaxCantidad()) {
                    try {
                        almacen.wait();
                        System.out.println("Almacén lleno, Productor " + Id + " espera");
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                Producto producto = new Producto(i, Id);
                almacen.agregarProducto(producto);
                System.out.println("Productor " + Id + " produce Caja " + producto.getId());
            }
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("Productor " + Id + " ha terminado");
    }
}
