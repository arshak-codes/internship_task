import 'package:flutter/material.dart';
import 'screens/manage_shop_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage Shop',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ManageShopScreen(),
    );
  }
}
