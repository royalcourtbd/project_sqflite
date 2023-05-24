import 'package:path_provider/path_provider.dart';
import 'package:project_sqflite/data/employee_model.dart';
import 'package:project_sqflite/data/product_model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DatabaseHelper {
  static const String createEmployeeTable =
      '''create table $databaseTableName($databaseEmployeeTableColumnId integer primary key autoincrement, $databaseEmployeeTableColumnName text not null,  $databaseEmployeeTableColumnDesignation text not null)''';

  static const String productTable =
      '''create table $databaseTableName2('id' integer primary key autoincrement, 'productName' text not null,  'productImage' text not null, 'price' real not null, 'productDescription' text not null)''';

  static Future<Database> open() async {
    final dbPath = await getApplicationDocumentsDirectory();
    final path = Path.join(dbPath.path, 'databaseName.db');

    return openDatabase(
      path,
      version: databaseVersion,
      onCreate: (db, version) {
        db.execute(productTable);
      },
    );
  }

  static Future<int> insertData(
      String tableName, Map<String, dynamic> row) async {
    final db = await open();
    return db.insert(tableName, row);
  }

  static Future<List<EmployeeModel>> getAllEmployee() async {
    final db = await open();
    final List<Map<String, dynamic>> map = await db.query(databaseTableName,
        orderBy: databaseEmployeeTableColumnName);

    return List.generate(
        map.length, (index) => EmployeeModel.fromJson(map[index]));
  }
  static Future<List<ProductModel>> getAllProduct() async {
    final db = await open();
    final List<Map<String, dynamic>> map = await db.query(databaseTableName2,
        orderBy: 'productName');

    return List.generate(
        map.length, (index) => ProductModel.fromMap(map[index]));
  }

  static Future<int> updateDatabase(Map<String, dynamic> map) async {
    final db = await open();
    int id = map[databaseEmployeeTableColumnId];
    return await db.update(databaseTableName, map,
        where: '$databaseEmployeeTableColumnId = ?', whereArgs: [id]);
  }

  static Future<int> deleteDatabase(int id) async {
    final db = await open();
    return await db.delete(databaseTableName,
        where: '$databaseEmployeeTableColumnId = ?', whereArgs: [id]);
  }
}
