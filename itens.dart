import 'package:flutter/cupertino.dart';

class Itens {
  final String CodProd;
  final String NomeProd;
  final String CodBar;
  final int QtdProd;

  const Itens({
    this.CodProd,
    this.NomeProd,
    @required this.CodBar,
    @required this.QtdProd,
  });
}






// codigo, nome, codigo de barras,quantidade