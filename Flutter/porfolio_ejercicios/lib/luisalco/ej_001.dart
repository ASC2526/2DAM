// Plantilla base para la realización de los ejercicios,
// se debe crear una carpeta en /lib con un nombre que referencie al alumno. 
// En la raíz de esta carpeta se irán colgando los ejercicios como ej_xxx.dart 
// e incluirá todo lo necesaria para crear la app. Se podrán pedir otras 
// estructuras de carpetas para crear assets y widgets, pero este archivo será 
// siempre el principal y de referencia, y se deberá construir con la misma clase base 

import 'package:flutter/material.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BotonColorido(texto: 'Aceptar', colorFondo: Colors.green),
              SizedBox(height: 20),
              BotonColorido(texto: 'Cancelar', colorFondo: Colors.red)
            ],
          )
        ),
      ),
    );
  }
  
}

class BotonColorido extends StatelessWidget{
  final String texto;
  final Color colorFondo;

  const BotonColorido({
    required this.texto,
    required this.colorFondo
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      )
    );
  }
}