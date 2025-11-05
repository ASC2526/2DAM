import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_ejemplo0.dart';
import 'package:comarcasgui/screens/widgets/my_weather_info.dart';
import 'package:flutter/material.dart';

class InfoComarcaDetall extends StatelessWidget {
  const InfoComarcaDetall({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    Comarca comarca = RepositoryEjemplo.obtenerInfoComarca();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const MyWeatherInfo(),
          Image.network(comarca.img ?? ""),
          Text(comarca.comarca),
          Text("Población: ${comarca.poblacion}"),
          Text("Longitud ${comarca.longitud}"),
          Text("Latitud ${comarca.latitud}"),
          Padding(
              padding : const EdgeInsets.all(8.0),
              child: Text(comarca.desc ?? ""),
            )
        ],)
      )
    );
    // TO-DO
    // Añadir la información siguiente sobre la comarca:
    // Población (num. de habitantes), latitud y longitud.
    // Podéis combinar Column y Row para mostrar la información tabulada


    // Antes de la información, deberemos mostrar la información sobre el tiempo en la comarca,
    // mediante el widtget personalizado MyWeatherInfo(), que se os proporciona ya implementado
  }
}
