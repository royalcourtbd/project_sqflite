// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:project_sqflite/data/product_model.dart';

class ProductListUiState {
  bool isLoading;
  List<ProductModel> productList;
  ProductListUiState({
    required this.isLoading,
    required this.productList,
  });

  ProductListUiState copyWith({
    bool? isLoading,
    List<ProductModel>? productList,
  }) {
    return ProductListUiState(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
    );
  }
}
