import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/data.dart';
import 'package:project_sqflite/presentation/Contact_info/contact_info_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final appDocumentDir = await getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDir.path);
  // await Hive.initFlutter();

  final db = Database(NativeDatabase.memory());

  await db.into(db.products).insert(ProductsCompanion.insert(
      title: 'FLutter Drift', description: 'Flutter database Descriptiion'));

  (await db.select(db.products).get()).forEach(print);
  // await Hive.openBox('shopping_box');
  // final contactBox = await Hive.openBox('contact_box');

  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactInfoPage(),
    );
  }
}
