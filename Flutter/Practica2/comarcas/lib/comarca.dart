
class Comarca {
  late String comarca;
  String? img;
  String? capital;
  String? poblacion;
  String? desc;
  double? latitud;
  double? longitud;

  Comarca({
    required this.comarca,
    this.img,
    this.capital,
    this.poblacion,
    this.desc,
    this.latitud,
    this.longitud
  });
  Comarca.fromJSON(Map<String, dynamic> objecteJSON) {
      comarca = objecteJSON["comarca"] ?? "";
      capital = objecteJSON["capital"];
      poblacion = objecteJSON["poblacion"];
      img = objecteJSON["img"];
      desc = objecteJSON["desc"];
  

      @override
      String toString() => '''
      Comarca:   $comarca
      Capital:   ${capital ?? "EMPTY"}
      Población: ${poblacion ?? "EMPTY"}

      Imagen:    ${img ?? "EMPTY"}

      Desc:      ${desc ?? "EMPTY"}

      Coordenadas: (${latitud ?? "EMPTY"}, ${longitud ?? "EMPTY"})
      ''';
  }
}
