import 'package:e_commerce_flutter/constans/routes.dart';
import 'package:e_commerce_flutter/screens/auth_ui/sign_up/sign_up.dart';
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
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email), hintText: "E-Mail"),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextFormField(
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
              PrimaryButton(onPressed: () {}, title: "Login"),
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
