import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'screens/manage_shop_screen.dart';

void main() {
  // Define the base URL based on platform
  String baseUrl = kIsWeb
      ? 'http://localhost:5000' // for web
      : 'http://10.0.2.2:5000'; // for Android emulator

  // You might want to use a provider or some state management to make this available throughout the app
  runApp(MyApp(baseUrl: baseUrl));
}

class MyApp extends StatelessWidget {
  final String baseUrl;

  const MyApp({super.key, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage Shop',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ManageShopScreen(baseUrl: baseUrl),
    );
  }
}
