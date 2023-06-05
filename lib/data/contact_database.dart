import 'package:hive_flutter/hive_flutter.dart';

class ContactDatabase {
  static Future<void> createItem(Map<String, dynamic> item) async {
    final shoppingBox = Hive.box('shopping_box');
    await shoppingBox.add(item);
  }
}
