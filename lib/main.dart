import 'package:e_commerce_flutter/constans/theme.dart';
import 'package:flutter/material.dart';
import 'screens/login/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
