package ejercicio7;

public class Vehiculo {
    private Motor motor = null;
    private Bateria bateria = null;
    private Carroceria carroceria = null;

    public synchronized void ensamblarMotor(Motor motor) {
        while (carroceria == null)
        {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.motor = motor;
    }

    public synchronized void ensamblarBateria(Bateria bateria) {
        while (carroceria == null)
        {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.bateria = bateria;
    }

    public synchronized void ensamblarCarroceria(Carroceria carroceria) {
        this.carroceria = carroceria;
        notifyAll();
    }

    public Motor getMotor() {
        return motor;
    }

    public Bateria getBateria() {
        return bateria;
    }

    public Carroceria getCarroceria() {
        return carroceria;
    }

    @Override
    public String toString() {
        return "Vehiculo{" +
                "motor=" + motor +
                ", bateria=" + bateria +
                ", carroceria=" + carroceria +
                '}';
    }
}