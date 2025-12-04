
import 'package:comarquesgui/models/comarca.dart';
import 'package:comarquesgui/models/provincia.dart';
import 'package:comarquesgui/services/comarcas_service.dart';

class RepositoryComarcas {
  
  static Future<List<Provincia>> obtenerProvincias() {
    return ComarcasService.obtenerProvincias();
  }

  static Future<List<dynamic>> obtenerComarcas(String provincia) {
    return ComarcasService.obtenerComarcas(provincia);
  }

  static Future<Comarca?> obtenerInfoComarca(String comarca) {
    return ComarcasService.infoComarca(comarca);
  }
}