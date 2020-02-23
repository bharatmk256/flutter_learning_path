import 'package:flutter_sqflite/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io' as io;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'main.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
    );
    print('table is creaed');
  }

  // insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert('User', user.toMap());
    return res;
  }

  // deletion

  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete('User');
    return res;
  }
}
