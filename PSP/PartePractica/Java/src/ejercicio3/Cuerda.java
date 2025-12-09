package ejercicio3;

public class Cuerda {

    private int pañueloPos = 0;
    private long fuerzaA = 0;
    private long fuerzaB = 0;

    public Cuerda() {}

    public synchronized void Tirar(int fuerza, LadoEquipo lado) {

        if (lado == LadoEquipo.A_IZQUIERDO)
            fuerzaA += fuerza;
        else
            fuerzaB += fuerza;

        pañueloPos = (int)((fuerzaA - fuerzaB) / 100000);

        if (pañueloPos < -50) pañueloPos = -50;
        if (pañueloPos > 50) pañueloPos = 50;

        notifyAll();
    }

    public synchronized int GetPañueloPos() {
        return pañueloPos;
    }

    public synchronized boolean HayGanador() {
        return pañueloPos == -50 || pañueloPos == 50;
    }

    public synchronized LadoEquipo ObtenerGanador() {
        if (pañueloPos == -50) return LadoEquipo.A_IZQUIERDO;
        if (pañueloPos == 50) return LadoEquipo.B_DERECHO;
        return null;
    }
}
