import 'package:flutter/material.dart';
import 'package:contador_estoque/body/add_item_cod.dart';

Widget campoCodigo() {
  return new TextFormField(
    controller: _ccodigo,
    keyboardType: TextInputType.text,
    validator: (valor) {
      if (valor == null || valor.trim().isEmpty) {
        return 'Codigo Invalido';
      }
    },
    decoration: InputDecoration(
        hintText: 'Codigo',
        labelText: 'Codigo do produto',
        border: OutlineInputBorder()),
  );
}

Widget campoNome() {
  return new TextFormField(
    controller: _cnome,
    keyboardType: TextInputType.text,
    validator: (valor) {
      if (valor == null || valor.trim().isEmpty) {
        return "invalido. Insira um nome";
      }
    },
    decoration: InputDecoration(
        hintText: 'Nome',
        labelText: 'Nome do item',
        border: OutlineInputBorder()),
  );
}

Widget campoCodBar() {
  return new TextFormField(
    controller: _ccodbar,
    keyboardType: TextInputType.number,
    validator: (valor) {
      if (valor == null || valor.isEmpty || valor.trim().length < 13) {
        return 'Invalido. O Codigo de barras precisa ter 13 digitos';
      }
    },
    decoration: InputDecoration(
        hintText: "Código de barras",
        labelText: "Código de barras",
        border: OutlineInputBorder()),
  );
}

Widget campoQtd() {
  return new TextFormField(
    controller: _cqtd,
    keyboardType: TextInputType.number,
    validator: (valor) {
      if (valor == null || valor.trim().isEmpty || valor == '0') {
        return 'Invalido. Insira algum valor a partir de 1';
      }
    },
    decoration: InputDecoration(
        hintText: 'Quantidade',
        labelText: 'Quantidade',
        border: OutlineInputBorder()),
  );
}
