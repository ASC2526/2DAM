import 'package:flutter/material.dart';
import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_ejemplo.dart';
import 'package:comarcasgui/screens/widgets/my_weather_info.dart';
import 'infocomarca_general.dart';

class InfoComarcaDetall extends StatelessWidget {
  final String comarcaName;

  const InfoComarcaDetall({super.key, required this.comarcaName});

  @override
  Widget build(BuildContext context) {
    Comarca? comarca = RepositoryEjemplo.obtenerInfoComarca(comarcaName);

    if (comarca == null) {
      return const Scaffold(body: Center(child: Text("Error al cargar la comarca")));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Població i oratge', 
      style: TextStyle(fontFamily: 'LeckerliOne', fontSize: 30, fontWeight: FontWeight.bold),)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            MyWeatherInfo(comarca: comarcaName),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(children: [
                  Text("Població:", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text("Latitud:", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text("Longitud:", style: TextStyle(fontSize: 18)),
                ]),
                const SizedBox(width: 20),
                Column(children: [
                  Text("${comarca.poblacion}", style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text("${comarca.latitud}", style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text("${comarca.longitud}", style: const TextStyle(fontSize: 18)),
                ]),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomMenu(
        comarcaNombre: comarcaName,
        seleccionado: 1,
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
            texto: "Informació General",
            activo: seleccionado == 0,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => InfoComarcaGeneral(comarca: comarcaNombre),
                ),
              );
            },
          ),
          _menuItem(
            context,
            icon: Icons.wb_sunny,
            texto: "Informació Detallada",
            activo: seleccionado == 1,
            onTap: () {},
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
