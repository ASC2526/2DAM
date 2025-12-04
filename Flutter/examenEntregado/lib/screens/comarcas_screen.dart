// ComarquesScreen
import 'package:comarquesgui/repository/repository_comarcas.dart';
import 'package:comarquesgui/screens/widgets/my_circular_progress.dart';
import 'package:flutter/material.dart';

class ComarcasScreen extends StatelessWidget {
  final String? nomProvincia;

  const ComarcasScreen({this.nomProvincia, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comarcas de $nomProvincia',
            style: Theme.of(context).textTheme.displayMedium),
      ),
      body: Center(
          // Proporciona a _creaLlistaComarques la llista de comarques d'Alacant
          // Alacant
          child: FutureBuilder(
              future: RepositoryComarcas.obtenerComarcas(nomProvincia ?? ""),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return _creaListaComarcas(snapshot.data);
                } else {
                  return const MyCircularProgress();
                }
              })),
    );
  }

_creaListaComarcas(List<dynamic> comarcas) {
    // Recibimos la lista de JSON con el nombre y la imagen (img) de cada comarca
    // Debemos utilizar un ListView.builder para recorrer la lista de comarcas
    // y generar un widget personalizado de tipo ComarcaCard, con la imagen y el nombre.
    return ListView.builder(
      itemCount: comarcas.length,
      itemBuilder: (context, index) {
        final comarca = comarcas[index];
        return ComarcaCard(
          img: comarca['img'],
          comarca: comarca['nom'],
        );
      },
    );
  }
}

class ComarcaCard extends StatelessWidget {
  // Este widget recibirá dos argumentos con nombre para construirse:
  // la imagen (img) y el nombre de la comarca (comarca)
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
      elevation: 5,
      clipBehavior: Clip
          .antiAlias, // Esto asegura que el contenido no se desborde del Card
    
      child: Stack(children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Image.network(img, fit: BoxFit.cover),
        ),
        Positioned(
          left: 30,
          bottom: 30,
          child:
              Text(comarca, style: Theme.of(context).textTheme.displaySmall),
        )
      ]),
    );
  } 
}
