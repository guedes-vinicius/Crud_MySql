import 'package:contador_estoque/components/text_dialog.dart';
import'package:flutter/material.dart';

class Add extends StatelessWidget {
  TextEditingController nomeProd = TextEditingController();
  TextEditingController codigo = TextEditingController();
  TextEditingController codBarra = TextEditingController();
  TextEditingController qtdProduto = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Item'),
        centerTitle: true,
        backgroundColor: Color(0xFFCB0A02)
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTextField("Nome", nomeProd, TextInputAction.done),
          Divider(),
            buildTextField("Codigo de Barras", codBarra, TextInputAction.done),
            Divider(),
            buildTextField("Codigo", codigo, TextInputAction.done),
            Divider(),
            buildTextField("Quantidade", qtdProduto, TextInputAction.done),
          ],
        ),
      )
    );
  }
}
