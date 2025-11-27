import 'package:comarcasgui/services/weather_service.dart';

class RepositoryWeather {
  static Future<dynamic> obtenerClima({required double latitud, required double longitud}) async {
    return await WeatherService.obtenerClima(
      latitud: latitud,
      longitud: longitud,
    );
  }
}
