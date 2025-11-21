package ejercicio1Carpetas;

import java.time.LocalTime;

public class RegistroCambio {
    private String ruta;
    private long tamaño;
    private long variacion;
    private LocalTime hora;

    public RegistroCambio(String ruta, long tamaño, long variacion) {
        this.ruta = ruta;
        this.tamaño = tamaño;
        this.variacion = variacion;
        this.hora = LocalTime.now();
    }

    @Override
    public String toString() {
        return hora + " " + ruta + " "
                + formatBytes(tamaño) + " ("
                + (variacion > 0 ? "+" : "") + formatBytes(variacion) + ")";
    }

    private String formatBytes(long bytes) {
        if (bytes < 1024) return bytes + " B";
        if (bytes < 1024*1024) return (bytes / 1024) + " KB";
        return (bytes / (1024*1024)) + " MB";
    }

    public String getRuta() { return ruta; }
    public long getTamaño() { return tamaño; }
    public long getVariacion() { return variacion; }
    public LocalTime getHora() { return hora; }
}
