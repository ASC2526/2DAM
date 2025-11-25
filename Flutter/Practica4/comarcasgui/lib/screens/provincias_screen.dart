import 'package:flutter/material.dart';
import 'package:comarcasgui/models/provincia.dart';
import 'package:comarcasgui/repository/repository_comarcas.dart';
import 'package:comarcasgui/screens/comarcas_screen.dart';

class ProvinciasScreen extends StatelessWidget {
  const ProvinciasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(
        child: FutureBuilder<List<Provincia>>(
          future: RepositoryComarcas.obtenerProvincias(), // ahora obtenemos las provincias desde internet
          builder: (context, snapshot) {

            // mientras carga mostramos un indicador
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // si hay error o no hay datos
            if (!snapshot.hasData) {
              return const Text("Error cargando provincias");
            }

            final provincias = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    _creaListaProvincias(context, provincias), 
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Widget> _creaListaProvincias(
    BuildContext context, List<Provincia> provincias) {
  List<Widget> lista = [];

  for (Provincia provincia in provincias) {
    lista.add(
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ComarcasScreen(
                provincia: provincia.nombre,
              ),
            ),
          );
        },
        child: ProvinciaRoundButton(
          nombre: provincia.nombre,
          imagen: provincia.imagen ?? "",
        ),
      ),
    );

    lista.add(const SizedBox(height: 20));
  }

  return lista;
}

class ProvinciaRoundButton extends StatelessWidget {
  const ProvinciaRoundButton(
      {required this.imagen, required this.nombre, super.key});

  final String imagen;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 110,
      backgroundImage: NetworkImage(imagen),
      child: Center(
        child: Text(
          nombre,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  // TO-DO

  // devolveremos un widget de tipo CircleAvatar con las siguientes propiedades
  // radius: 110
  // imagen de fondo: la imagen que nos han proporcionado. Esta imagen se obtendrá de Internet
  // Este widget contendrá como hijo un widget de tipo Text, con el nombre de la provincia
  // Para darle estilo al texto, puedes utilizar: style: Theme.of(context).textTheme.displayMedium,
  // (en el Main, hemos definido ya un estilo personalizado para la aplicación, por tanto, de aquí hacemos referencia a ese tema)
}
