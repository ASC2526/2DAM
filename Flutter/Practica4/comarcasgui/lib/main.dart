import 'package:comarcasgui/screens/my_formulario.dart';
import 'package:comarcasgui/themes/tema_comarcas.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: temaComarcas,
      home: const Scaffold(
        body: MyFormulario(),
      ),
    );
  }
}
