import 'package:flutter/material.dart';

class MyWeatherInfo extends StatelessWidget {
  final String comarcaName;

  const MyWeatherInfo({super.key, required this.comarcaName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Oratge a $comarcaName', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        _obtenerIconoTiempo("0"),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.thermostat, size: 35),
          const SizedBox(width: 8),
          Text("5º", style: Theme.of(context).textTheme.headlineMedium),
        ]),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.wind_power, size: 35),
          const SizedBox(width: 30),
          Text("20 km/h", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(width: 30),
          obtenerWidgetDireccionViento("0.0", context),
        ]),
      ],
    );
  }

  Widget obtenerWidgetDireccionViento(String direccionViento, BuildContext context) {
    double dir = double.tryParse(direccionViento) ?? 0.0;
    Icon icono;
    String nombreViento;
    if (dir > 22.5 && dir < 65.5) {
      icono = const Icon(Icons.north_east);
      nombreViento = "Gregal";
    } else if (dir > 67.5 && dir < 112.5) {
      icono = const Icon(Icons.east);
      nombreViento = "Llevant";
    } else if (dir > 112.5 && dir < 157.5) {
      icono = const Icon(Icons.south_east);
      nombreViento = "Xaloc";
    } else if (dir > 157.5 && dir < 202.5) {
      icono = const Icon(Icons.south);
      nombreViento = "Migjorn";
    } else if (dir > 202.5 && dir < 247.5) {
      icono = const Icon(Icons.south_west);
      nombreViento = "Llebeig/Garbí";
    } else if (dir > 247.5 && dir < 292.5) {
      icono = const Icon(Icons.west);
      nombreViento = "Ponent";
    } else if (dir > 292.5 && dir < 337.5) {
      icono = const Icon(Icons.north_west);
      nombreViento = "Mestral";
    } else {
      icono = const Icon(Icons.north);
      nombreViento = "Tramuntana";
    }

    return Row(children: [Text(nombreViento, style: Theme.of(context).textTheme.headlineSmall), const SizedBox(width:8), icono]);
  }

  Widget _obtenerIconoTiempo(String value) {
    final sol = <String>{"0"};
    final pocasNubes = <String>{"1", "2", "3"};
    final nubes = <String>{"45", "48"};
    final lluviaSuave = <String>{"51", "53", "55"};
    final lluvia = <String>{"61","63","65","66","67","80","81","82","95","96","99"};
    final neu = <String>{"71","73","75","77","85","86"};

    if (sol.contains(value)) return Image.asset("assets/icons/png/soleado.png");
    if (pocasNubes.contains(value)) return Image.asset("assets/icons/png/poco_nublado.png");
    if (nubes.contains(value)) return Image.asset("assets/icons/png/nublado.png");
    if (lluviaSuave.contains(value)) return Image.asset("assets/icons/png/lluvia_debil.png");
    if (lluvia.contains(value)) return Image.asset("assets/icons/png/lluvia.png");
    if (neu.contains(value)) return Image.asset("assets/icons/png/nieve.png");
    return Image.asset("assets/icons/png/poco_nublado.png");
  }
}
