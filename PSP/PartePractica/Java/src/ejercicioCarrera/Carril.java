package ejercicioCarrera;

import java.util.ArrayList;
import java.util.List;

public class Carril {
    private List<Corredor> corredores = new ArrayList<>(4);
    private List<Integer> positions = new ArrayList<>(4);
    private final int longitud = 400000;
    private final int id;

    public Carril(int id) {
        this.id = id;
    }
    public synchronized int getId() {
        return id;
    }

    public synchronized boolean añadirCorredor(Corredor corredor, int position) {
        if (position < 0 || position > longitud) return false;
        if (corredor == null) return false;
        if (corredores.contains(corredor)) return false;

        corredores.add(corredor);
        positions.add(position);
        return true;
    }

    public synchronized boolean avanzarCorredor(int idCorredor) {
        int posActual = obtenerPosicion(idCorredor);
        if (posActual == -1) return false;

        int nextPos = posActual + 1;

        if (nextPos < longitud && !HayCorredorAqui(nextPos)) {
            Corredor corredor = getCorredorById(idCorredor);
            setPosition(corredor, nextPos);
            return true;
        }

        return false;
    }

    public synchronized boolean HayCorredorAqui(int pos) {
        return positions.contains(pos);
    }

    public synchronized void setPosition(Corredor corredor, int newPosition) {
        for (int i = 0; i < corredores.size(); i++) {
            if (corredores.get(i) == corredor) {
                positions.set(i, newPosition);
                return;
            }
        }
    }

    public synchronized Corredor getCorredorAt(int pos) {
        for (int i = 0; i < positions.size(); i++) {
            if (positions.get(i) == pos) {
                return corredores.get(i);
            }
        }
        return null;
    }

    public synchronized Corredor puedePasarTestigo(int idCorredor) {
        int pos = obtenerPosicion(idCorredor);
        return getCorredorAt(pos + 1);
    }

    public synchronized Corredor getCorredorById(int idCorredor) {
        for (Corredor c : corredores) {
            if (c.getIdCorredor() == idCorredor)
                return c;
        }
        return null;
    }

    public synchronized int obtenerPosicion(int idCorredor) {
        for (int i = 0; i < corredores.size(); i++) {
            if (corredores.get(i).getIdCorredor() == idCorredor) {
                return positions.get(i);
            }
        }
        return -1;
    }

    public synchronized int getLongitud() {
        return longitud;
    }
}
