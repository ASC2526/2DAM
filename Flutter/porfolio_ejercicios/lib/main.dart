import 'package:flutter/material.dart';

// Imports a las carpetas de los alumnos con los ejercicios
import 'luisalco/ej_001.dart' as ejercicio0;

import 'luisalco/ej_001.dart' as ejercicio1;
import 'luisalco/ej_003.dart' as ejercicio;
// ....

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => ejercicio.MainApp();
}
