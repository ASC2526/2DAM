import 'package:flutter/material.dart';

class ProvinciaScreen extends StatefulWidget {
  const ProvinciaScreen({super.key});

  @override
  State<ProvinciaScreen> createState() => _ProvinciaScreenState();
}

class _ProvinciaScreenState extends State<ProvinciaScreen> {

  int indexSeleccionado = 0;

  final List<String> titulos = const [
    "Provincia",
    "Comarca",
    "Detalle Comarca"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(titulos[indexSeleccionado]),
      ),

      body: Center(
        child: Text(
          titulos[indexSeleccionado],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexSeleccionado,
        onTap: (i) {
          setState(() {
            indexSeleccionado = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Provincia"
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Comarca"
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.museum),
              label: "Detalle"
          ),
        ],
      ),
    );
  }
}
