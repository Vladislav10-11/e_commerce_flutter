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
  });
  String image;
  String id;
  bool isFavourite;
  String name;
  double price;
  String description;
  String status;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: "1",
        name: json["name"],
        description: json["description"],
        image: json["image"],
        isFavourite: false,
        price: double.parse(json["price"].toString()),
        status: json["status"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "isFavourite": isFavourite,
        "price": price,
        "status": status,
      };
}
