package ejPruebaPingPong;


public class Main {
    public static void main(String[] args) {
        MonitorTurno turno = new MonitorTurno();
        Ping ping = new Ping(turno);
        Pong pong = new Pong(turno);

        Thread pingThread = new Thread(ping);
        Thread pongThread = new Thread(pong);
        pingThread.start();
        pongThread.start();

    }
}
