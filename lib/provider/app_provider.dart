// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_flutter/constants/constants.dart';
import 'package:e_commerce_flutter/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:e_commerce_flutter/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:e_commerce_flutter/models/product_model/product_model.dart';
import 'package:e_commerce_flutter/models/user_model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  /// Cart Item ///
  final List<ProductModel> _cartProductList = [];

  UserModel? _userModel;

  UserModel get getUserInformation => _userModel!;

  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;

  /// Favorite ///
  final List<ProductModel> _favoriteProductList = [];

  void addFavoriteProduct(ProductModel productModel) {
    _favoriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavoriteProduct(ProductModel productModel) {
    _favoriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavoriteProductList => _favoriteProductList;

  void getUserInfoFirebase() async {
    _userModel = await FirebaseFireStoreHelper.instance.getUserInformation();
    notifyListeners();
  }

  void updateUserInfoFirebase(
      BuildContext context, UserModel userModel, File? file) async {
    showLoaderDialog(context);
    if (file == null) {
      _userModel = userModel;
      FirebaseFirestore.instance
          .collection("users")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    } else {
      String imageUrl =
          await FirebaseStorageHelper.instance.uploadUserImage(file);
      _userModel = userModel.copyWith(image: imageUrl);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      notifyListeners();
      showMessage("Success");
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    }
  }
}
