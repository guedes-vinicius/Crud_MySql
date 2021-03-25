import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'home_page_controler.dart';

class HomePage extends StatelessWidget {
  HomePage() {
    Get.put(HomePageController());
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Estoque"),
            backgroundColor: Color(0xffff0000),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.search_rounded),
                  tooltip: "Pesquisar",
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.sort_rounded),
                  tooltip: "Ordenar",
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.description_sharp),
                  tooltip: "Exportar",
                  onPressed: () {})
            ],
            bottom: TabBar(
                indicatorWeight: 3.0,
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    text: "Contagem",
                  ),
                  Tab(
                    text: "Produtos",
                  )
                ]),
          ),
          body: SizedBox.expand(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(250.0, 380.0, 0.0, 0.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                      icon: Image.asset(
                        'assets/icon.png'
                      ),
                      iconSize: 50,
                      onPressed: () => Get.find<HomePageController>()
                          .escanearCodigoBarras()),
                  Expanded(
                    child: IconButton(
                      icon: Image.asset(
                          'assets/more.png'),
                      padding: const EdgeInsets.fromLTRB(250.0, 500.0, 0.0, 0.0),
                      iconSize: 50,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          )),
        ));
  }
}




//list view itens, page control(page view)
