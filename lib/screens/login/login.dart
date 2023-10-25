import 'dart:ffi';

import 'package:e_commerce_flutter/constans/assets_images.dart';
import 'package:e_commerce_flutter/widgets/primary_button/primary_button.dart';
import 'package:e_commerce_flutter/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitles(
                subtitle: 'Buy AnyItems From Using App', title: 'Welcome'),
            Center(
              child: Image.asset(
                AssetsImages.instance.welcomeImage,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.facebook_outlined,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.email_outlined,
                    color: Colors.blue,
                    size: 35,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 18.0,
            ),
            PrimaryButton(
              title: "Login",
              onPressed: () {},
            ),
            SizedBox(
              height: 18.0,
            ),
            PrimaryButton(
              title: "Sign Up",
              onPressed: () {},
            )
          ],
        ),
      ),
    ));
  }
}
