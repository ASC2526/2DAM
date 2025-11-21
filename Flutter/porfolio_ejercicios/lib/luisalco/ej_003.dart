import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Paleta de colores',
      home: const PantallaPrincipal(
        titulo: 'Título de la App',
      ),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  final String titulo;

  const PantallaPrincipal({
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          titulo,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: const CuerpoColorido(
        texto: 'Texto de prueba',
        fondo: Colors.redAccent,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (indice) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Rojo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Verde',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Azul',
          ),
        ],
      ),
    );
  }
}

class CuerpoColorido extends StatelessWidget {
  final String texto;
  final Color fondo;

  const CuerpoColorido({
    this.texto = 'Sin texto definido',
    this.fondo = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: fondo,
      child: Center(
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24
          ),
        ),
      ),
    );
  }
}
