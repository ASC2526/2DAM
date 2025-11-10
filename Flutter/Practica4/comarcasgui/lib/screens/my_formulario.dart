import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: EjemploFormTextEditController(),
        ),
      ),
    );
  }
}


// En primer lugar, definimos el widget como un widget con estado
class EjemploFormTextEditController extends StatefulWidget {
  const EjemploFormTextEditController({super.key});

  // Sobreescrimbimos el método createState() para crear el estado  @override
  @override
  State<EjemploFormTextEditController> createState() =>
      _EjemploFormTextEditControllerState();
}

// Definimos la clase correspondiente a el estado

class _EjemploFormTextEditControllerState
    extends State<EjemploFormTextEditController> {      
  // El estaod contiene un TextEditController, que
  // asociaremos al TextEdit
  final TextEditingController controlador = TextEditingController();

  @override
  void initState() {
    super.initState();
    // En el método initState del ciclo de vida del estado
    // podemos dar un valor inicial a la propiedad
    // text del controlador.
    controlador.text = "ValorInicial";
  }

  // Construimos el widget que estará compuesto por
  // un TextField, un Divider y un botón.
  // Tanto el TextField como el botón, se crean en
  // métodos aparte (creaTextField() i 
  // creaBotonSubmit()) per facilitar la legibilitat.

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          creaTextField(), 
          const Divider(),
          creaBotonSubmit(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Liberamos el controlador cuando el widget
    // se elimina del árbol de widgets
    controlador.dispose();
    super.dispose();
  }

  TextField creaTextField() {
    return TextField(
      // Asociamos el controlador al controller
      // del TextField

      controller: controlador,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Esta función devolverá un ElevatedButton,
  // cuya función será únicamente mostrar
  // un texto por consola cuando hacemos click en el mismo.
  ElevatedButton creaBotonSubmit() {
    return ElevatedButton(
      onPressed: () {
        debugPrint(controlador.text);
      },
      child: const Text("Enviar formualario"),
    );
  }
}