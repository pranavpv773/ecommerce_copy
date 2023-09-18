// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromMap(jsonString);

import 'dart:convert';

FavoriteModel favoriteModelFromMap(String str) =>
    FavoriteModel.fromMap(json.decode(str));

String favoriteModelToMap(FavoriteModel data) => json.encode(data.toMap());

class FavoriteModel {
  int? statusCode;
  FavoriteData? data;
  String? message;
  bool? status;

  FavoriteModel({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory FavoriteModel.fromMap(Map<String, dynamic> json) => FavoriteModel(
        statusCode: json["statusCode"],
        data: FavoriteData.fromMap(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "data": data!.toMap(),
        "message": message,
        "status": status,
      };
}

class FavoriteData {
  String? id;
  String? userId;
  List<Product>? products;
  String? createdAt;
  String? updatedAt;
  int? v;

  FavoriteData({
    this.id,
    this.userId,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory FavoriteData.fromMap(Map<String, dynamic> json) => FavoriteData(
        id: json["_id"],
        userId: json["user_id"],
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "user_id": userId,
        "products": List<dynamic>.from(products!.map((x) => x.toMap())),
        "created_at": createdAt,
        "updated_at": updatedAt,
        "__v": v,
      };
}

class Product {
  int? shippingCharges;
  String? id;
  String? name;
  String? description;
  String? userId;
  int? price;
  int? offerPrice;
  String? brand;
  String? category;
  int? quantity;
  List<String>? images;
  int? status;
  List<String>? ratings;
  List<String>? countriesAvailable;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  Product({
    this.shippingCharges,
    this.id,
    this.name,
    this.description,
    this.userId,
    this.price,
    this.offerPrice,
    this.brand,
    this.category,
    this.quantity,
    this.images,
    this.status,
    this.ratings,
    this.countriesAvailable,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        shippingCharges: json["shipping_charges"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        userId: json["user_id"],
        price: json["price"],
        offerPrice: json["offer_price"],
        brand: json["brand"],
        category: json["category"],
        quantity: json["quantity"],
        images: List<String>.from(json["images"].map((x) => x)),
        status: json["status"],
        ratings: List<String>.from(json["ratings"].map((x) => x)),
        countriesAvailable:
            List<String>.from(json["countries_available"].map((x) => x)),
        isActive: json["is_active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "shipping_charges": shippingCharges,
        "_id": id,
        "name": name,
        "description": description,
        "user_id": userId,
        "price": price,
        "offer_price": offerPrice,
        "brand": brand,
        "category": category,
        "quantity": quantity,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "status": status,
        "ratings": List<dynamic>.from(ratings!.map((x) => x)),
        "countries_available":
            List<dynamic>.from(countriesAvailable!.map((x) => x)),
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "__v": v,
      };
}
