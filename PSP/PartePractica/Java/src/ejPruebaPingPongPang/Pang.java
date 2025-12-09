package ejPruebaPingPongPang;

public class Pang implements Runnable {
    MonitorTurno m;
    public Pang(MonitorTurno m) {
        this.m = m;
    }
    @Override
    public void run() {
        while(m.turno < m.total) {
            synchronized (m) {
                while(m.quienToca != 2){
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
                System.out.println("Pang");
                m.quienToca = 0;
                m.notifyAll();
            }
        }
    }
}
