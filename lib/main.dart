import 'package:e_commerce_flutter/constans/theme.dart';
import 'package:flutter/material.dart';
import 'screens/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: Welcome(),
    );
  }
}
