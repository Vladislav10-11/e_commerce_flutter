import 'package:e_commerce_flutter/constants/constants.dart';
import 'package:e_commerce_flutter/constants/routes.dart';
import 'package:e_commerce_flutter/models/product_model/product_model.dart';
import 'package:e_commerce_flutter/provider/app_provider.dart';
import 'package:e_commerce_flutter/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_flutter/screens/favorite_screen/favorite_screen.dart';
import 'package:e_commerce_flutter/screens/home/check_out_screen/check_out_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({
    super.key,
    required this.singleProduct,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Routes.instance.push(widget: CartScreen(), context: context);
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.singleProduct.image,
              height: 400,
              width: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.singleProduct.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.singleProduct.isFavourite =
                          !widget.singleProduct.isFavourite;
                    });
                    if (widget.singleProduct.isFavourite) {
                      appProvider.addFavoriteProduct(widget.singleProduct);
                    } else {
                      appProvider.removeFavoriteProduct(widget.singleProduct);
                    }
                  },
                  icon: Icon(appProvider.getFavoriteProductList
                          .contains(widget.singleProduct)
                      ? Icons.favorite
                      : Icons.favorite_border),
                )
              ],
            ),
            Text(widget.singleProduct.description),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    if (qty >= 1) {
                      setState(() {
                        qty--;
                      });
                    }
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    child: Icon(Icons.remove),
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  qty.toString(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 12.0,
                ),
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      qty++;
                    });
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      ProductModel productModel =
                          widget.singleProduct.copyWith(qty: qty);
                      appProvider.addCartProduct(productModel);
                      showMessage("Added to cart");
                    },
                    child: Text("Add To Card")),
                SizedBox(
                  width: 12.0,
                ),
                SizedBox(
                    height: 38,
                    width: 140,
                    child: ElevatedButton(
                        onPressed: () {
                          ProductModel productModel =
                              widget.singleProduct.copyWith(qty: qty);
                          Routes.instance.push(
                              widget: CheckOutScreen(
                                singleProduct: productModel,
                              ),
                              context: context);
                        },
                        child: Text("Buy")))
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
