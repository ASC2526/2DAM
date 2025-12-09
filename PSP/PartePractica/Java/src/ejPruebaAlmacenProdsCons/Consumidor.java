package ejPruebaAlmacenProdsCons;

public class Consumidor implements Runnable{
    private final Almacen almacen;
    public Consumidor(Almacen almacen) {
        this.almacen = almacen;
    }
    @Override
    public void run() {
        while (almacen.numCajasRetiradas() < 30)
        {
            synchronized (almacen) {
                while (almacen.getNumProductos() == 0) {
                    try {
                        almacen.wait();
                        System.out.println("El almacén está vacío, Consumidor espera");
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                Producto p = almacen.retirarProducto();
                System.out.println("Consumidor retira Caja " + p.getId() +
                        " del Productor " + p.getIdProductor());
            }
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("Consumidor ha terminado");
    }
}
