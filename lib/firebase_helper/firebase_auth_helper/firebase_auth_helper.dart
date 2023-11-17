import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_flutter/constants/constants.dart';
import 'package:e_commerce_flutter/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showMessage(e.code.toString());
      return false;
    }
  }

  Future<bool> signUp(
      String name, String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
          image: null, id: userCredential.user!.uid, name: name, email: email);
      _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showMessage(e.code.toString());
      return false;
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  Future<bool> changePassword(String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      // UserCredential userCredential = await _auth
      //     .createUserWithEmailAndPassword(email: email, password: password);
      // UserModel userModel = UserModel(
      //     image: null, id: userCredential.user!.uid, name: name, email: email);
      // _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
      Navigator.of(context).pop();
      showMessage("Password Change");
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showMessage(e.code.toString());
      return false;
    }
  }
}
