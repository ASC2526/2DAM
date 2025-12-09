package ejPruebaPingPong;

public class Pong implements Runnable {
    MonitorTurno m;
    public Pong(MonitorTurno m) { this.m = m; }
    @Override
    public void run() {
        while (m.turno < 10) {
            synchronized(m) {
                while (m.turnoPing) {
                    try {
                        m.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
            synchronized(m) {
                if (m.turno >= 10)
                    return;

                m.turno++;
                System.out.println("Pong");
                m.turnoPing = true;
                m.notify();
            }
        }
    }
}
