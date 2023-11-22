import 'package:e_commerce_flutter/constants/routes.dart';
import 'package:e_commerce_flutter/provider/app_provider.dart';
import 'package:e_commerce_flutter/screens/cart_screen/wigets/single_cart_items.dart';
import 'package:e_commerce_flutter/screens/home/check_out_screen/check_out_screen.dart';
import 'package:e_commerce_flutter/widgets/primary_button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        child: Container(
          height: 180,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("\$${appProvider.totalPrice().toString()}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                PrimaryButton(
                  title: "CheckOut",
                  onPressed: () {
                    // Routes.instance
                    //     .push(widget: CheckOutScreen(singleProduct: produc,), context: context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart Screen", style: TextStyle(color: Colors.black)),
      ),
      body: appProvider.getCartProductList.isEmpty
          ? Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: appProvider.getCartProductList.length,
              itemBuilder: (ctx, index) {
                return SingleCartItem(
                  singleProduct: appProvider.getCartProductList[index],
                );
              }),
    );
  }
}
