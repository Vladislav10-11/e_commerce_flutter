import 'package:e_commerce_flutter/constants/constants.dart';
import 'package:e_commerce_flutter/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_flutter/widgets/primary_button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isShowPassword = true;
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            ListView(padding: EdgeInsets.symmetric(horizontal: 12), children: [
          TextFormField(
            controller: confirmpassword,
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
                  ),
                ),
                hintText: "Confirm Password"),
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: newpassword,
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
                  ),
                ),
                hintText: "New Password"),
          ),
          SizedBox(
            height: 36,
          ),
          PrimaryButton(
            title: "Update",
            onPressed: () async {
              if (newpassword.text.isEmpty) {
                showMessage("New passwordis not match");
              } else if (confirmpassword.text.isEmpty) {
                showMessage("Confirm Password is not match");
              } else if (confirmpassword.text == newpassword.text) {
                FirebaseAuthHelper.instance
                    .changePassword(newpassword.text, context);
              } else {
                showMessage("Confirm Password is not match");
              }
            },
          )
        ]),
      ),
    );
  }
}
