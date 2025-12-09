package ejPruebaPingPongPang;

public class Main {
    public static void main(String[] args) {
        MonitorTurno m = new MonitorTurno();
        Ping ping = new Ping(m);
        Pong pong = new Pong(m);
        Pang pang = new Pang(m);

        Thread t1 = new Thread(ping);
        Thread t2 = new Thread(pong);
        Thread t3 = new Thread(pang);
        t1.start();
        t2.start();
        t3.start();
    }
}
