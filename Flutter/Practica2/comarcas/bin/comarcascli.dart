// Importació de llibreries
import 'dart:io';
import 'package:comarcascli/comarcas_service.dart';
import 'package:comarcascli/provincia.dart';

void main(List<String> argumentos) {
  if (argumentos.isEmpty) {
    print("\x1B[31m Número de argumentos incorrectos\x1B[0m");
    exit(-1);
  }

  List<String> listaArgs = List.from(argumentos);
  String? orden;
  String? args;

  orden = listaArgs[0];
  listaArgs.removeAt(0);
  args = listaArgs.join(" ");

  switch (orden) {
    case "provincias":
      muestraProvincias();
      break;

    case "comarcas":
      if (argumentos.length != 2) {
        print(
            "\x1B[31m Número de argumentos incorrecto. Especifica bien la provincia.\x1B[0m");
        exit(-1);
      }
      muestraComarcas(args);
      break;

    case "infocomarca":
      if (argumentos.length < 2) {
        print(
            "\x1B[31m Número de argumentos incorrecto. Especifica bien la Comarca.\x1B[0m");
        exit(-1);
      }
      muestraInfoComarca(args);
      break;
    default:
      print("\x1B[31mOrden desconocida\x1B[0m");
  }
}

muestraProvincias() {
  Future<List<Provincia>> respuestaFuture = ComarcasService.obtenerProvincias();

  respuestaFuture.then((respuesta) {
    if (respuesta.isNotEmpty) {
      for (var provincia in respuesta) {
        print(provincia.toString());
      }
    } else {
      print("\x1B[31mNo s'ha obtingut cap resposta\x1B[0m");
    }
  });
}

muestraProvinciasSync() async {
  List<Provincia> provincies = await ComarcasService.obtenerProvincias();

  if (provincies.isNotEmpty) {
    for (var provincia in provincies) {
      print(provincia.toString());
    }
  } else {
    print("\x1B[31mNo se ha obtenido respuesta\x1B[0m");
  }
}

muestraComarcas(String provincia) async {
  var comarcas = await ComarcasService.obtenerComarcas(provincia);
  if (comarcas.isNotEmpty) {
    for (var comarca in comarcas) {
      print("\x1B[34mNom:\t\x1B[36m${comarca['comarca']}\x1B[0m");
      print("\x1B[34mImatge:\t\x1B[36m${comarca['img']}\n\x1B[0m");
    }
  } else {
    print("\x1B[31mNo se han encontrado comarcas para $provincia\x1B[0m");
  }
}

muestraInfoComarca(String comarca) async {
  var info = await ComarcasService.infoComarca(comarca);
  if (info != null) {
    print(info.toString());
  } else {
    print("\x1B[31mNo se han encontrado con el nombre $comarca\x1B[0m");
  }
}
