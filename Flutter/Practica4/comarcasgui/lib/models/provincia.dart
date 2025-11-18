class Provincia {
  late String nombre;
  String? imagen;

  Provincia({
    required this.nombre,
    this.imagen,
  });

  Provincia.fromJSON(Map<String, dynamic> objecteJSON) {
    nombre = objecteJSON["provincia"] ?? "";
    imagen = objecteJSON["img"] ?? "";
  }

  @override
  String toString() => '''\x1B[34mNom:\t\x1B[36m$nombre\x1B[0m
\x1B[34mImatge:\t\x1B[36m$imagen\n\x1B[0m''';
}
