import 'package:contador_estoque/data/itens.dart';
import 'package:contador_estoque/home_page_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:contador_estoque/data/database_helper.dart';
import 'package:contador_estoque/widgets/funcoes.dart';

class AddCodBar extends StatelessWidget {
  final dbHelper = Databasehelper.instance;
  final _form = new GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  final _ccodigo = TextEditingController();
  final _cnome = TextEditingController();
  final _ccodbar = TextEditingController();
  final _cqtd = TextEditingController();

  int tamandoDaLista = 0;
  List<Itens> listaDeItens;

  void initState() {
    banco = new DatabaseHelper();
    banco.inicializabanco();

    Future<List<Itens>> listaDeItens = banco.getListaDeItens();

    listaDeItens.then((novaListaDeItens) {
      setState(() {
        this.listaDeItens = novaListaDeItens;
        this.tamandoDaLista = novaListaDeItens.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Adicionar Item'),
            actions: [
              IconButton(
                  icon: Icon(Icons.save_outlined),
                  onPressed: () {
                    final isValid = _form.currentState.validate();

                    if (isValid) {
                      _form.currentState.save();
                      var item = Itens(
                          CodProd: _formData['CodProd'],
                          NomeProd: _formData['NomeProd'],
                          CodBar: _formData['CodBar'],
                          QtdProd: int.parse(_formData['QtdProd']));
                      Get.back();
                      Get.snackbar('Adicionado', 'Produto adicionado');
                    }
                  })
            ],
            centerTitle: true,
            backgroundColor: Color(0xFFCB0A02)),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                Flexible(
                    child: TextFormField(
                        cursorColor: Colors.red,
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(labelText: 'Codigo'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Codigo Invalido';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['CodProd'] = value)),
                Flexible(
                    child: TextFormField(
                        cursorColor: Colors.red,
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(labelText: 'Nome'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Invalido. Insira um nome';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['NomeProd'] = value)),
                Flexible(
                    child: TextFormField(
                        initialValue:
                            Get.find<HomePageController>().valorCodigoBarras,
                        cursorColor: Colors.red,
                        style: TextStyle(color: Colors.red),
                        decoration:
                            InputDecoration(labelText: 'Codigo de Barras'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 13) {
                            return 'Invalido. O Codigo de barras precisa ter 13 digitos';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['CodBar'] = value)),
                Flexible(
                    child: TextFormField(
                        cursorColor: Colors.red,
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(labelText: 'Quantidade'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value == '0') {
                            return 'Invalido. Insira algum valor a partir de 1';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['QtdProd'] = value)),
              ],
            ),
          ),
        ));
  }
}
