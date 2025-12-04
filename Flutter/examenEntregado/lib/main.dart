import 'package:comarquesgui/screens/my_formulario.dart';
import 'package:comarquesgui/themes/tema_comarques.dart';
import 'package:flutter/material.dart';

// Pantalla principal O
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: temaComarques,
      home: const Scaffold(
        body: MyFormulario(), 
      ),
    );
  }
}
