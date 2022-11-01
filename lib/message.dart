import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

message(BuildContext context, String nombre) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Mensaje Informativo...!"),
        content: Text("La planta " + nombre),
      ));
}