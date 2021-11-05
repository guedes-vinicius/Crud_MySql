import 'package:contador_estoque/screens/Add%20Item.dart';
import 'package:contador_estoque/screens/HomePage.dart';
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
          scaffoldBackgroundColor: Color(0xff232c51),
          primaryColor: Color(0xffff0000),
          bottomAppBarColor: Color(0xff18203d)),
      getPages: [
        GetPage(
          name: '/',
          page: () => ListaDeProdutos(titulo: 'Contador de Estoque'),
        ),
        GetPage(name: '/AddItem', page: () => AddItem())
      ],
      title: 'Contador de Estoque',
      home: ListaDeProdutos(titulo: 'Contador de Estoque'),
    );
  }
}
