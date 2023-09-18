import 'dart:convert';

MyBagModel myBagModelFromMap(String str) =>
    MyBagModel.fromMap(json.decode(str));

String myBagModelToMap(MyBagModel data) => json.encode(data.toMap());

class MyBagModel {
  int? statusCode;
  CartData? data;
  String? message;
  bool? status;

  MyBagModel({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory MyBagModel.fromMap(Map<String, dynamic> json) => MyBagModel(
        statusCode: json["statusCode"],
        data: CartData.fromMap(json["data"]),
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

class CartData {
  List<CartProduct>? products;
  int? totalProductPrice;
  int? shippingCharges;
  int? totalPrice;

  CartData({
    this.products,
    this.totalProductPrice,
    this.shippingCharges,
    this.totalPrice,
  });

  factory CartData.fromJson(String str) => CartData.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

  factory CartData.fromMap(Map<String, dynamic> json) => CartData(
        products: List<CartProduct>.from(
            json["products"].map((x) => CartProduct.fromMap(x))),
        totalProductPrice: json["total_product_price"],
        shippingCharges: json["shipping_charges"],
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products!.map((x) => x.toMap())),
        "total_product_price": totalProductPrice,
        "shipping_charges": shippingCharges,
        "total_price": totalPrice,
      };
}

class CartProduct {
  int? count;
  ProductId? productId;
  String? id;
  int? totalProductPrice;

  CartProduct({
    this.count,
    this.productId,
    this.id,
    this.totalProductPrice,
  });

  factory CartProduct.fromJson(String str) =>
      CartProduct.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

  factory CartProduct.fromMap(Map<String, dynamic> json) => CartProduct(
        count: json["count"],
        productId: ProductId.fromMap(json["product_id"]),
        id: json["_id"],
        totalProductPrice: json["total_product_price"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "product_id": productId!.toMap(),
        "_id": id,
        "total_product_price": totalProductPrice,
      };
}

class ProductId {
  int? shippingCharges;
  String? id;
  String? name;
  String? description;
  UserId? userId;
  int? price;
  int? offerPrice;
  Brand? brand;
  Category? category;
  List<String>? images;
  List<String>? ratings;
  List<String>? countriesAvailable;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? status;
  int? quantity;

  ProductId({
    this.shippingCharges,
    this.id,
    this.name,
    this.description,
    this.userId,
    this.price,
    this.offerPrice,
    this.brand,
    this.category,
    this.images,
    this.ratings,
    this.countriesAvailable,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.status,
    this.quantity,
  });

  factory ProductId.fromJson(String str) => ProductId.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

  factory ProductId.fromMap(Map<String, dynamic> json) => ProductId(
        shippingCharges: json["shipping_charges"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        userId: UserId.fromMap(json["user_id"]),
        price: json["price"],
        offerPrice: json["offer_price"],
        brand: Brand.fromMap(json["brand"]),
        category: Category.fromMap(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
        ratings: List<String>.from(json["ratings"].map((x) => x)),
        countriesAvailable:
            List<String>.from(json["countries_available"].map((x) => x)),
        isActive: json["is_active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        v: json["__v"],
        status: json["status"],
        quantity: json["quantity"],
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
        "images": List<dynamic>.from(images!.map((x) => x)),
        "ratings": List<dynamic>.from(ratings!.map((x) => x)),
        "countries_available":
            List<dynamic>.from(countriesAvailable!.map((x) => x)),
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "__v": v,
        "status": status,
        "quantity": quantity,
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

  factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

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

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

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

class UserId {
  String? id;
  String? username;
  String? email;

  UserId({
    this.id,
    this.username,
    this.email,
  });

  factory UserId.fromJson(String str) => UserId.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

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
