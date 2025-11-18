import 'package:flutter/material.dart';

// Imports a las carpetas de los alumnos con los ejercicios
import 'luisalco/ej_001.dart' as ejercicio;

//import 'luisalco/ej_001.dart' as ejercicio;
//import 'luisalco/ej_002.dart' as ejercicio;
// ....

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => ejercicio.MainApp();
}
