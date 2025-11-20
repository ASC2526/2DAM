package ejercicio85;

public class Capsula {
    private final String variedad;
    private final int intensidad;

    public Capsula(String variedad, int intensidad) {
        this.variedad = variedad;
        this.intensidad = intensidad;
    }

    public String getVariedad() {
        return variedad;
    }

    public int getIntensidad() {
        return intensidad;
    }
}