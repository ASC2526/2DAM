package ejercicio1Carpetas;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class MonitorCarpeta implements Runnable {

    private File carpeta;
    private boolean detenido = false;

    private long tamañoAnterior = -1;

    private List<RegistroCambio> historico = new ArrayList<>();

    public MonitorCarpeta(String ruta) {
        this.carpeta = new File(ruta);
    }

    public String getRuta() {
        return carpeta.getAbsolutePath();
    }

    public List<RegistroCambio> getHistorico() {
        return historico;
    }

    public void detener() {
        detenido = true;
    }

    @Override
    public void run() {
        while (!detenido) {
            long tamañoActual = getFolderSize(carpeta);

            if (tamañoAnterior != -1 && tamañoActual != tamañoAnterior) {

                long variacion = tamañoActual - tamañoAnterior;
                RegistroCambio cambio = new RegistroCambio(
                        carpeta.getAbsolutePath(),
                        tamañoActual,
                        variacion
                );
                historico.add(cambio);
                System.out.println(cambio);
            }

            tamañoAnterior = tamañoActual;

            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                break;
            }
        }
    }

    private long getFolderSize(File folder) {
        long length = 0;
        File[] files = folder.listFiles();
        if (files == null) return 0;

        for (File f : files) {
            if (f.isFile())
                length += f.length();
            else
                length += getFolderSize(f);
        }
        return length;
    }
}
