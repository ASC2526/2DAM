package ejercicio3;

public class Cuerda {
    private int pañueloPos = 0;
    public int FuerzaTotalA = 0;
    public int FuerzaTotalB = 0;

    public Cuerda() {}
    public void synchronized Tirar(int fuerza, LadoEquipo lado)
    {
        if(lado == LadoEquipo.A_IZQUIERDO)
        {
            FuerzaTotalA += fuerza;
        }
        if(lado == LadoEquipo.B_DERECHO)
        {
            FuerzaTotalB += fuerza;
        }
        pañueloPos = (FuerzaTotalA - FuerzaTotalB) / 100000;
    }

    public int GetPañueloPos(){
        return pañueloPos;
    }
    public synchronized boolean HayGanador()
    {
        if (pañueloPos == -50 || pañueloPos == 50)
            return true;
        return false;
    }
    public synchronized LadoEquipo ObtenerGanador()
    {
        if (HayGanador())
        {
            if (pañueloPos == -50)
                return LadoEquipo.A_IZQUIERDO;

            if (pañueloPos == 50)
                return LadoEquipo.B_DERECHO;
        }
        return null;
    }
}
