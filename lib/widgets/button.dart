import 'package:flutter/material.dart';

Widget Botao() {
  return Container(
    height: 50.0,
    child: ElevatedButton(
      onPressed: () {
        //função adicionar item ao mapa
      },
      child: Text('Adicionar'),
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          padding: EdgeInsets.all(10.0),
      textStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold
      )),
    ),
  );
}
