import 'package:flutter/material.dart';
import 'package:flutter_app/text_box.dart';
import 'package:flutter_app/home.dart';

class RegisterPlanta extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPlanta();
}

class _RegisterPlanta extends State<RegisterPlanta> {
  late TextEditingController controllerNombre;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerRiegos;

  @override
  void initState() {
    controllerNombre = new TextEditingController();
    controllerDescripcion = new TextEditingController();
    controllerRiegos = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar Planta"),
        ),
        body: ListView(
          children: [
            TextBox(controllerNombre, "Nombre"),
            TextBox(controllerDescripcion, "Descripcion"),
            TextBox(controllerRiegos, "Numero de Riegos"),
            ElevatedButton(
                onPressed: () {
                  String nombre = controllerNombre.text;
                  String descripcion = controllerDescripcion.text;
                  String riegos = controllerRiegos.text;

                  if (nombre.isNotEmpty &&
                      descripcion.isNotEmpty &&
                      riegos.isNotEmpty) {
                    Navigator.pop(context,
                        new Planta(nombre: nombre, descripcion: descripcion, n_riegos: riegos));
                  }
                },
                child: Text("Guardar Planta")),
          ],
        ));
  }
}