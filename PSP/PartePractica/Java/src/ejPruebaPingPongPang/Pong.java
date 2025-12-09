package ejPruebaPingPongPang;

public class Pong implements Runnable {
    MonitorTurno m;
    public Pong(MonitorTurno m) {
        this.m = m;
    }
    @Override
    public void run() {
        while(m.turno < m.total) {
            synchronized (m) {
                while(m.quienToca != 1){
                    try {
                        m.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
            synchronized (m) {
                if (m.turno >= m.total)
                    return;
                m.turno++;
                System.out.println("Pong");
                m.quienToca++;
                m.notifyAll();
            }
        }
    }
}
