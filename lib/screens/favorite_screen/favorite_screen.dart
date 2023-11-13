import 'package:e_commerce_flutter/provider/app_provider.dart';
import 'package:e_commerce_flutter/screens/cart_screen/wigets/single_cart_items.dart';
import 'package:e_commerce_flutter/screens/favorite_screen/wigets/single_favorite_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Favorite Screen", style: TextStyle(color: Colors.black)),
      ),
      body: appProvider.getFavoriteProductList.isEmpty
          ? Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: appProvider.getFavoriteProductList.length,
              itemBuilder: (ctx, index) {
                return SingleFavoriteItem(
                  singleProduct: appProvider.getFavoriteProductList[index],
                );
              }),
    );
  }
}
