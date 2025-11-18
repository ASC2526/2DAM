import 'package:flutter/material.dart';
import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_ejemplo.dart';
import 'infocomarca_detall.dart';

class InfoComarcaGeneral extends StatelessWidget {
  final String comarca;

  const InfoComarcaGeneral({super.key, required this.comarca});

  @override
  Widget build(BuildContext context) {
    // obtenemos la información completa de la comarca según su nombre
    Comarca? comarca = RepositoryEjemplo.obtenerInfoComarca(this.comarca);

    // control básico por si no se encuentra la comarca
    if (comarca == null) {
      return const Scaffold(
        body: Center(child: Text("No se ha encontrado la comarca")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informació General',
          style: TextStyle(
            fontFamily: 'LeckerliOne', 
            fontSize: 30, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // usamos un SingleChildScrollView para permitir scroll en pantallas pequeñas
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // imagen principal de la comarca (tema 4: Image.network)
            Image.network(comarca.img ?? ""),
            const SizedBox(height: 25),

            // nombre de la comarca
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                comarca.comarca,
                style: const TextStyle(fontSize: 28),
              ),
            ),

            // capital de la comarca
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Capital: ${comarca.capital}",
                style: const TextStyle(fontSize: 22),
              ),
            ),

            // descripción larga
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                comarca.desc ?? "",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),

      // menú inferior que permite navegar entre General ↔ Detall
      bottomNavigationBar: _BottomMenu(
        comarcaNombre: this.comarca,
        seleccionado: 0, // estamos en la pestaña "General"
      ),
    );
  }
}

class _BottomMenu extends StatelessWidget {
  final String comarcaNombre;
  final int seleccionado;

  const _BottomMenu({required this.comarcaNombre, required this.seleccionado});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(12),

      // barra inferior con estilo personalizado
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // botón para quedarse en la vista general
          _menuItem(
            context,
            icon: Icons.info,
            texto: "General",
            activo: seleccionado == 0,
            onTap: () {},
          ),

          // botón para navegar a la vista detallada
          // usamos pushReplacement para cambiar la pantalla sin dejar rastro en el historial
          _menuItem(
            context,
            icon: Icons.wb_sunny,
            texto: "Detall",
            activo: seleccionado == 1,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => InfoComarcaDetall(comarcaName: comarcaNombre),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // widget reutilizable para cada opción del menú inferior
  Widget _menuItem(
    BuildContext context, {
    required IconData icon,
    required String texto,
    required bool activo,
    required Function onTap,
  }) {
    return GestureDetector(
      // lo mismo que antes, para detectar toques
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),

        // si está activo se resalta con fondo blanco
        decoration: activo
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              )
            : null,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: activo ? Colors.blue : Colors.black54),
            Text(texto),
          ],
        ),
      ),
    );
  }
}
