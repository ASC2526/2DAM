import 'dart:io';
import 'dart:convert'; // Para realizar conversiones entre tipos de datos
import 'package:http/http.dart' as http; // Para realizar peticiones HTTP

class WeatherService {
  static Future<dynamic> obtenerClima(
      {required double longitud, required double latitud}) async {
    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=$latitud&longitude=$longitud&current_weather=true';

    // Lanzamos una petición GET mediante el método http.get, y esperamos a la respuesta
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == HttpStatus.ok) {
      // Descodificamos la respuesta
      String body = utf8.decode(response.bodyBytes);
      final result = jsonDecode(body);

      // Y la devolvemos
      return result;
    } else {
      // Si no carga, lanzamos una excepción
      throw Exception('No se ha podido conectar');
    }
  }
}
