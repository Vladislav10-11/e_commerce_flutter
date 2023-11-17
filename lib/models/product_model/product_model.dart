import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.isFavourite,
    this.qty,
  });
  String image;
  String id;
  bool isFavourite;
  String name;
  double price;
  String description;
  String status;

  int? qty;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: "1",
        name: json["name"],
        qty: json["qty"],
        image: json["image"],
        isFavourite: false,
        price: double.parse(json["price"].toString()),
        status: json["status"],
        description: '',
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "isFavourite": isFavourite,
        "price": price,
        "status": status,
        "qty": qty,
      };

  ProductModel copyWith({
    int? qty,
  }) =>
      ProductModel(
        id: id,
        name: name,
        qty: qty ?? this.qty,
        image: image,
        isFavourite: isFavourite,
        price: price,
        status: status,
        description: description,
      );
}
