import 'package:flutter/material.dart';

Widget campoCodigo(){
  return new TextFormField(
    controller: _ccodigo, //criar controlador
    keyboardType: TextInputType.text,
    validator: (valor){
    if (valor == null || valor.trim().isEmpty) {
      return 'Codigo Invalido';
      }
    }
  );
}

Widget campoNome() {
  return new TextFormField(
    controller: _cnome,
    keyboardType: TextInputType.text,
    validator: (valor){
    if (valor == null || valor.trim().isEmpty){
      return "invalido. Insira um nome";
      }
    }
  );
}

Widget campoCodBar(){
  return new TextFormField(
    controller: _ccodbar,
    keyboardType: TextInputType.number,
    validator: (valor){
      if (valor == null ||
      valor.isEmpty ||
      valor.trim().length < 13) {
      return 'Invalido. O Codigo de barras precisa ter 13 digitos';
     }
    }
  );
}

Widget campoQtd(){
  return new TextFormField(
    controller: _cqtd,
    keyboardType: TextInputType.number,
    validator: (valor){
      if (valor == null ||
      valor.trim().isEmpty ||
      valor == '0') {
      return 'Invalido. Insira algum valor a partir de 1';
     }
    }
  );
}