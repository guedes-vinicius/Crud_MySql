import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Databasehelper {
  static final _datavaseName = "Produtos.db";
  static final _databaseVersion = 1;

  static final table = 'itens';

  static final columnId = '_id';
  static final columnCodigo = 'codigo';
  static final columnNome = 'nome';
  static final columnCodigoBarra = 'barra';
  static final columQuantidade = 'quantidade';

  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _datavaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnCodigo TEXT NOT NULL
            $columnNome TEXT NOT NULL,
            $columnCodigoBarra TEXT NOT NULL,
            $columQuantidade INTEGER NOT NULL
            
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
  
  Future<int> queryRowCount() async{
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }


  Future<int> update (Map<String, dynamic> row) async{  //ver depois, vai dar errado
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async { // ver depois, vai dar errado
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?',whereArgs: [id]);
  }


}
