import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'components/text_dialog.dart';
import 'home_page_controler.dart';
import 'package:contador_estoque/body/body_home.dart';
import 'package:contador_estoque/widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  HomePage() {
    Get.put(HomePageController());
    /*openSearch(BuildContext context) {
      showDialog(context: context,builder:(_) => SearchDialog() );
    }
    }*/
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contador de Estoque"),
          centerTitle: true,
          backgroundColor: Color(0xFFCB0A02),
          bottom: TabBar(
              indicatorWeight: 3.0,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: "Total: $total",
                ),
                Tab(
                  text: "Cadastrados: $total2",
                )
              ]),
        ),
        body: TabBarView(
          children: [
            BodyHome(), //tab1
            Icon(Icons.ac_unit) //tab2
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xffff0000),
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.search_rounded),
                  color: Colors.white,
                  onPressed: () {
                    Get.to(() => Find());
                  }),
              IconButton(
                icon: Image.asset(
                  'assets/icon.png',
                  width: 25,
                  color: Colors.white,
                ),
                onPressed: () =>Get.find<HomePageController>().escanearCodigoBarras(),
              ),
              Spacer(),
              IconButton(
                  icon: Icon(Icons.sort_rounded),
                  color: Colors.white,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.description_rounded),
                  color: Colors.white,
                  onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffff0000),
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}