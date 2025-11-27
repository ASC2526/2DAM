import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static Future<dynamic> obtenerClima({ required double latitud, required double longitud}) async {
    final url = "https://api.open-meteo.com/v1/forecast?latitude=$latitud&longitude=$longitud&current_weather=true";

    final respuesta = await http.get(Uri.parse(url));
    return jsonDecode(respuesta.body);
  }
}
