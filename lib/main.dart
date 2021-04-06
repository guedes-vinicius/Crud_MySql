import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.config(defaultTransition: Transition.cupertino);
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => HomePage())
      ],
    );
  }
}