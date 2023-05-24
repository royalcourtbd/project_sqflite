// ignore_for_file: public_member_api_docs, sort_constructors_first

const String productDatabaseName = 'productDatabase.db';
const int productDatabaseVersion = 1;
const String productDatabaseTableName = 'productTable';
const String databaseTableName2 = 'productTable';
const String databaseProductTableColumnId = 'id';
const String databaseProductTableColumnName = 'name';
const String databaseProductTableColumnImage = 'name';
const String databaseProductTableColumnDescription = 'description';
const double databaseProductTableColumnPrice = 12.5;

class ProductModel {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  ProductModel({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.price,
  });

  ProductModel copyWith({
    int? id,
    String? productName,
    String? productImage,
    String? productDescription,
    double? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      productDescription: productDescription ?? this.productDescription,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productName': productName,
      'productImage': productImage,
      'productDescription': productDescription,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      productName: map['productName'] as String,
      productImage: map['productImage'] as String,
      productDescription: map['productDescription'] as String,
      price: map['price'] as double,
    );
  }
}
