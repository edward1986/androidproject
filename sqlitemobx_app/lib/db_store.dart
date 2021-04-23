import 'dart:math';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'quotes_models.dart';

class DBStore {
  DBStore._();

  static Database _sqDatabase;
  static final db = DBStore._();

  Future<Database> get database async {
    if (_sqDatabase != null) {
      return _sqDatabase;
    }


    _sqDatabase = await initNewDB();

    return _sqDatabase;
  }

  Future initNewDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'quotes_list_sqlite.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
            'CREATE TABLE Quotes(id INTEGER PRIMARY KEY,author TEXT,quote TEXT, quoteId TEXT)',
          );
          await db.execute(
            'CREATE TABLE ApiCacheLog(id INTEGER PRIMARY KEY,name TEXT,lastUpdated TEXT)',
          );
        });
  }

  Future updateCacheLog(CacheLog cacheLog) async {
    final db = await database;
    final queryResult = await db.insert('ApiCacheLog', cacheLog.toMap());

    return queryResult;
  }


  Future getCacheLogs() async {
    final db = await database;
    final logs = await db.query('ApiCacheLog');

    return logs.isNotEmpty
        ? List.generate(
      logs.length,
          (i) =>
          CacheLog(
            logs[i]['id'],
            logs[i]['name'],
            logs[i]['lastUpdated'],
          ),
    )
        : [];
  }

  Future inserQuotes(List quotesList) async {
    final db = await database;
    final batch = db.batch();

    await clearTable('Quotes');

    for (int i = 0; i < quotesList.length; i++) {
      batch.insert('Quotes', quotesList[i].toMap());
    }

    await batch.commit();
    await updateCacheLog(CacheLog(
      Random().nextInt(100),
      'Quotes',
      (DateTime.now().toUtc()).toString(),
    ));
  }


  Future getQuotes() async {
    final db = await database;
    final labels = await db.query('Quotes');


    return labels.isNotEmpty
        ? List.generate(
      labels.length,
          (i) =>
          Quotes(
            labels[i]['id'],
            labels[i]['author'],
            labels[i]['quote'],
            labels[i]['quoteId'],
          ),
    )
        : [];
  }


  Future clearTable(String tableName) async {
    final db = await database;
    final queryResult = await db.rawDelete('DELETE FROM $tableName');

    return queryResult;
  }
}