import 'package:comarquesgui/services/weather_service.dart';

class RepositoryWeather {
  static Future<dynamic> obtenerClima({required double longitud, required double latitud }) async{
    return WeatherService.obtenerClima(longitud: longitud, latitud: latitud);
  }
}