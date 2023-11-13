import 'package:e_commerce_flutter/models/product_model/product_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  /// Cart Item ///
  final List<ProductModel> _cartProductList = [];

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
}
