import 'package:e_commerce_flutter/constants/routes.dart';
import 'package:e_commerce_flutter/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_flutter/provider/app_provider.dart';
import 'package:e_commerce_flutter/screens/change_password/change_password.dart';
import 'package:e_commerce_flutter/screens/edit_profile/edit_profile.dart';
import 'package:e_commerce_flutter/widgets/primary_button/primary_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  appProvider.getUserInformation.image!.isEmpty
                      ? Icon(
                          Icons.person_outline,
                          size: 150,
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                              appProvider.getUserInformation.image!),
                          radius: 70,
                        ),
                  Text(
                    appProvider.getUserInformation.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    appProvider.getUserInformation.email,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  SizedBox(
                    height: 35,
                    width: 130,
                    child: PrimaryButton(
                      title: "Edit Profile",
                      onPressed: () {
                        Routes.instance
                            .push(widget: EditProfile(), context: context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.shopping_bag),
                    title: Text("Your Order"),
                  ),
                  ListTile(
                    onTap: () {
                      Routes.instance
                          .push(widget: ChangePassword(), context: context);
                    },
                    leading: Icon(Icons.change_circle_outlined),
                    title: Text("Change Password"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.favorite_outline),
                    title: Text("Favorite"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.info_outline),
                    title: Text("About Us"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.support_agent_outlined),
                    title: Text("Support"),
                  ),
                  ListTile(
                    onTap: () {
                      FirebaseAuthHelper.instance.signOut();
                      setState(() {});
                    },
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Log out"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Version 0.0.0")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
