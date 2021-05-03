import 'package:contador_estoque/home_page_controler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:contador_estoque/data/bancoHelper.dart';
import 'package:contador_estoque/data/itens.dart';
import 'package:get/get.dart';

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

  int qtd;

  final _formkey = new GlobalKey<FormState>();
  static DatabaseHelper banco;

  int tamanhoDaLista = 0;
  List<Itens> listaDeProdutos;

  @override
  void initState() {
    banco = new DatabaseHelper();
    banco.inicializaBanco();

    Future<List<Itens>> listaDeProdutos = banco.getListaDeProdutos();
    listaDeProdutos.then((novaListaDeProdutos) {
      setState(() {
        this.listaDeProdutos = novaListaDeProdutos;
        this.tamanhoDaLista = novaListaDeProdutos.length;
      });
    });
  }

  _carregarLista() {
    banco = new DatabaseHelper();
    banco.inicializaBanco();
    Future<List<Itens>> noteListFuture = banco.getListaDeProdutos();
    noteListFuture.then((novaListaDeProdutos) {
      setState(() {
        this.listaDeProdutos = novaListaDeProdutos;
        this.tamanhoDaLista = novaListaDeProdutos.length;
      });
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
        color: Color(0xffff0000),
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
                onPressed: () =>
                    Get.find<HomePageController>().escanearCodigoBarras()),
            Spacer(),
            IconButton(
                icon: Icon(Icons.sort_rounded),
                color: Colors.white,
                onPressed: () {}),
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
            title: new Text("Novo Produto"),
            content: new Container(
              child: new Form(
                key: _formkey,
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: campoCodigo(),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoNome(),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoCodBar(),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Flexible(child: campoQtd())
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text('Salvar'),
                onPressed: () {
                  Itens _itens;
                  if (_formkey.currentState.validate()) {
                    _itens = new Itens(
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
            title: new Text("Atualizar Produto"),
            content: new Container(
              child: new Form(
                key: _formkey,
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: campoCodigo(),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoNome(),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 10,
                    ),
                    Flexible(
                      child: campoCodBar(),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Flexible(child: campoQtd())
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text('Atualizar'),
                onPressed: () {
                  Itens _itens;
                  print(_cqtd);
                  if (_formkey.currentState.validate()) {
                    _itens = new Itens(
                        _ccodigo.text, _cnome.text, _ccodbar.text, _cqtd.text);
                    banco.atualizarProduto(_itens, itens.id);

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

  Widget campoCodigo() {
    return new TextFormField(
      controller: _ccodigo,
      keyboardType: TextInputType.text,
      validator: (valor) {
        if (valor == null || valor.trim().isEmpty) {
          return 'Codigo Invalido';
        }
      },
      decoration: InputDecoration(
          hintText: 'Codigo',
          labelText: 'Codigo do produto',
          border: OutlineInputBorder()),
    );
  }

  Widget campoNome() {
    return new TextFormField(
      controller: _cnome,
      keyboardType: TextInputType.text,
      validator: (valor) {
        if (valor == null || valor.trim().isEmpty) {
          return "invalido. Insira um nome";
        }
      },
      decoration: InputDecoration(
          hintText: 'Nome',
          labelText: 'Nome do item',
          border: OutlineInputBorder()),
    );
  }

  Widget campoCodBar() {
    return new TextFormField(
      controller: _ccodbar,
      keyboardType: TextInputType.number,
      validator: (valor) {
        if (valor == null || valor.isEmpty || valor.trim().length < 13) {
          return 'Invalido. O Codigo de barras precisa ter 13 digitos';
        }
      },
      decoration: InputDecoration(
          hintText: "Código de barras",
          labelText: "Código de barras",
          border: OutlineInputBorder()),
    );
  }

  Widget campoQtd() {
    return new TextFormField(
      controller: _cqtd,
      keyboardType: TextInputType.number,
      validator: (valor) {
        if (valor == null || valor.trim().isEmpty || valor == '0') {
          return 'Invalido. Insira algum valor a partir de 1';
        }
      },
      decoration: InputDecoration(
          hintText: 'Quantidade',
          labelText: 'Quantidade',
          border: OutlineInputBorder()),
    );
  }

  Widget _listaDeProdutos() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: tamanhoDaLista,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ListTile(
            title: Row(
              children: <Widget>[ // Daqui pra baixo, não tenho a minima noção de como esta funcionando.
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
