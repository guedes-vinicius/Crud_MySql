SizedBox.expand(
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
IconButton(
icon: Image.asset(
'assets/more.png'
),
iconSize: 50,
padding: const EdgeInsets.fromLTRB(250.0, 300.0, 0.0, 0.0) ,
onPressed: (){})
],
),
),
))