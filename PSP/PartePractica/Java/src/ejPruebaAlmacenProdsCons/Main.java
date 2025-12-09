package ejPruebaAlmacenProdsCons;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {
    public static void main(String[] args) {

        Almacen almacen = new Almacen();

        ExecutorService pool = Executors.newFixedThreadPool(4);

        pool.execute(new Productor(almacen, 1));
        pool.execute(new Productor(almacen, 2));
        pool.execute(new Productor(almacen, 3));
        pool.execute(new Consumidor(almacen));

        pool.shutdown();
    }
}
