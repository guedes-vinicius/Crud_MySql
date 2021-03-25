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
          backgroundColor: Color(0xFFCB0A02),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Color(0xffff0000),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomAppBar(
            color: Color(0xFFCB0A02), child: Container(height: 35.0)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Contagens',style:
                  TextStyle(
                    fontWeight: FontWeight.w800
                  ),),
                  Text('0')
                ],
              ),
              Column(
                children: [
                  Text('Produtos'),
                  Text('0')
                ],
              )
            ],
          ),

        )
      ),
    );
  }
}

//list view itens, page control(page view)
