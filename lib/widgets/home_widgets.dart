import 'package:contador_estoque/components/prod_tile.dart';
import 'package:flutter/material.dart';
import 'package:contador_estoque/data/list_itens.dart';
import 'package:contador_estoque/body/body_home.dart';

class Find extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final lista = {...ListItens};
    return Scaffold(
      body: Column(children: <Widget>[
        Padding(padding: EdgeInsets.all(10.0),
        child: TextField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: "Pesquise aqui",
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
          ),
          style: TextStyle(color: Colors.white,fontSize: 18.0),
          textAlign: TextAlign.center,

        ),)
      ],),
    );


  }
}
/*class List extends StatelessWidget{
  @override
  Widget build (BuildContext context)*/

