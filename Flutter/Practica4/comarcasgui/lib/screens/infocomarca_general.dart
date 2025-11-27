import 'package:flutter/material.dart';
import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_comarcas.dart';
import 'package:comarcasgui/screens/widgets/my_circular_progress_indicator.dart';
import 'infocomarca_detall.dart';

class InfoComarcaGeneral extends StatelessWidget {
  final String comarca;

  const InfoComarcaGeneral({super.key, required this.comarca});

  @override
  Widget build(BuildContext context) {
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

      body: FutureBuilder<Comarca?>(
        future: RepositoryComarcas.obtenerInfoComarca(comarca),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MyCircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error cargando la comarca"));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No se ha encontrado la comarca"));
          }

          final info = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(info.img ?? ""),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    info.comarca,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Capital: ${info.capital}",
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(info.desc ?? "", style: const TextStyle(fontSize: 18)),
                ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            label: "General",
          ),
          NavigationDestination(
            icon: Icon(Icons.wb_sunny_outlined),
            label: "Detall",
          ),
        ],
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InfoComarcaDetall(comarcaName: comarca),
              ),
            );
          }
        },
      ),
    );
  }
}
