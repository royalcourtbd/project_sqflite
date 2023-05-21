import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String dbName = 'myDatabase.db';
const int dbVersion = 1;
const String dbTable = 'myTable';
const String dbColumnId = 'id';
const String dbColumnName = 'name';

class DbHelper {
  static final DbHelper instance = DbHelper();

  //db initialize

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await initDb();
    return _database;
  }

  initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
 
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    db.execute(
        '''create table $dbTable($dbColumnId integer primary key autoincrement, $dbColumnName text not null)

''');
  }

  insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db!.insert(dbTable, row);
  }

  Future<List<Map<String, dynamic>>> queryDatabase() async {
    final db = await database;
    return await db!.query(dbTable);
  }

  Future<int> updateDatabase(Map<String, dynamic> row) async {
    final db = await database;

    int id = row[dbColumnId];
    return await db!
        .update(dbTable, row, where: '$dbColumnId = ?', whereArgs: [id]);
  }

  Future<int> deleteDatabase(int id) async {
    final db = await database;
    return await db!.delete(dbTable, where: '$dbColumnId = ?', whereArgs: [id]);
  }
}
