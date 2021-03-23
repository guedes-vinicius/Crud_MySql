import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page_controler.dart';

class HomePage extends StatelessWidget{
  HomePage(){
    //Get.put(HomePageController()); //Criar controlador
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Estoque"),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.sort) ,
              tooltip: "Ordenar",
        onPressed: (){}
        ),
          IconButton(icon: const Icon(Icons.search),
              tooltip: "Pesquisar",
              onPressed: (){}
              ),
          IconButton(icon: const Icon(Icons.settings_applications), onPressed: (){})
        ],
      ),
    );
  }
}




// codigo, nome, codigo de barras,
//list view itens, page control(page view)