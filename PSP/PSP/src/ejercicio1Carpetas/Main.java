package ejercicio1Carpetas;

import ejercicio1Carpetas.MonitorCarpeta;
import ejercicio1Carpetas.RegistroCambio;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        List<MonitorCarpeta> monitores = new ArrayList<>();
        List<Thread> hilos = new ArrayList<>();

        while (true) {
            System.out.println("\n1. Añadir monitor");
            System.out.println("2. Detener monitor");
            System.out.println("3. Mostrar en tiempo real");
            System.out.println("4. Mostrar histórico");
            System.out.println("5. Salir");
            System.out.print("Opción: ");

            int op = sc.nextInt();
            sc.nextLine(); // limpiar

            switch (op) {

                case 1:
                    System.out.print("Indica la ruta: ");
                    String ruta = sc.nextLine();

                    MonitorCarpeta m = new MonitorCarpeta(ruta);
                    Thread t = new Thread(m);
                    monitores.add(m);
                    hilos.add(t);
                    t.start();

                    System.out.println("Monitor añadido.");
                    break;

                case 2:
                    if (monitores.isEmpty()) {
                        System.out.println("No hay monitores.");
                        break;
                    }

                    mostrarMonitores(monitores);

                    System.out.print("Indica cuál detener: ");
                    int detener = sc.nextInt();
                    sc.nextLine();

                    if (detener < 1 || detener > monitores.size()) {
                        System.out.println("Opción no válida.");
                        break;
                    }

                    monitores.get(detener - 1).detener();
                    hilos.get(detener - 1).interrupt();

                    System.out.println("Monitor detenido.");
                    break;

                case 3:
                    if (monitores.isEmpty()) {
                        System.out.println("No hay monitores.");
                        break;
                    }

                    System.out.println("Pulsa ENTER para volver al menú.");
                    Thread mostrar = new Thread(() -> {
                        while (!Thread.interrupted()) {
                            for (MonitorCarpeta monitor : monitores) {
                                List<RegistroCambio> h = monitor.getHistorico();
                                if (!h.isEmpty()) {
                                    System.out.println(h.get(h.size() - 1));
                                }
                            }
                            try {
                                Thread.sleep(1000);
                            } catch (InterruptedException e) {
                                break;
                            }
                        }
                    });

                    mostrar.start();
                    sc.nextLine(); // esperar enter
                    mostrar.interrupt();
                    break;

                case 4:
                    if (monitores.isEmpty()) {
                        System.out.println("No hay monitores.");
                        break;
                    }

                    mostrarMonitores(monitores);

                    System.out.print("Selecciona monitor: ");
                    int num = sc.nextInt();
                    sc.nextLine();

                    if (num < 1 || num > monitores.size()) {
                        System.out.println("Opción no válida.");
                        break;
                    }

                    for (RegistroCambio cambio : monitores.get(num - 1).getHistorico()) {
                        System.out.println(cambio);
                    }

                    break;

                case 5:
                    System.out.println("Finalizando...");

                    for (MonitorCarpeta mon : monitores)
                        mon.detener();
                    for (Thread h : hilos)
                        h.interrupt();

                    System.exit(0);
                    break;

                default:
                    System.out.println("Opción no válida.");
            }
        }
    }

    private static void mostrarMonitores(List<MonitorCarpeta> monitores) {
        System.out.println("Monitores disponibles:");
        for (int i = 0; i < monitores.size(); i++) {
            System.out.println((i + 1) + ". " + monitores.get(i).getRuta());
        }
    }
}
