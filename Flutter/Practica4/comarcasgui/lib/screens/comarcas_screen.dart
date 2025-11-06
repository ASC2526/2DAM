import 'package:comarcasgui/repository/repository_ejemplo_antiguo.dart';
import 'package:flutter/material.dart';

class ComarcasScreen extends StatelessWidget {
  const ComarcasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // Proporciona a _creaLlistaComarques la lista de comarcas de Alacant
          child:
              _creaListaComarcas(RepositoryEjemploAntiguo.obtenerComarcas())), ////
    );
  }

  _creaListaComarcas(List<dynamic> comarques) {
    return ListView.builder(
      itemCount: comarques.length,
      itemBuilder: (context, index) {
        final comarca = comarques[index];
        return ComarcaCard(
          img: comarca["img"],
          comarca: comarca["nom"],
        );
      },
    );
    // Recibimos la lista de JSON con el nombre y la imagen (img) de cada comarca
    
    // TO-DO
    // Debemos utilizar un ListView.builder para recorrer la lista de comarcas
    // y generar un widget personalizado de tipo ComarcaCard, con la imagen y el nombre.
  }
}

class ComarcaCard extends StatelessWidget {
  const ComarcaCard({
    super.key,
    required this.img,
    required this.comarca,
  });

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
              child: Image.network(
                img,
                fit: BoxFit.cover, 
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Text(
              comarca,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  // TO-DO
    // Devuelve un widget de tipo Card, con el diseño que desees, pero
    // que muestre la imagen  (obtenida de Internet a partir de la url)
    // y el nombre de la comarca.
}
