import 'package:e_commerce_flutter/models/product_model/product_model.dart';

class OrderModel {
  OrderModel(
      {required this.totalPrice,
      required this.orderId,
      required this.payment,
      required this.product,
      required this.status,
      required this.image});
  String payment;
  String status;
  List<ProductModel> product;
  double totalPrice;
  String orderId;
  String image;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> productMap = json["product"];
    return OrderModel(
      orderId: json["orderId"] ?? "",
      product: productMap.map((e) => ProductModel.fromJson(e)).toList(),
      totalPrice: json["totalPrice"] ?? "",
      status: json["status"] ?? "",
      payment: "payment",
      image: "image",
    );
  }
}
