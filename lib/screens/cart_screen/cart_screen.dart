import 'package:e_commerce_flutter/screens/cart_screen/wigets/single_cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart Screen", style: TextStyle(color: Colors.black)),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: 4,
          itemBuilder: (ctx, index) {
            return SingleCartItem();
          }),
    );
  }
}
