import 'package:contador_estoque/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    Get.config(defaultTransition: Transition.cupertino);
    return GetMaterialApp(
      theme: tema.copyWith(
          colorScheme: tema.colorScheme
              .copyWith(primary: Colors.white, secondary: Colors.orange)),
      getPages: [
        GetPage(
          name: '/',
          page: () => ListaDeProdutos(titulo: 'Crud_MySqll'),
        ),
      ],
      title: 'Crud_MySql',
      home: ListaDeProdutos(titulo: 'Crud_MySql'),
    );
  }
}
