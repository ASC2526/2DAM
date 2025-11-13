import 'package:flutter/material.dart';
import 'package:comarcasgui/repository/repository_ejemplo.dart';
import 'infocomarca_general.dart';
/*
  Pantalla ComarcasScreen:
  Muestra la lista de comarcas de una provincia seleccionada.
  Al pulsar una, navegamos a su información.
*/
class ComarcasScreen extends StatelessWidget {
  final String provincia;

  const ComarcasScreen({super.key, required this.provincia});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> comarques = RepositoryEjemplo.obtenerComarcas(provincia);

    return Scaffold(
      appBar: AppBar(title: Text('Comarques de $provincia',
      style: const TextStyle(fontFamily: 'LeckerliOne', fontSize: 30, fontWeight: FontWeight.bold),)),
      body: _creaListaComarcas(comarques, context),
    );
  }

  _creaListaComarcas(List<dynamic> comarques, BuildContext context) {
    return ListView.builder(
      itemCount: comarques.length,
      itemBuilder: (context, index) {
        final comarca = comarques[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    InfoComarcaGeneral(comarca: comarca["comarca"]),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: double.infinity,
              height: 180,
              child: Image.network(img, fit: BoxFit.cover),
            ),
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
          )
        ],
      ),
    );
  }
}
