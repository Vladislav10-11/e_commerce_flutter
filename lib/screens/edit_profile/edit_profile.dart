import 'dart:io';

import 'package:e_commerce_flutter/provider/app_provider.dart';
import 'package:e_commerce_flutter/widgets/primary_button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  void takePicture() async {
    XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (value != null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          CupertinoButton(
            onPressed: () {
              takePicture();
            },
            child: CircleAvatar(
                radius: 70,
                child: image == null
                    ? Icon(Icons.camera_alt)
                    : Image.file(image!)),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration:
                InputDecoration(hintText: appProvider.getUserInformation.name),
          ),
          SizedBox(
            height: 24,
          ),
          PrimaryButton(
            title: "update",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
