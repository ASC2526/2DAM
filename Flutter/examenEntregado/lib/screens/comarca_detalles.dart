import 'package:flutter/material.dart';
import 'package:comarquesgui/repository/repository_comarcas.dart';
import 'package:comarquesgui/models/comarca.dart';
import 'package:comarquesgui/screens/widgets/my_circular_progress.dart';
import 'package:maps_launcher/maps_launcher.dart';

class ComarcaDetallesScreen extends StatelessWidget {
  final String? nomProvincia;

  const ComarcaDetallesScreen({this.nomProvincia, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de comarcas de ${nomProvincia ?? ""}'),
      ),
      body: Center(
        child: FutureBuilder(
          future: RepositoryComarcas.obtenerComarcas(nomProvincia ?? ""),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const MyCircularProgress();
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return const Text("No hay datos disponibles");
            }

            return _creaListaComarcas(snapshot.data as List<dynamic>);
          },
        ),
      ),
    );
  }

  Widget _creaListaComarcas(List<dynamic> comarcas) {
    return ListView.builder(
      itemCount: comarcas.length,
      itemBuilder: (context, index) {
        final c = comarcas[index];
        return DetalleComarcaCard(comarcaNombre: c['nom']);
      },
    );
  }
}



class DetalleComarcaCard extends StatelessWidget {
  final String comarcaNombre;

  const DetalleComarcaCard({required this.comarcaNombre, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<Comarca?>(
          future: RepositoryComarcas.obtenerInfoComarca(comarcaNombre),
          builder: (context, snapshot) {
            
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return const Text("Sin información disponible");
            }

            final info = snapshot.data as Comarca;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                Center(
                  child: Text(
                    comarcaNombre,
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Capital: ${info.capital}'),
                    const SizedBox(height: 5),
                    Text('Poblacion: ${info.poblacion}'),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.location_on),
                      onPressed: () async {
                        MapsLauncher.launchCoordinates(info.longitud!, info.latitud!);
                      }
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.sunny),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
