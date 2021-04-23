import 'package:sqflite/sqflite.dart';

import 'db_connection.dart';

class Repository {
  DatabaseConnection _connection;
  Repository(){
    _connection = DatabaseConnection();
  }
  static Database _database;
  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await _connection.setDatabase();
    return _database;
  }
  save(table, values) async{
    var conn = await database;
    return await conn.insert(table, values);
  }
  getAll(table) async {
    var conn = await database;
    return await conn.query(table);
  }
  getById(String table, categoryId) async {
    var conn  = await database;
    return await conn.query(table, where: "id=?", whereArgs: [categoryId]);
  }

  update(String table, data) async {
    var conn = await database;
    return await conn.update(table, data, where: "id=?", whereArgs: [data["id"]]);
  }

  delete(String table, categoryId) async {
    var conn = await database;
    return conn.rawDelete("DELETE FROM $table WHERE id = $categoryId");
  }

}