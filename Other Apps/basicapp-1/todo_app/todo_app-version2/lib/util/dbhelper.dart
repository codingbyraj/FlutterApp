import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'package:todo_app/model/todo.dart';

class DBHelper {
  static final DBHelper _dbHelper = DBHelper._internal();

  String tblTodo = "todo";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colDate = "date";
  String colPriority = "priority";
  String colSorting = "date";
  String colOrder = "";

  DBHelper._internal();

  factory DBHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDB();
    }
    return _db;
  }

  Future<Database> initializeDB() async {
    Directory dir =
        await getApplicationDocumentsDirectory(); // the function is in path_provider package. it returns the path of current folder. Although, path is different in IOS and Android but It will work in both case.
    String path = dir.path + "todos.db";
    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tblTodo ($colId INTEGER PRIMARY KEY, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)");
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert(tblTodo, todo.toMap());
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $tblTodo"));
    return result;
  }

  Future<List> getTodos([String col, String order]) async {
    Database db = await this.db;
    if (col != null) {
      colSorting = col;
    }
    if (order != null) {
      colOrder = order;
    }

    var result = await db
        .rawQuery("SELECT * FROM $tblTodo ORDER BY $colSorting $colOrder");
    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.update(tblTodo, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    var result = await db.delete(tblTodo, where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}
