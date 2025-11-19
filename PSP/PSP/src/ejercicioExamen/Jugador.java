package ejercicioExamen;

public class Jugador implements Runnable {
    private int indice = 0;
    private int turnoActual = 0;

    public Jugador(int indice, int turnoActual) {
        this.nombre = nombre;
        this.pelota = pelota;
    }

    @Override
    public void run() {
        while(pelota == null) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println(nombre + ": " + pelota.toString());
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        this.PasarPelota();
    }

    public boolean tienePelota() {
        return pelota != null;
    }

    public synchronized void PasarPelota(Jugador jugador)
    {
        if(pelota != null)
        {
            if(!jugador.tienePelota())
            {
                jugador.pelota = pelota;
                pelota = null;
                jugador.notify();
            }
        }
    }

}
