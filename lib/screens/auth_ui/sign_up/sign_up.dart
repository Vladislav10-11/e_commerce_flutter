// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_flutter/constants/constants.dart';
import 'package:e_commerce_flutter/constants/routes.dart';
import 'package:e_commerce_flutter/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_flutter/screens/home/home.dart';
import 'package:e_commerce_flutter/widgets/primary_button/primary_button.dart';
import 'package:e_commerce_flutter/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
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
                  subtitle: "Welcome to E-Commerce App",
                  title: "Create Account"),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person), hintText: "Name"),
              ),
              SizedBox(
                height: 12.0,
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
                controller: phone,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone), hintText: "Phone"),
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
                height: 12.0,
              ),
              PrimaryButton(
                  onPressed: () async {
                    bool isValidated = signUpValidation(
                        email.text, password.text, name.text, phone.text);
                    if (isValidated) {
                      bool isLogined = await FirebaseAuthHelper.instance
                          .signUp(email.text, password.text, context);
                      if (isLogined) {
                        Routes.instance.pushAndRemoveUntill(
                            widget: Home(), context: context);
                      }
                    }
                  },
                  title: "SignUp"),
              SizedBox(
                height: 24.0,
              ),
              Center(child: Text("Dont Have A Account?")),
              SizedBox(
                height: 12.0,
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                    bool isValidated = signUpValidation(
                        email.text, password.text, name.text, phone.text);
                    if (isValidated) {
                      bool isLogined = await FirebaseAuthHelper.instance
                          .signUp(email.text, password.text, context);
                      if (isLogined) {
                        Routes.instance.pushAndRemoveUntill(
                            widget: Home(), context: context);
                      }
                    }
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
