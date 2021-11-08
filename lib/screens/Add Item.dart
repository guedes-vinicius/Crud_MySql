import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:contador_estoque/screens/HomePage.dart';
import 'package:contador_estoque/widgets/home_widgets.dart';
import 'package:contador_estoque/data/bancoHelper.dart';
import 'package:contador_estoque/data/itens.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formkey = GlobalKey<FormState>();
  final _ccodigo = TextEditingController();
  final _cnome = TextEditingController();
  final _ccodbar = TextEditingController();
  final _cqtd = TextEditingController();
  static DatabaseHelper banco;

  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff18203d),
        title: Text('Adicionar Item',
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
          child: Container(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  campoCodigo(_ccodigo),
                  Divider(),
                  campoNome(_cnome),
                  Divider(),
                  campoCodBar(_ccodbar),
                  Divider(),
                  campoQtd(_cqtd),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                        style: buttonStyle,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [
                                    0.3,
                                    1
                                  ],
                                  colors: [
                                    Color.fromARGB(
                                      255,
                                      255,
                                      136,
                                      34,
                                    ),
                                    Color.fromARGB(255, 255, 177, 41)
                                  ])),
                          child: Text(
                            'Salvar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        onPressed: () {
                          Itens _itens;
                          if (_formkey.currentState.validate()) {
                            _itens = Itens(_ccodigo.text, _cnome.text,
                                _ccodbar.text, _cqtd.text);
                            banco.inserirProduto(_itens);
                            //_carregarLista();
                            _formkey.currentState.reset();
                            Navigator.of(context).pop();
                          }
                        }),
                  )
                ],
              ),
            ),
          )),
      //backgroundColor: Color(0xff232c51),
    );
  }
}
