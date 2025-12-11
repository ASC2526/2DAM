package ejercicioExamenCuerda;

public class Cuerda {
    private int pañueloPos = 0;
    private int fuerzaTotalA;
    private int fuerzaTotalB;
    public Cuerda() {}

    public synchronized void Tirar(int fuerzaAplicada, LadoEquipo lado) {
        if(lado == LadoEquipo.A_IZQUIERDO) {
            fuerzaTotalA += fuerzaAplicada;
        }
        if(lado == LadoEquipo.B_DERECHO) {
            fuerzaTotalB += fuerzaAplicada;
        }
        pañueloPos = (fuerzaTotalA - fuerzaTotalB) / 100000;
    }

    public synchronized boolean HayGanador(){
        if(pañueloPos == -50 || pañueloPos == 50)
            return true;
        return false;
    }

    public synchronized LadoEquipo ObtenerGanador()
    {
        if (HayGanador())
        {
            if (pañueloPos == -50)
                return  LadoEquipo.A_IZQUIERDO;
            else if (pañueloPos == 50)
                return  LadoEquipo.B_DERECHO;
        }
        return null;
    }

    public int getPañueloPos()
    {
        return pañueloPos;
    }
}
