import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/models/provincia.dart';
import 'package:comarcasgui/services/comarcas_service.dart';

class RepositoryComarcas {
  
  static Future<List<Provincia>> obtenerProvincias() async {
    return await ComarcasService.obtenerProvincias();
  }

  static Future<List<dynamic>> obtenerComarcas(String provincia) async {
    return await ComarcasService.obtenerComarcas(provincia);
  }

  static Future<Comarca?> obtenerInfoComarca(String nombre) async {
    return await ComarcasService.infoComarca(nombre);
  }
}
