import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_flutter/constants/constants.dart';
import 'package:e_commerce_flutter/models/category_model/category_model.dart';
import 'package:e_commerce_flutter/models/order_model/order_model.dart';
import 'package:e_commerce_flutter/models/product_model/product_model.dart';
import 'package:e_commerce_flutter/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseFireStoreHelper {
  static FirebaseFireStoreHelper instance = FirebaseFireStoreHelper();
  FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFireStore.collection("categories").get();

      List<CategoryModel> categoriesList = await querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();
      return categoriesList;
    } catch (e) {
      print(e.toString());
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getBestProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFireStore.collectionGroup("products").get();

      List<ProductModel> productModelList = await querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return productModelList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryViewsProducts(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFireStore
              .collection("categories")
              .doc(id)
              .collection("products")
              .get();

      List<ProductModel> productModelList = await querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return productModelList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  Future<UserModel> getUserInformation() async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firebaseFireStore
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .get();

    return querySnapshot.data() != null
        ? UserModel.fromJson(querySnapshot.data()!)
        : UserModel(id: '', name: '', email: '');
  }

  Future<bool> uploadOrderedProductFirebase(
      List<ProductModel> list, BuildContext context, String payment) async {
    try {
      showLoaderDialog(context);
      double totalPrice = 0.0;
      for (var element in list) {
        totalPrice += element.price * element.qty!;
      }
      DocumentReference documentReference = _firebaseFireStore
          .collection("Users Order")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Orders")
          .doc();
      DocumentReference admin =
          _firebaseFireStore.collection("Users Order").doc();

      admin.set({
        "product": list.map((e) => e.toJson()),
        "status": "Pending",
        "totalPrice": totalPrice,
        "payment": payment
      });

      documentReference.set({
        "product": list.map((e) => e.toJson()),
        "status": "Pending",
        "totalPrice": totalPrice,
        "payment": payment
      });
      Navigator.of(context, rootNavigator: true).pop();
      showMessage("Ordered Successfully");
      return true;
    } catch (e) {
      showMessage(e.toString());
      Navigator.of(context, rootNavigator: true).pop();
      return false;
    }
  }

  // Get Order //

  Future<List<OrderModel>> getUserOrder() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFireStore
              .collection("Users Order")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection("Orders")
              .get();

      List<OrderModel> orderList = querySnapshot.docs
          .map((element) => OrderModel.fromJson(element.data()))
          .toList();
      return orderList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }
}
