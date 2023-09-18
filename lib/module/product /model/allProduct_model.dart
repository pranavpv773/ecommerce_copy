// ignore_for_file: file_names

import 'dart:convert';

AllProductsModel allProductsModelFromMap(String str) =>
    AllProductsModel.fromMap(json.decode(str));

String allProductsModelToMap(AllProductsModel data) =>
    json.encode(data.toMap());

class AllProductsModel {
  int statusCode;
  AllProductsData data;
  String message;
  bool status;

  AllProductsModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.status,
  });

  factory AllProductsModel.fromJson(String str) =>
      AllProductsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllProductsModel.fromMap(Map<String, dynamic> json) =>
      AllProductsModel(
        statusCode: json["statusCode"],
        data: AllProductsData.fromMap(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "data": data.toMap(),
        "message": message,
        "status": status,
      };
}

class AllProductsData {
  List<Product> products;
  String currentPage;
  String pageSize;
  int totalCount;
  int pagesLeft;

  AllProductsData({
    required this.products,
    required this.currentPage,
    required this.pageSize,
    required this.totalCount,
    required this.pagesLeft,
  });

  factory AllProductsData.fromJson(String str) =>
      AllProductsData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllProductsData.fromMap(Map<String, dynamic> json) => AllProductsData(
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
        totalCount: json["total_count"],
        pagesLeft: json["pagesLeft"],
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "currentPage": currentPage,
        "pageSize": pageSize,
        "total_count": totalCount,
        "pagesLeft": pagesLeft,
      };
}

class Product {
  String id;
  String name;
  String description;
  UserId userId;
  int price;
  int offerPrice;
  Brand? brand;
  Category category;
  int quantity;
  List<String> images;
  int shippingCharges;
  int status;
  List<Rating> ratings;
  List<String> countriesAvailable;
  bool isActive;
  String createdAt;
  String updatedAt;
  int v;
  int totalRatings;
  double averageRating;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.userId,
    required this.price,
    required this.offerPrice,
    required this.brand,
    required this.category,
    required this.quantity,
    required this.images,
    required this.shippingCharges,
    required this.status,
    required this.ratings,
    required this.countriesAvailable,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalRatings,
    required this.averageRating,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        userId: UserId.fromMap(json["user_id"]),
        price: json["price"],
        offerPrice: json["offer_price"],
        brand: json["brand"] == null ? null : Brand.fromMap(json["brand"]),
        category: Category.fromMap(json["category"]),
        quantity: json["quantity"],
        images: List<String>.from(json["images"].map((x) => x)),
        shippingCharges: json["shipping_charges"],
        status: json["status"],
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromMap(x))),
        countriesAvailable:
            List<String>.from(json["countries_available"].map((x) => x)),
        isActive: json["is_active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        v: json["__v"],
        totalRatings: json["total_ratings"],
        averageRating: json["average_rating"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "user_id": userId.toMap(),
        "price": price,
        "offer_price": offerPrice,
        "brand": brand?.toMap(),
        "category": category.toMap(),
        "quantity": quantity,
        "images": List<dynamic>.from(images.map((x) => x)),
        "shipping_charges": shippingCharges,
        "status": status,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toMap())),
        "countries_available":
            List<dynamic>.from(countriesAvailable.map((x) => x)),
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "__v": v,
        "total_ratings": totalRatings,
        "average_rating": averageRating,
      };
}

class Brand {
  String id;
  String brandName;
  String description;

  Brand({
    required this.id,
    required this.brandName,
    required this.description,
  });

  factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

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
  String id;
  String name;
  String description;

  Category({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

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
  String id;
  int number;
  String text;

  Rating({
    required this.id,
    required this.number,
    required this.text,
  });

  factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

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
  String id;
  String username;
  String email;

  UserId({
    required this.id,
    required this.username,
    required this.email,
  });

  factory UserId.fromJson(String str) => UserId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

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
