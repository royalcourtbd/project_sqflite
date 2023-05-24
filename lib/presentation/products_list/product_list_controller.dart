import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sqflite/data/database_helper.dart';
import 'package:project_sqflite/data/product_model.dart';
import 'package:project_sqflite/presentation/products_list/product_list_ui_state.dart';
import 'dart:developer' as dev;

class ProductListController extends GetxController {
  Rx<ProductListUiState> uiState = Rx(ProductListUiState(
      isLoading: false, productList: [], count: 0, totalPrice: 0));

  // Future<void> fetchNoteList() async {
  //   _loading();
  //   final List<ProductModel> productMapList =
  //       await DatabaseHelper.getAllProduct();
  //   uiState.value =
  //       uiState.value.copyWith(isLoading: false, productList: productMapList);
  // }

  Future<void> fetchProductList() async {
    _loading();
    await Future.delayed(const Duration(seconds: 2));
    List<ProductModel> productMapList = [
      ProductModel(
        id: 1,
        productName: 'Amm',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 2,
        productName: 'Jaam',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 4,
        productName: 'Kathal',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 3,
        productName: 'Kathal',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
    ];
    uiState.value =
        uiState.value.copyWith(productList: productMapList, isLoading: false);
  }

  Future<void> insertCartProduct(
      {required ProductModel? productModel,
      required VoidCallback onInserted}) async {
    if (productModel == null) return;
    final product = productModel.toMap();
    dev.log(product.toString());

    DatabaseHelper.insertData(databaseTableName2, product);

    uiState.value = uiState.value.copyWith(
        totalPrice: uiState.value.productList
            .fold(0, (sum, item) => sum ?? 0 + item.price.roundToDouble()),
        count: uiState.value.productList.length);

    onInserted();
  }

  Future<void> getCartList() async {
    final List<ProductModel> productMapList =
        await DatabaseHelper.getAllProduct();
    uiState.value = uiState.value.copyWith(productList: productMapList);

    uiState.value =
        uiState.value.copyWith(productList: productMapList, isLoading: false);
  }

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
    getCartList();
  }

  void _loading() => uiState.value = uiState.value.copyWith(isLoading: true);
  void _loaded() => uiState.value = uiState.value.copyWith(isLoading: false);
}
