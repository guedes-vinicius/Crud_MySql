import 'package:contador_estoque/data/itens.dart';
import 'package:flutter/material.dart';

class ProdTiles extends StatelessWidget {
  final Itens itens;
  const ProdTiles(this.itens);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(child: Text(itens.CodProd),flex: 1),
          Expanded(child: Text(itens.NomeProd),flex: 3,) //Text(itens.NomeProd)
        ],
      ),
      subtitle: Text(itens.CodBar),
      trailing: Text(itens.QtdProd.toString()),
    );
  }
}
