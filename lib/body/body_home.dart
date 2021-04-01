import 'package:contador_estoque/components/prod_tile.dart';
import 'package:flutter/material.dart';
import 'package:contador_estoque/data/list_itens.dart';
var total = ListItens.length;
var total2 = ListItensNull.length;

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prods = {...ListItens};
    return Scaffold(
      body: ListView.builder(
          itemCount: prods.length,
          itemBuilder:(ctx,i) => ProdTiles(prods.values.elementAt(i)),
      ),
    );
  }
}
