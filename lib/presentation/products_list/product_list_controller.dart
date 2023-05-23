import 'package:get/get.dart';
import 'package:project_sqflite/data/product_model.dart';
import 'package:project_sqflite/presentation/products_list/product_list_ui_state.dart';

class ProductListController extends GetxController {
  
  Rx<ProductListUiState> uiState = Rx(ProductListUiState(
    isLoading: false,
    productList: [],
  ));

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
        id: 1,
        productName: 'Jaam',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 1,
        productName: 'Kathal',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 1,
        productName: 'Kathal',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 1,
        productName: 'Kathal',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 1,
        productName: 'Kathal',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 1,
        productName: 'Kathal',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 1,
        productName: 'Kathal',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
      ProductModel(
        id: 1,
        productName: 'Kathal',
        productImage: 'productImage',
        productDescription: 'productDescription',
        price: 12.54,
      ),
    ];
    uiState.value =
        uiState.value.copyWith(productList: productMapList, isLoading: false);
  }

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
  }

  void _loading() => uiState.value = uiState.value.copyWith(isLoading: true);
  void _loaded() => uiState.value = uiState.value.copyWith(isLoading: false);
}
