import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    errorBorder: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(),
    disabledBorder: OutlineInputBorder(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        textStyle: TextStyle(fontSize: 18.0),
        disabledBackgroundColor: Colors.grey),
  ),
  primarySwatch: Colors.red,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
