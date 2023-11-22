import 'package:e_commerce_flutter/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:e_commerce_flutter/models/order_model/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Your Order",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFireStoreHelper.instance.getUserOrder(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            ;
            if (snapshot.data == null || !snapshot.hasData) {
              return Center(
                child: Text("No Order Found"),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  OrderModel orderModel = snapshot.data![index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      collapsedShape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red, width: 2.3)),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red, width: 2.3)),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            color: Colors.red.withOpacity(0.5),
                            child: Image.network(
                              orderModel.product[0].image,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 140,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(children: [
                                  Text(
                                    orderModel.product[0].name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "Total Price:\$${orderModel.totalPrice.toString()}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "Order Status:${orderModel.status}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            orderModel.status,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
