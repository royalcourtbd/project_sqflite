import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sqflite/presentation/products_list/cart_controller.dart';
import 'package:project_sqflite/presentation/products_list/product_list_controller.dart';
import 'package:project_sqflite/presentation/products_list/product_list_ui_state.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final ProductListController _productListController =
      Get.put(ProductListController());
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetX<ProductListController>(
      init: _productListController,
      initState: (_) {},
      builder: (_) {
        final ProductListUiState ui = _productListController.uiState.value;
        final products = ui.productList;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product List'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ui.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              margin: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(products[index].productName),
                                        Text(
                                            products[index].productDescription),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('${products[index].price}\$'),
                                        ElevatedButton(
                                          onPressed: () {
                                            _cartController
                                                .addToCart(products[index]);
                                          },
                                          child: const Text('Add to cart'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 50),
              Obx(() => Text(
                    'Product Amount: \$ ${_cartController.totalPrice}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  )),
              const SizedBox(height: 100)
            ],
          ),
        );
      },
    );
  }
}
