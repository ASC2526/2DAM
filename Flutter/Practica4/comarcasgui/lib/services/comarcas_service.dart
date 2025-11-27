import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/models/provincia.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ComarcasService {

    static Future<List<Provincia>> obtenerProvincias() async {
    // Obtiene la lista de provincias
    try {
      String url =
          "https://node-comarques-rest-server-production.up.railway.app/api/comarques/provincies";
      var data = await http.get(Uri.parse(url));

      // Preparamos la lista de provincias a devolver
      List<Provincia> listaProvincias = [];

      if (data.statusCode == 200) {
        // Si hay respuesta la procesamos para devolverla como
        // la lista de provincias

        String body = utf8.decode(data.bodyBytes);
        final bodyJSON = jsonDecode(body) as List;

        // Forma 1. Recorremos el JSON i creamos la lista de provincias
        /*for (var provinciaJSON in bodyJSON) {
          // Con el constructor por defecto
          listaProvincias.add(Provincia(
            nombre: provinciaJSON["provincia"],
            imagen: provinciaJSON["img"],
          ));

          // Alternativa: Con el constructor con nombre
           //listaProvincias.add(Provincia.fromJSON(provinciaJSON));
        }*/

        // Forma 2: Hacemos uso del mapa de estructuras
        listaProvincias = bodyJSON.map((provinciaJSON) {
          // Con el constructor por defecto
          return Provincia(
            nombre: provinciaJSON["provincia"],
            imagen: provinciaJSON["img"],
          );
          // Con el constructor con nombre
          //return Provincia.fromJSON(provinciaJSON);
        }).toList();
      }
      // Finalmente devolvemos la lista
      return listaProvincias;
    } catch (except) {
      print(except.toString());
      return [];
    }
  }

  static Future<List<dynamic>> obtenerComarcas(String provincia) async {
  try {
    final url =
        "https://node-comarques-rest-server-production.up.railway.app/api/comarques/comarquesAmbImatge/$provincia";
    final data = await http.get(Uri.parse(url));

    if (data.statusCode == 200) {
      final body = utf8.decode(data.bodyBytes);
      final bodyJSON = jsonDecode(body) as List;

      return bodyJSON;
    }

    return [];
  } catch (e) {
    print("Error: $e");
    return [];
  }
}


  static Future<Comarca?> infoComarca(String comarca) async {
    try {
      String url = 
          "https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$comarca";
      var data = await http.get(Uri.parse(url));

      if (data.statusCode == 200) {
        String body = utf8.decode(data.bodyBytes);
        final bodyJSON = jsonDecode(body) as List;

        for(var comarcaJSON in bodyJSON)
        {
            if(comarca == comarcaJSON)
            {
              return Comarca(comarca: comarca, 
              img: comarcaJSON["img"],
              capital: comarcaJSON["capital"],
              poblacion: comarcaJSON["poblacion"],
              desc: comarcaJSON["desc"],
              latitud: comarcaJSON["latitud"],
              longitud: comarcaJSON["longitud"]);
            }
        }
      }
  
    return null;
    } catch (except) {
    print(except.toString());
    return Comarca(comarca: '');
  }}


}
