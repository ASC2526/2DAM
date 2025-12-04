import 'package:comarquesgui/screens/comarca_detalles.dart';
import 'package:comarquesgui/screens/comarcas_screen.dart';
import 'package:flutter/material.dart';

class MyFormulario extends StatefulWidget {
  const MyFormulario({super.key});

  @override
  State<MyFormulario> createState() => MyFormularioState();
}

class MyFormularioState extends State<MyFormulario> {

  final TextEditingController _passwordController = TextEditingController();

  int provinciaIndex = 0;  
  bool comarcasConImagen = true;

  String errorVacia = "";

  final List<String> provincias = ["Alacant","Castelló","València"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const Text(
              "Iniciar Sesión",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                labelText: "Contraseña",
              ),
            ),

            if(errorVacia.isNotEmpty)
               Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(errorVacia)
              ),

            const SizedBox(height: 25),

          DropdownButton<int>(
              value: provinciaIndex,
                items: const [
                  DropdownMenuItem(value: 0, child: Text("Alicante")),
                    DropdownMenuItem(value: 1, child: Text("Castelló")),
                     DropdownMenuItem(value: 2, child: Text("Valencia")),
                ],
                onChanged: (val) {
                    setState(() { provinciaIndex = val ?? 0; });
                },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: SwitchListTile(
                title: const Text("Comarcas con imagen"),
                value: comarcasConImagen,
                onChanged: (v){
                  setState(() {
                      comarcasConImagen = v;
                  });
                },
              ),
            ),

            const SizedBox( height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ElevatedButton(
                    onPressed: iniciar, 
                    child: const Text(
                      "Iniciar sesión",
                      style: TextStyle(fontSize: 18),
                    )
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: (){
                      _passwordController.text="1234";
                  },
                  child: const Text(
                    "Rellenar contraseña",
                    style: TextStyle(fontSize: 18),
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }

  void iniciar(){

    errorVacia = "";
    setState(() {});

    var pass = _passwordController.text;

    if(pass.isEmpty){
      setState(() {
          errorVacia = "La contraseña no puede estar vacía";
      });
      return;
    }

    if(pass != "1234"){
      showDialog(
        context: context,
        builder: (c){
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("La contraseña es incorrecta"),
            actions: [
              TextButton(
                onPressed: (){
                    Navigator.pop(context);
                },
                child: const Text("Volver"),
              )
            ],
          );
        });
      return;
    }

    var provincia = provincias[provinciaIndex];

      if(comarcasConImagen){
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => ComarcasScreen(nomProvincia: provincia),
          ));
      } else {
          Navigator.push(context,
            MaterialPageRoute(
              builder:(context) => ComarcaDetallesScreen(nomProvincia: provincia),
            ))
      }
  }
}
