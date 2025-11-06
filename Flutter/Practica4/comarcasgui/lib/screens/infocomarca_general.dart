import 'package:comarcasgui/models/comarca.dart';
import 'package:comarcasgui/repository/repository_ejemplo_antiguo.dart';
import 'package:flutter/material.dart';

class InfoComarcaGeneral extends StatelessWidget {
  const InfoComarcaGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    Comarca comarca = RepositoryEjemploAntiguo.obtenerInfoComarca();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(comarca.img ?? ""),
            const SizedBox(height: 35),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  comarca.comarca,
                  style: const TextStyle(
                    fontSize: 28
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12, top: 5),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Capital: ${comarca.capital}",
                  style: const TextStyle(
                    fontSize: 22
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12, top: 10),
              child: Text(
                comarca.desc ?? "",
                style: const TextStyle(
                  fontSize: 18
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // TO-DO
    // Añadir la información siguiente sobre la comarca:
    // Imagen, nombre, capital y descripción, de forma similar a como se muestra en el enunciado

    // Podéis utilizar los widgets y contenedores que consideréis oportunos (Containers, SingleChildScrollView, Columns, etc)
    // Debéis tener en cuenta no sobrepasar los límites y dibujar fuera del espacio disponible
    // Para comprobar que no os salís, podéis probar a girar el dispositivo (si lo estáis haciendo sobre Android)

}


  

  