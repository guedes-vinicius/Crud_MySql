import 'package:flutter/material.dart';
import 'package:contador_estoque/screens/HomePage.dart';
import 'package:get/get.dart';
import 'package:contador_estoque/widgets/home_widgets.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _ccodigo = TextEditingController();
  final _cnome = TextEditingController();
  final _ccodbar = TextEditingController();
  final _cqtd = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  Container(
                    height: 40,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
