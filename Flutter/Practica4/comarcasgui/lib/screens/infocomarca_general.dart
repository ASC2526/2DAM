import 'package:flutter/material.dart';
import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_ejemplo.dart';
import 'infocomarca_detall.dart';

/* 
  Pantalla InfoComarcaGeneral:
  Muestra la información general sobre una comarca seleccionada,
  incluyendo imagen, nombre, capital y descripción.
*/

class InfoComarcaGeneral extends StatelessWidget {
  final String comarcaName; // nombre dinámico recibido

  const InfoComarcaGeneral({super.key, required this.comarcaName});

  @override
  Widget build(BuildContext context) {
    // Obtenemos la comarca desde el repositorio
    final Comarca? comarca = RepositoryEjemplo.obtenerInfoComarca(comarcaName);

    // Si no se encuentra la comarca, mostramos un mensaje de error
    if (comarca == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Comarca no trobada")),
        body: const Center(
          child: Text(
            "No s'ha trobat la comarca especificada.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // Si la comarca existe, mostramos su información
    return Scaffold(
      appBar: AppBar(
        title: Text(comarca.comarca),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(comarca.img ?? "", width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(comarca.comarca, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text("Capital: ${comarca.capital ?? 'Desconeguda'}", style: const TextStyle(fontSize: 22)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(comarca.desc ?? "", style: const TextStyle(fontSize: 18, height: 1.4), textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // estamos en informacio general
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InfoComarcaDetall(comarcaName: comarcaName)),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Informació general"),
          BottomNavigationBarItem(icon: Icon(Icons.wb_sunny), label: "Informació detallada"),
        ],
      ),
    );
  }
}
