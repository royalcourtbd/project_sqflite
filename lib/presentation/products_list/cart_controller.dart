import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sqflite/data/database_helper.dart';
import 'package:project_sqflite/data/product_model.dart';
import 'dart:developer' as dev;

import 'package:project_sqflite/presentation/products_list/product_list_ui_state.dart';

class CartController extends GetxController {
  Rx<ProductListUiState> uiState = Rx(
    ProductListUiState(
      isLoading: false,
      productList: [],
      count: 0,
      totalPrice: 0,
    ),
  );

 

 
}
