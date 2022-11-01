import 'package:flutter_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/text_box.dart';

class ModifyPlanta extends StatefulWidget {
  final Planta _planta;
  ModifyPlanta(this._planta);
  @override
  State<StatefulWidget> createState() => _ModifyPlanta();
}

class _ModifyPlanta extends State<ModifyPlanta> {
  late TextEditingController controllerNombre;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerRiegos;

  @override
  void initState() {
    Planta p = widget._planta;
    controllerNombre = new TextEditingController(text: p.nombre);
    controllerDescripcion = new TextEditingController(text: p.descripcion);
    controllerRiegos = new TextEditingController(text: p.n_riegos.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Planta"),
      ),
      body: ListView(
        children: [
          TextBox(controllerNombre, "Nombre"),
          TextBox(controllerDescripcion, "Descripcion"),
          TextBox(controllerRiegos, "N° de Riegos"),
          ElevatedButton(
              onPressed: () {
                String nombre = controllerNombre.text;
                String descripcion = controllerDescripcion.text;
                String riegos = controllerRiegos.text;

                if (nombre.isNotEmpty && descripcion.isNotEmpty && riegos.isNotEmpty) {
                  Navigator.pop(context,
                      new Planta(nombre: nombre, descripcion: descripcion, n_riegos: riegos));
                }
              },
              child: Text("Guardar Planta")),
        ],
      ),
    );
  }
}