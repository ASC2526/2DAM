package ejercicio8;

public class Main {
    public static void main(String[] args) {
        Contenedor contenedor = new Contenedor();
        Consumidor consumidor = new Consumidor(contenedor);

        for (int i = 1; i <= 4; i++) {
            new Productor(contenedor, "Arábica", 7).start();
        } //c

        consumidor.start();
    }
}


