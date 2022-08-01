import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k2x_assesment/root/root.dart';
import 'package:k2x_assesment/shopping/shopping_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoppingController()),
      ],
      child: GetMaterialApp(
        title: 'K2x Assesment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.teal.shade300,
            primarySwatch: Colors.teal,
            scaffoldBackgroundColor: Colors.grey.shade100),
        home: const Root(),
      ),
    );
  }
}
