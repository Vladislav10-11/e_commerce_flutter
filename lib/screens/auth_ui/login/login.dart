// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_flutter/constants/constants.dart';
import 'package:e_commerce_flutter/constants/routes.dart';
import 'package:e_commerce_flutter/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_flutter/screens/auth_ui/sign_up/sign_up.dart';
import 'package:e_commerce_flutter/screens/custom_bottom/custom_border.dart';
import 'package:e_commerce_flutter/screens/home/home.dart';
import 'package:e_commerce_flutter/widgets/primary_button/primary_button.dart';
import 'package:e_commerce_flutter/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitles(
                  subtitle: "Welcome Back to E-Commerce App", title: "Login"),
              SizedBox(
                height: 24.0,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email), hintText: "E-Mail"),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_sharp),
                    suffixIcon: CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                            print(isShowPassword);
                          });
                        },
                        padding: EdgeInsets.zero,
                        child: Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )),
                    hintText: "Password"),
              ),
              SizedBox(
                height: 36.0,
              ),
              PrimaryButton(
                  onPressed: () async {
                    bool isValidated =
                        loginValidation(email.text, password.text);
                    if (isValidated) {
                      bool isLogined = await FirebaseAuthHelper.instance
                          .login(email.text, password.text, context);
                      if (isLogined) {
                        Routes.instance.pushAndRemoveUntill(
                            widget: CustomBottom(), context: context);
                      }
                    }
                  },
                  title: "Login"),
              SizedBox(
                height: 24.0,
              ),
              Center(child: Text("Dont Have A Account?")),
              SizedBox(
                height: 12.0,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: CupertinoButton(
                    onPressed: () {
                      Routes.instance
                          .push(widget: const SignUp(), context: context);
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
