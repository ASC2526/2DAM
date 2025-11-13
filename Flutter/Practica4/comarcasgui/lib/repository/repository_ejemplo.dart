import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/models/provincia.dart';
import 'package:comarcasgui/repository/repository_data.dart';

/* 
    Esta clase accede a la clase RepositoryData para
    obtener la información sobre provincias y comarcas.
*/
class RepositoryEjemplo {
  static List<Provincia> obtenerProvincias() {
    // Devuelve una lista de provincias, obtenidas a partir de la propiedad
    // provincies de RepositoryData.

    List<Provincia> provincies = [];
    for (var p in RepositoryData.provincies) {
      provincies.add(Provincia(nombre: p["provincia"], imagen: p["img"]));
    }
    return provincies;
  }

  static List<dynamic> obtenerComarcas(String provincia) {
    // Devuelve la lista de comarcas de una determinada provincia.
    
    // Atención, NO se trata de objetos de tipo Comarca,
    // ya que únicamente tenemos el nombre y la imagen.
    // Se trata de un JSON, y por tanto es una List<dynamic>
    List<dynamic> comarques = [];

    // Recorremos la lista de provincies en RepositoryData para encontrar la que se busca
    for (var p in RepositoryData.provincies) {
      if (p["provincia"] == provincia) {
        // Cuando encontramos la provincia, recorremos las comarcas
        // y añadimos a la lista comarques un JSON con el nombre
        // y la imagen de cada comarca
        for (var com in p["comarques"]) {
          comarques.add({
            "comarca": com["comarca"],
            "img": com["img"],
          });
        }
      }
    }

    return comarques;
  }

  static Comarca? obtenerInfoComarca(String comarcaNombre) {
    // Recibe el nombre de una comarca (String comarcaNombre), y 
    // devuelve un objeto de tipo Comarca, con la información de la misma.
    for (var p in RepositoryData.provincies) {
      for (var com in p["comarques"]) {
        if (com["comarca"] == comarcaNombre) {
          return Comarca.fromJSON(com);
        }
      }
    }

    // Si no la encuentra devolvemos null
    return null;
  }
}
