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
    // Obtenemos la lista de comarcas de la provincia seleccionada
    final List<dynamic> comarques = RepositoryEjemplo.obtenerComarcas(provincia);

    // Si no hay comarcas, mostramos un mensaje
    if (comarques.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Comarques de $provincia')),
        body: const Center(
          child: Text(
            "No s'han trobat comarques per a aquesta província.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Comarques de $provincia'),
      ),
      body: _creaListaComarcas(comarques, context),
    );
  }

  _creaListaComarcas(List<dynamic> comarques, BuildContext context) {
    // Generamos una lista de tarjetas (Cards) para cada comarca
    return ListView.builder(
      itemCount: comarques.length,
      itemBuilder: (context, index) {
        final comarca = comarques[index];
        return GestureDetector(
          // Al pulsar una comarca, navegamos a su pantalla de información general
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Obrint informació de ${comarca["comarca"]}...'),
                duration: const Duration(milliseconds: 800),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    InfoComarcaGeneral(comarcaNom: comarca["comarca"]), // ✅ nombre correcto del JSON
              ),
            );
          },
          child: ComarcaCard(
            img: comarca["img"],
            comarca: comarca["comarca"], // ✅ corregido
          ),
        );
      },
    );
  }
}

/* 
  Widget ComarcaCard:
  Representa visualmente cada comarca mediante una Card con su imagen de fondo
  y el nombre superpuesto con un efecto de sombra.
*/
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
          // Imagen de fondo
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: double.infinity,
              height: 180,
              child: Image.network(
                img,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.error, size: 40, color: Colors.red),
                ),
              ),
            ),
          ),

          // Nombre de la comarca sobre la imagen
          Positioned(
            left: 12,
            bottom: 12,
            child: Text(
              comarca,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                    shadows: const [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 5,
                      ),
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
