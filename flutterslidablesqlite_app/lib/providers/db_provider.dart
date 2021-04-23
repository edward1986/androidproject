import 'dart:io';

import '../models/employee_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'employee_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE Employee('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'email TEXT,'
              'firstName TEXT,'
              'lastName TEXT,'
              'avatar TEXT'
              ')');
        });
  }

  createEmployee(Employee em) async {
    final db = await database;
    final res = await db.insert('Employee', em.toJson());

    return res;
  }

  getById(String table, column, value) async {
    var conn = await database;
    return await conn.query(table, where: "$column=?", whereArgs: [value]);
  }
  deleteAllEmployee() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Employee');
    return res;
  }

  Future<List<Employee>> getAllEmployees() async {
    final db = await database;
    final res = await db.rawQuery('SELECT * FROM Employee');

    List<Employee> li =
    res.isNotEmpty ? res.map((e) => Employee.fromJson(e)).toList() : [];

    return li;
  }

  deleteEmployeeById(int idx) async {
    final db = await database;
    final res = await db.delete('Employee', where: 'id = ?', whereArgs: [idx]);
    return res;
  }
}