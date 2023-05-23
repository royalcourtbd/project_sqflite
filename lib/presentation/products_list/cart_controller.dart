import 'package:get/get.dart';
import 'package:project_sqflite/data/product_model.dart';

class CartController extends GetxController {
  final RxList<ProductModel> cartItems = RxList<ProductModel>();
  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price.roundToDouble());

  addToCart(ProductModel product) {
    cartItems.add(product);
  }
}
