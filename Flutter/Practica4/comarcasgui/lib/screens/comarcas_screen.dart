import 'package:flutter/material.dart';
import 'package:comarcasgui/repository/repository_ejemplo.dart';
import 'infocomarca_general.dart';

/* 
  Pantalla ComarcasScreen:
  Muestra la lista de comarcas de una provincia seleccionada.
  Al pulsar en una comarca, navegaremos a la pantalla con la información de la misma.
*/

class ComarcasScreen extends StatelessWidget {
  final String provincia; // <-- parámetro recibido desde la pantalla anterior

  const ComarcasScreen({super.key, required this.provincia});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> comarques = RepositoryEjemplo.obtenerComarcas(provincia);

    return Scaffold(
      appBar: AppBar(
        title: Text('Comarques de $provincia'),
      ),
      body: ListView.builder(
        itemCount: comarques.length,
        itemBuilder: (context, index) {
          final comarca = comarques[index];
          return GestureDetector(
            onTap: () {
              // Navegar a la pantalla con la info de la comarca seleccionada
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoComarcaGeneral(comarcaName: comarca["comarca"]),
                ),
              );
            },
            child: ComarcaCard(img: comarca["img"], comarca: comarca["comarca"]),
          );
        },
      ),
    );
  }
}

class ComarcaCard extends StatelessWidget {
  const ComarcaCard({super.key, required this.img, required this.comarca});

  final String img;
  final String comarca;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(img, width: double.infinity, height: 180, fit: BoxFit.cover, errorBuilder: (ctx,err,st)=> const SizedBox(height:180, child: Center(child: Icon(Icons.broken_image)))),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Text(
              comarca,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                    shadows: const [Shadow(color: Colors.black, blurRadius: 5)],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
