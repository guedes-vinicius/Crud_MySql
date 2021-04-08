import 'package:contador_estoque/components/text_dialog.dart';
import 'package:flutter/material.dart';
import 'package:contador_estoque/widgets/button.dart';
import 'package:get/get.dart';

class Add extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Adicionar Item'),
            actions: [
              IconButton(icon: Icon(Icons.save_outlined), onPressed: () {
                _form.currentState.save();
                Get.back();
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
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  onSaved: (value){
                    print(value);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Codigo de barras'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Codigo'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Quantidade'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ));
  }
}
