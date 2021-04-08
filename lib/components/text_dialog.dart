import 'package:flutter/material.dart';
import 'package:contador_estoque/widgets/home_widgets.dart';

Widget buildTextField(String title, TextEditingController c, TextInputAction) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelText: title,
      labelStyle: TextStyle(color: Colors.red),
      suffixIcon: IconButton(
          icon: Icon(Icons.close, color: Colors.red[700]), onPressed: c.clear),
      border: OutlineInputBorder(),
    ),
    textInputAction: TextInputAction,
    style: TextStyle(color: Colors.red, fontSize: 18.0),
    textAlign: TextAlign.center,
    autofocus: true,
  );
}
