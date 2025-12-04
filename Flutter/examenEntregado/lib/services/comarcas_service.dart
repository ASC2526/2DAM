import 'dart:convert';

import 'package:comarquesgui/models/comarca.dart';
import 'package:comarquesgui/models/provincia.dart'; // Para realizar conversiones entre tipos de datos
import 'package:http/http.dart' as http;

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
    try{
      // Obtiene la lista de comarcas de una provincia
      String url =
          "https://node-comarques-rest-server-production.up.railway.app/api/comarques/comarquesAmbImatge/$provincia";

      var data = await http.get(Uri.parse(url));  

      if (data.statusCode == 200) {
        // Si hay respuesta la procesamos para devolverla como
        // la lista de provincias

        String body = utf8.decode(data.bodyBytes);
        final bodyJSON = jsonDecode(body) as List;

        return bodyJSON;
      }

      // Si no hay respuesta, devolvemos una lista vacía
      print("No hay respuesta del servidor");
      return [];

    } catch (except) {
      print(except.toString());
      return []; 
    }

  }

  static Future<Comarca?> infoComarca(String nombreComarca) async {
    try {
      // Obtiene la información de una comarca
      String url =
          "https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$nombreComarca";

      var data = await http.get(Uri.parse(url));

      // Preparamos la comarca a devolver
      Comarca? comarca;

      if (data.statusCode == 200) {
        String body = utf8.decode(data.bodyBytes);
        final bodyJSON = jsonDecode(body);        

        comarca = Comarca.fromJSON(bodyJSON);
      }

      // Si no hay respuesta, devolvemos null
      //print("No hay respuesta del servidor");
      return comarca;

    } catch (except) {
      print(except.toString());
      return null;
    }
  }


}
