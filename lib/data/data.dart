import 'package:drift/drift.dart';

part 'data.g.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
}

class Details extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get productId => integer().references(Products, #id)();
}

abstract class ProductsView extends View {
  Products get products;
  Details get details;

  @override
  Query as() => select([
        products.title,
        details.name,
      ]).from(products).join([
        innerJoin(
          details,
          details.productId.equalsExp(products.id),
        ),
      ]);
}

@DriftDatabase(tables: [
  Products,
  Details,
], views: [
  ProductsView
  
])
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);
  @override
  int get schemaVersion => 2;
}
