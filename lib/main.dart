import 'package:contador_estoque/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.config(defaultTransition: Transition.cupertino);
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xffff0000),
          primarySwatch: Colors.red,
          bottomAppBarColor: Color(0xffff0000)),
      getPages: [
        GetPage(
            name: '/',
            page: () => ListaDeProdutos(titulo: 'Contador de Estoque'))
      ],
      title: 'Contador de Estoque',
      home: ListaDeProdutos(titulo: 'Contador de Estoque'),
    );
  }
}
