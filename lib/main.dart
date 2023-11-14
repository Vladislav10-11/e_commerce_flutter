import 'package:e_commerce_flutter/constants/theme.dart';
import 'package:e_commerce_flutter/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_flutter/firebase_options.dart';
import 'package:e_commerce_flutter/provider/app_provider.dart';
import 'package:e_commerce_flutter/screens/custom_bottom/custom_border.dart';

import 'package:e_commerce_flutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
          title: 'E-Commerce',
          theme: themeData,
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const CustomBottom();
              }
              return const Welcome();
            },
          )),
    );
  }
}
