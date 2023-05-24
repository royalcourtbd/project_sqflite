// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:project_sqflite/data/product_model.dart';

class ProductListUiState {
  final bool isLoading;
  final List<ProductModel> productList;
  final int count;
  final double totalPrice;
  ProductListUiState({
    required this.isLoading,
    required this.productList,
    required this.count,
    required this.totalPrice,
  });

  ProductListUiState copyWith({
    bool? isLoading,
    List<ProductModel>? productList,
    int? count,
    double? totalPrice,
  }) {
    return ProductListUiState(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
      count: count ?? this.count,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
