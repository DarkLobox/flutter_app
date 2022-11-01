import 'package:flutter/material.dart';
import 'package:flutter_app/modify_planta.dart';
import 'package:flutter_app/register_planta.dart';
import 'package:flutter_app/message.dart';

class Home extends StatefulWidget{
  final String _title;
  Home(this._title);
  @override
  State<StatefulWidget> createState() => _Home();

}

class _Home extends State<Home>{

  List<Planta> plantas = [
    Planta(nombre: "margarita", descripcion: "Esta planta ...", n_riegos: 0),
    Planta(nombre: "girasol", descripcion: "Esta planta ...", n_riegos: 0),
    Planta(nombre: "calabaza", descripcion: "Esta planta ...", n_riegos: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
        itemCount: plantas.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ModifyPlanta(plantas[index])))
                  .then((newPlanta) {
                if (newPlanta != null) {
                  setState(() {
                    plantas.removeAt(index);

                    plantas.insert(index, newPlanta);

                    message(
                        context, newPlanta.nombre + " a sido modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, plantas[index]);
            },
            title: Text(plantas[index].nombre),
            subtitle: Text(plantas[index].descripcion + "\nRiegos: " + plantas[index].n_riegos.toString()),
            leading: CircleAvatar(
              child: Text(plantas[index].nombre.substring(0, 1)),
            ),
            trailing: IconButton(
              color: Colors.green,
              onPressed: () {
                plantas[index].plusRiego();
                setState(() {});
              },
              icon: Icon(Icons.plus_one, color: Colors.green),
            ),
          );
        },
      ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.white60,
                child: Icon(
                    Icons.delete,
                    color: Colors.red,
                ),
                onPressed: () {
                  for(final planta in plantas){
                    planta.resetRiego();
                  }
                  setState(() {});
                },
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => RegisterPlanta()))
                      .then((newPlanta) {
                    if (newPlanta != null) {
                      setState(() {
                        plantas.add(newPlanta);
                        message(
                            context, newPlanta.nombre + " a sido guardado...!");
                      });
                    }
                  });
                },
                tooltip: "Agregar Planta",
                child: Icon(Icons.add),
              )
            ]
        )
    );
  }

  removeClient(BuildContext context, Planta planta) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Eliminar Planta"),
          content: Text("Esta seguro de eliminar a " + planta.nombre + "?"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  this.plantas.remove(planta);
                  Navigator.pop(context);
                });
              },
              child: Text(
                "Eliminar",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ));
  }
}


class Planta {
  var nombre;
  var descripcion;
  var n_riegos;

  Map<String,dynamic> get map {
    return {
      "nombre": nombre,
      "descripcion": descripcion,
      "n_riegos": n_riegos,
    };
  }

  void plusRiego(){
    n_riegos = n_riegos + 1;
  }

  void resetRiego(){
    n_riegos = 0;
  }

  Planta({this.nombre, this.descripcion, this.n_riegos});
}