import 'package:comarcasgui/screens/comarcas_screen.dart';
import 'package:comarcasgui/screens/infocomarca_detall.dart';
import 'package:comarcasgui/screens/infocomarca_general.dart';
import 'package:comarcasgui/screens/provincias_screen.dart';
import 'package:flutter/material.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ProvinciasScreen(),
                  ),
                );
              },
              child: const Text("Pantalla Provincias")),
          ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ComarcasScreen(),
                  ),
                );
              },
              child: const Text("Pantalla Comarcas")),
          ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const InfoComarcaGeneral(),
                  ),
                );
              },
              child: const Text(
                  "Pantalla con información \n general de la comarca.")),
          ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const InfoComarcaDetall(),
                  ),
                );
              },
              child: const Text(
                  "Pantalla con información \n detallada de la comarca"))
        ],
      ),
    );
  }
}
