import 'dart:math';

import 'package:flutter/material.dart';
import 'package:contador_estoque/data/list_itens.dart';
import 'package:contador_estoque/data/itens.dart';
import 'package:get/get.dart';

class ListProvider with ChangeNotifier {
  final Map<String, Itens> _itens = {...ListItens};

  List<Itens> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  void inserir(Itens itens) {
    if (itens == null) {
      return;
    }

    final id = Random().nextDouble().toString();
    _itens.putIfAbsent(
        id,
        () => Itens(
            CodProd: itens.CodProd,
            NomeProd: itens.NomeProd,
            CodBar: itens.CodBar,
            QtdProd: itens.QtdProd));
  }
}
