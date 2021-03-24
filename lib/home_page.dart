import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_controler.dart';

class HomePage extends StatelessWidget {
  HomePage() {
    Get.put(HomePageController());
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Estoque"),
          backgroundColor: Colors.redAccent,
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
                tooltip: "importar/exportar",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Image.asset(
                    'icon.png',
                    width: 50,
                    scale: 10,
                  ),
                  onPressed: () => Get.find<HomePageController>()
                      .escanearCodigoBarras()) /*(
                      icon: Image.asset(
                        'assets/icon.png',
                        width: 50,
                      ),
                      label: Text("Ler codigo de barras",
                          style: Get.theme.textTheme.headline6),
                      onPressed: () =>
                          Get.find<HomePageController>().escanearCodigoBarras())*/
            ],
          ),
        ),
      ),
    );
  }
}

//list view itens, page control(page view)
