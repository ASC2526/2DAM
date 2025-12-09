package ejPruebaPingPong;

public class Ping implements Runnable {
    MonitorTurno m;

    public Ping(MonitorTurno m) {
        this.m = m;
    }

    @Override
    public void run() {
        while (m.turno < 10) {
            synchronized (m) {
                while (!m.turnoPing) {
                    try {
                        m.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
            synchronized (m) {
                if (m.turno >= 10)
                    return;

                m.turno++;
                System.out.println("Ping");
                m.turnoPing = false;
                m.notify();
            }
        }
    }
}
