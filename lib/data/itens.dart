import 'package:flutter/cupertino.dart';

class Itens {
  String CodProd;
  String NomeProd;
  String CodBar;
  int QtdProd;
  int id;

  Itens(
    this.CodProd,
    this.NomeProd,
    this.CodBar,
    this.QtdProd,
  );
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['CodProd'] = CodProd;
    map['NomeProd'] = NomeProd;
    map['CodBar'] = CodBar;
    map['QtdPrd'] = QtdProd;
    return map;
  }

  Itens.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.CodProd = map['CodProd'];
    this.NomeProd = map['NomeProd'];
    this.CodBar = map['CodBar'];
    this.QtdProd = map['QtdProd'];
  }
}





// codigo, nome, codigo de barras,quantidade