package ejPruebaPingPongPang;

public class Ping implements Runnable {
    MonitorTurno m;
    public Ping(MonitorTurno m) {
        this.m = m;
    }
    @Override
    public void run() {
        while(m.turno < m.total) {
            synchronized (m) {
                while(m.quienToca != 0){
                    try {
                        m.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
            synchronized (m) {
                m.turno++;
                if (m.turno >= m.total)
                    return;
                System.out.println("Ping");
                m.quienToca++;
                m.notifyAll();
            }
        }
    }
}
