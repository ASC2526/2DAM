import 'package:flutter/material.dart';
import 'package:comarcasgui/repository/repository_comarcas.dart';
import 'package:comarcasgui/screens/infocomarca_general.dart';
import 'package:comarcasgui/screens/widgets/my_circular_progress_indicator.dart';

/*
  Pantalla ComarcasScreen:
  Muestra la lista de comarcas de una provincia seleccionada
  Ahora la información se obtiene desde Internet con un FutureBuilder
*/

class ComarcasScreen extends StatelessWidget {
  final String provincia;

  const ComarcasScreen({super.key, required this.provincia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comarques de $provincia',
          style: const TextStyle(
            fontFamily: 'LeckerliOne',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: FutureBuilder(
        future: RepositoryComarcas.obtenerComarcas(provincia),
        builder: (context, snapshot) {
          // mientras el Future no se complete, mostramos el indicador
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MyCircularProgressIndicator();
          }

          // si hay error
          if (snapshot.hasError) {
            return const Center(child: Text("Error carregant comarques"));
          }

          // si no hay datos
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No s'han trobat comarques"));
          }

          final comarques = snapshot.data as List<dynamic>;

          return ListView.builder(
            itemCount: comarques.length,
            itemBuilder: (context, index) {
              final comarca = comarques[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InfoComarcaGeneral(
                        comarca: comarca["comarca"],
                      ),
                    ),
                  );
                },
                child: ComarcaCard(
                  img: comarca["img"],
                  comarca: comarca["comarca"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ComarcaCard extends StatelessWidget {
  final String img;
  final String comarca;

  const ComarcaCard({super.key, required this.img, required this.comarca});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias, 
      child: Stack(
        children: [
          Ink.image(
            image: NetworkImage(img),
            height: 180,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Text(
              comarca,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                    shadows: const [
                      Shadow(color: Colors.black, blurRadius: 5),
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
