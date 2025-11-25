class Provincia {
  late String nombre; // Declaramos el nombre , e indicamos que lo inicializaremos después
  String? imagen; // La url de la imagen es nulable

  /* 
  Constructor con argumentos por nombre: 
   - nombre es obligatorio, e 
   - imagen opcional.
  */
  Provincia({
    required this.nombre,
    this.imagen,
  });

  /* 
  Constructor con nombre a partir de un diccionario.
  */
  Provincia.fromJSON(Map<String, dynamic> objecteJSON) {
    nombre = objecteJSON["provincia"] ?? "";
    imagen = objecteJSON["img"] ?? "";
  }

  @override
  String toString() => '''\x1B[34mNom:\t\x1B[36m$nombre\x1B[0m
\x1B[34mImatge:\t\x1B[36m$imagen\n\x1B[0m''';
}