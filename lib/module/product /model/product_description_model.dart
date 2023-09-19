// To parse this JSON data, do
//
// final productDescriptionModel = productDescriptionModelFromMap(jsonString);

import 'dart:convert';

ProductDescriptionModel productDescriptionModelFromMap(String str) =>
    ProductDescriptionModel.fromMap(json.decode(str));

String productDescriptionModelToMap(ProductDescriptionModel data) =>
    json.encode(data.toMap());

class ProductDescriptionModel {
  int? statusCode;
  ProductDescriptionData? data;
  String? message;
  bool? status;

  ProductDescriptionModel({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory ProductDescriptionModel.fromMap(Map<String, dynamic> json) =>
      ProductDescriptionModel(
        statusCode: json["statusCode"],
        data: ProductDescriptionData.fromMap(json["data"]),
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

class ProductDescriptionData {
  int? shippingCharges;
  String? id;
  String? name;
  String? description;
  UserId? userId;
  int? price;
  int? offerPrice;
  Brand? brand;
  Category? category;
  int? quantity;
  List<String>? images;
  int? status;
  List<Rating>? ratings;
  List<String>? countriesAvailable;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;
  double? averageRating;
  int? totalRatings;
  bool? wishlisted;

  ProductDescriptionData({
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
    this.averageRating,
    this.totalRatings,
    this.wishlisted,
  });

  factory ProductDescriptionData.fromMap(Map<String, dynamic> json) =>
      ProductDescriptionData(
        shippingCharges: json["shipping_charges"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        userId: UserId.fromMap(json["user_id"]),
        price: json["price"],
        offerPrice: json["offer_price"],
        brand: Brand.fromMap(json["brand"]),
        category: Category.fromMap(json["category"]),
        quantity: json["quantity"],
        images: List<String>.from(json["images"].map((x) => x)),
        status: json["status"],
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromMap(x))),
        countriesAvailable:
            List<String>.from(json["countries_available"].map((x) => x)),
        isActive: json["is_active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        v: json["__v"],
        averageRating: json["averageRating"].toDouble(),
        totalRatings: json["totalRatings"],
        wishlisted: json["wishlisted"],
      );

  Map<String, dynamic> toMap() => {
        "shipping_charges": shippingCharges,
        "_id": id,
        "name": name,
        "description": description,
        "user_id": userId!.toMap(),
        "price": price,
        "offer_price": offerPrice,
        "brand": brand!.toMap(),
        "category": category!.toMap(),
        "quantity": quantity,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "status": status,
        "ratings": List<dynamic>.from(ratings!.map((x) => x.toMap())),
        "countries_available":
            List<dynamic>.from(countriesAvailable!.map((x) => x)),
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "__v": v,
        "averageRating": averageRating,
        "totalRatings": totalRatings,
        "wishlisted": wishlisted,
      };
}

class Brand {
  String? id;
  String? brandName;
  String? description;

  Brand({
    this.id,
    this.brandName,
    this.description,
  });

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        id: json["_id"],
        brandName: json["brand_name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "brand_name": brandName,
        "description": description,
      };
}

class Category {
  String? id;
  String? name;
  String? description;

  Category({
    this.id,
    this.name,
    this.description,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
      };
}

class Rating {
  String? id;
  int? number;
  String? text;

  Rating({
    this.id,
    this.number,
    this.text,
  });

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        id: json["_id"],
        number: json["number"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "number": number,
        "text": text,
      };
}

class UserId {
  String? id;
  String? username;
  String? email;

  UserId({
    this.id,
    this.username,
    this.email,
  });

  factory UserId.fromMap(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "username": username,
        "email": email,
      };
}
