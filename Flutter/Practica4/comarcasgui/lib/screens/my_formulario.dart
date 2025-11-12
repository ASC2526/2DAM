import 'package:flutter/material.dart';
import 'launcher_screen.dart';

class MyFormulario extends StatefulWidget {
  const MyFormulario({super.key});

  @override
  State<MyFormulario> createState() => _MyFormularioState();
}

class _MyFormularioState extends State<MyFormulario> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // correo
              Row(
                children: [
                  const Icon(Icons.email_rounded),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No puede estar vacío';
                        }
                        if (!value.contains('@')) {
                          return 'La dirección de correo no es válida';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // contraseña
              Row(
                children: [
                  const Icon(Icons.lock),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No puede estar vacío';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    const correoValido = "alejandro@gmail.com";
                    const passwordValida = "1234";

                    if (_emailController.text == correoValido &&
                        _passwordController.text == passwordValida) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LauncherScreen(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: const Text("Error"),
                            content: const Text(
                              "El usuario o la contraseña son incorrectas",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); 
                                },
                                child: const Text("Volver"),
                              ),
                              TextButton(
                                onPressed: () {
                                  _emailController.text = correoValido;
                                  _passwordController.text = passwordValida;
                                  Navigator.pop(context); 
                                },
                                child: const Text("Rellenar usuario"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: const Text("Iniciar sesión"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
