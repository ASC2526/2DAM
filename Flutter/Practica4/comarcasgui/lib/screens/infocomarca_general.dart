import 'package:flutter/material.dart';
import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_ejemplo.dart';
import 'infocomarca_detall.dart';

class InfoComarcaGeneral extends StatelessWidget {
  final String comarca;

  const InfoComarcaGeneral({super.key, required this.comarca});

  @override
  Widget build(BuildContext context) {
    Comarca? comarca = RepositoryEjemplo.obtenerInfoComarca(this.comarca);

    if (comarca == null) {
      return const Scaffold(
        body: Center(child: Text("No se ha encontrado la comarca")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Informació General', 
      style: TextStyle(fontFamily: 'LeckerliOne', fontSize: 30, fontWeight: FontWeight.bold),)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(comarca.img ?? ""),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                comarca.comarca,
                style: const TextStyle(fontSize: 28)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Capital: ${comarca.capital}",
                style: const TextStyle(fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(comarca.desc ?? "", style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomMenu(
        comarcaNombre: this.comarca,
        seleccionado: 0,
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
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _menuItem(
            context,
            icon: Icons.info,
            texto: "General",
            activo: seleccionado == 0,
            onTap: () {},
          ),
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

  Widget _menuItem(BuildContext context,
      {required IconData icon,
      required String texto,
      required bool activo,
      required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: activo
            ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12))
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
