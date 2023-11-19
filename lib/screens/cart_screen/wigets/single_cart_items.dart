import 'dart:math';

import 'package:e_commerce_flutter/constants/constants.dart';
import 'package:e_commerce_flutter/models/product_model/product_model.dart';
import 'package:e_commerce_flutter/provider/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SingleCartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCartItem({super.key, required this.singleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty = 0;
  @override
  void initState() {
    qty = widget.singleProduct.qty ?? 1;
    setState(() {});
    super.initState();
  }

  late Color _rippleColor = getRandomColor();

  Color getRandomColor() =>
      Color((Random().nextDouble() * 0xffffff).toInt()).withOpacity(1.0);
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              color: Colors.red.withOpacity(0.5),
              child: Image.network(widget.singleProduct.image),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Text(
                            widget.singleProduct.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              CupertinoButton(
                                onPressed: () {
                                  if (qty >= 1) {
                                    setState(() {
                                      qty--;
                                    });
                                    appProvider.updatedQty(
                                        widget.singleProduct, qty);
                                  }
                                },
                                padding: EdgeInsets.zero,
                                child: CircleAvatar(
                                  maxRadius: 13,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                qty.toString(),
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              InkWell(
                                splashColor: _rippleColor,
                                customBorder: CircleBorder(),
                                onTap: () {
                                  setState(() {
                                    qty++;
                                  });
                                  appProvider.updatedQty(
                                      widget.singleProduct, qty);
                                  setState(() {
                                    _rippleColor = getRandomColor();
                                  });
                                },
                                child: CircleAvatar(
                                  maxRadius: 13,
                                  child: Icon(Icons.add),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              CupertinoButton(
                                onPressed: () {
                                  if (appProvider.getFavoriteProductList
                                      .contains(widget.singleProduct)) {
                                    appProvider.addFavoriteProduct(
                                        widget.singleProduct);
                                  } else {
                                    appProvider.removeFavoriteProduct(
                                        widget.singleProduct);
                                  }
                                },
                                child: Text(
                                  appProvider.getFavoriteProductList
                                          .contains(widget.singleProduct)
                                      ? "Remove to wishList"
                                      : "Add to wishList",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                            ],
                          ),
                        ]),
                        Text(
                          "${widget.singleProduct.price}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    CupertinoButton(
                      onPressed: () {
                        AppProvider appProvider =
                            Provider.of<AppProvider>(context, listen: false);
                        appProvider.removeCartProduct(widget.singleProduct);
                        showMessage("Removed from Cart");
                      },
                      child: CircleAvatar(
                        maxRadius: 13,
                        child: Icon(
                          Icons.delete,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red, width: 3)),
    );
  }
}
