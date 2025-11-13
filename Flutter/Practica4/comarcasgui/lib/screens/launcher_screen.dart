import 'package:flutter/material.dart';
import 'provincias_screen.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Launcher')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProvinciasScreen()),
                );
              },
              child: const Text('Ir a Provincias'),
            ),
          ],
        ),
      ),
    );
  }
}
