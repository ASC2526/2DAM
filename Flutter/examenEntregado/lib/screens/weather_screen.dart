import 'package:comarquesgui/repository/repository_weather.dart';
import 'package:comarquesgui/screens/widgets/my_circular_progress.dart';
import 'package:flutter/material.dart';


class WeatherScreen extends StatelessWidget {
  final double longitud;
  final double latitud;
  final String nomComarca;
  const WeatherScreen({super.key, required this.longitud, required this.latitud, required this.nomComarca});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clima de $nomComarca'),
        ),
        body: Center(
          child: FutureBuilder(
            future: RepositoryWeather.obtenerClima(longitud: longitud, latitud: latitud),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const MyCircularProgress();
              }
              if (!snapshot.hasData) {
                return const Text('No se pudo obtener la información del clima');
              }

              final data = snapshot.data;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  data.ToString(),
                  
                )
              );
            }
          )
        ),
      ),
    );
  }
}