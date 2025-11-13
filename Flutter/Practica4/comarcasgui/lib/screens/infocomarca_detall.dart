import 'package:flutter/material.dart';
import 'widgets/my_weather_info.dart';
import 'infocomarca_general.dart';

/*
  Pantalla InfoComarcaDetall:
  Mostra informació detallada (temps, població...) de la comarca actual.
*/

class InfoComarcaDetall extends StatelessWidget {
  final String comarcaName;

  const InfoComarcaDetall({super.key, required this.comarcaName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Població i oratge - $comarcaName')),
      body: Center(
        child: MyWeatherInfo(comarcaName: comarcaName), // le pasamos la comarca dinámica
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InfoComarcaGeneral(comarcaName: comarcaName)),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'Informació general'),
          BottomNavigationBarItem(icon: Icon(Icons.wb_sunny), label: 'Informació detallada'),
        ],
      ),
    );
  }
}



  // TO-DO
    // Añadir la información siguiente sobre la comarca:
    // Población (num. de habitantes), latitud y longitud.
    // Podéis combinar Column y Row para mostrar la información tabulada


    // Antes de la información, deberemos mostrar la información sobre el tiempo en la comarca,
    // mediante el widtget personalizado MyWeatherInfo(), que se os proporciona ya implementado

