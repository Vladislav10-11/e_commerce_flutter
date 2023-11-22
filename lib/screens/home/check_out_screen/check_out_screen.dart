import 'package:e_commerce_flutter/constants/routes.dart';
import 'package:e_commerce_flutter/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:e_commerce_flutter/models/product_model/product_model.dart';
import 'package:e_commerce_flutter/provider/app_provider.dart';
import 'package:e_commerce_flutter/screens/custom_bottom/custom_border.dart';
import 'package:e_commerce_flutter/screens/home/home.dart';
import 'package:e_commerce_flutter/widgets/primary_button/primary_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget {
  final ProductModel singleProduct;
  const CheckOutScreen({super.key, required this.singleProduct});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int groupValue = 2;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
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
                    Text("\$150",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Check Out",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 36,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 3.0),
              ),
              width: double.infinity,
              child: Row(children: [
                Radio(
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                Icon(Icons.money),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Cash on Delivery",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ]),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 3.0),
              ),
              width: double.infinity,
              child: Row(children: [
                Radio(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                Icon(Icons.phone_android),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Pay Online",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            SizedBox(
              height: 24.0,
            ),
            PrimaryButton(
              title: "Continues",
              onPressed: () async {
                appProvider.getBuyProductsList.clear();
                appProvider.addBuyProduct(widget.singleProduct);

                bool value = await FirebaseFireStoreHelper.instance
                    .uploadOrderedProductFirebase(
                        appProvider.getBuyProductsList,
                        context,
                        groupValue == 1 ? "Cash on delivery" : "Paid");
                if (value) {
                  Future.delayed(Duration(seconds: 2), () {
                    Routes.instance.push(
                      widget: Home(),
                      context: context,
                    );
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
