import 'package:contador_estoque/controller/home_page_controler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:contador_estoque/data/bancoHelper.dart';
import 'package:contador_estoque/data/itens.dart';
import 'package:get/get.dart';
import 'package:contador_estoque/widgets/home_widgets.dart';

class ListaDeProdutos extends StatefulWidget {
  ListaDeProdutos({Key key, this.titulo}) : super(key: key);
  final String titulo;

  @override
  _ListaDeprodutosState createState() => _ListaDeprodutosState();
}

class _ListaDeprodutosState extends State<ListaDeProdutos> {
  _ListaDeprodutosState() {
    Get.put(HomePageController());
  }

  final _ccodigo = TextEditingController();
  final _cnome = TextEditingController();
  final _ccodbar = TextEditingController();
  final _cqtd = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  static DatabaseHelper banco;

  int tamanhoDaLista = 0;
  List<Itens> listaDeProdutos;
  List<Itens> listaPesquisa;

  @override
  void initState() {
    banco = DatabaseHelper();
    banco.inicializaBanco();

    Future<List<Itens>> listaDeProdutos = banco.getListaDeProdutos();
    listaDeProdutos.then((novaListaDeProdutos) {
      setState(() {
        this.listaDeProdutos = novaListaDeProdutos;
        this.listaPesquisa = novaListaDeProdutos;
        this.tamanhoDaLista = novaListaDeProdutos.length;
      });
    });
  }

  _carregarLista() {
    banco = DatabaseHelper();
    banco.inicializaBanco();
    Future<List<Itens>> noteListFuture = banco.getListaDeProdutos();
    noteListFuture.then((novaListaDeProdutos) {
      setState(() {
        this.listaDeProdutos = novaListaDeProdutos;
        this.tamanhoDaLista = novaListaDeProdutos.length;
      });
    });
  }

  _ordenarPorNome() {
    setState(() {
      banco.ordenarNome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        centerTitle: true,
      ),
      body: _listaDeProdutos(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.search_rounded),
                color: Colors.white,
                onPressed: () {}),
            IconButton(
                icon: Image.asset('assets/icon.png',
                    width: 25, color: Colors.white),
                onPressed: () {
                  Get.find<HomePageController>().escanearCodigoBarras();
                  _adicionarProdutoCod();
                }),
            Spacer(),
            GestureDetector(
              onTap: () => _ordenarN(Itens),
              onLongPress: () => _ordenarI(Itens),
              child: Icon(
                Icons.sort_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 0, 8, 0)),
            IconButton(
                icon: Icon(Icons.description_rounded),
                color: Colors.white,
                onPressed: () {})
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffff0000),
        child: Icon(Icons.add),
        onPressed: () {
          _adicionarProduto();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _removerItem(Itens itens, int index) {
    setState(() {
      listaDeProdutos = List.from(listaDeProdutos)..removeAt(index);
      banco.apagarProduto(itens.id);
      tamanhoDaLista = tamanhoDaLista - 1;
      Get.snackbar("Removido", "Item removido com Sucesso!");
    });
  }

  void _ordenarN(Itens) {
    setState(() {
      listaDeProdutos = List.from(listaDeProdutos)
        ..sort((a, b) => a.NomeProd.compareTo(b.NomeProd));
      banco.ordenarNome();
    });
  }

  void _ordenarI(Itens) {
    setState(() {
      listaDeProdutos = List.from(listaDeProdutos)
        ..sort((a, b) => a.id.compareTo(b.id));
      banco.ordenarId();
    });
  }

  void _filteritens(value) {
    setState(() {
      listaPesquisa = listaDeProdutos
          .where((Itens) =>
              Itens.NomeProd.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _adicionarProduto() {
    _ccodigo.text = '';
    _cnome.text = '';
    _ccodbar.text = '';
    _cqtd.text = '';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Novo Produto"),
            content: Container(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: campoCodigo(_ccodigo),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoNome(_cnome),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoCodBar(_ccodbar),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Flexible(child: campoQtd(_cqtd))
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Salvar'),
                onPressed: () {
                  Itens _itens;
                  if (_formkey.currentState.validate()) {
                    _itens = Itens(
                        _ccodigo.text, _cnome.text, _ccodbar.text, _cqtd.text);
                    banco.inserirProduto(_itens);
                    _carregarLista();
                    _formkey.currentState.reset();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
  }

  void _adicionarProdutoCod() {
    _ccodigo.text = '';
    _cnome.text = '';
    _ccodbar.text = Get.find<HomePageController>().valorCodigoBarras;
    _cqtd.text = '';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Novo Produto"),
            content: Container(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: campoCodigo(_ccodigo),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoNome(_cnome),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoCodBar(_ccodbar),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Flexible(child: campoQtd(_cqtd))
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Salvar'),
                onPressed: () {
                  Itens _itens;
                  if (_formkey.currentState.validate()) {
                    _itens = Itens(
                        _ccodigo.text, _cnome.text, _ccodbar.text, _cqtd.text);
                    banco.inserirProduto(_itens);
                    _carregarLista();
                    _formkey.currentState.reset();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
  }

  void _atualizarProduto(Itens itens) {
    _ccodigo.text = itens.CodProd;
    _cnome.text = itens.NomeProd;
    _ccodbar.text = itens.CodBar;
    _cqtd.text = itens.QtdProd;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Atualizar Produto"),
            content: Container(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: campoCodigo(_ccodigo),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoNome(_cnome),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoCodBar(_ccodbar),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Flexible(child: campoQtd(_cqtd))
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Atualizar'),
                onPressed: () {
                  Itens _itens;
                  if (_formkey.currentState.validate()) {
                    _itens = Itens(
                        _ccodigo.text, _cnome.text, _ccodbar.text, _cqtd.text);
                    banco.atualizarProduto(_itens, itens.id);

                    _carregarLista();

                    _formkey.currentState.reset();

                    Navigator.of(context).pop();
                  }
                  Get.snackbar("Atualizado", "Item atualizado");
                },
              ),
            ],
          );
        });
  }

  Widget _listaDeProdutos() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: tamanhoDaLista,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ListTile(
            title: Row(
              children: <Widget>[
                // Daqui pra baixo, não tenho a minima noção de como esta funcionando.
                Expanded(child: Text(listaDeProdutos[index].CodProd)),
                Expanded(child: Text(listaDeProdutos[index].NomeProd), flex: 2)
              ],
            ),
            subtitle: Text(listaDeProdutos[index].CodBar),
            trailing: Text(listaDeProdutos[index].QtdProd.toString()),
            leading: CircleAvatar(
              child: Text(listaDeProdutos[index].NomeProd[0]),
              backgroundColor: Color(0xffff0000),
              foregroundColor: Color(0xfffcfcfc),
            ),
          ),
          onLongPress: () => _removerItem(listaDeProdutos[0], index),
          onTap: () => _atualizarProduto(listaDeProdutos[index]),
        );
      },
    );
  }
}
