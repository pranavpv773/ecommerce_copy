// To parse this JSON data, do
//
//     final myOrderModel = myOrderModelFromMap(jsonString);

import 'dart:convert';

MyOrderModel myOrderModelFromMap(String str) =>
    MyOrderModel.fromMap(json.decode(str));

class MyOrderModel {
  int? statusCode;
  List<OrderData>? data;
  String? message;
  bool? status;

  MyOrderModel({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory MyOrderModel.fromMap(Map<String, dynamic> json) => MyOrderModel(
        statusCode: json["statusCode"],
        data:
            List<OrderData>.from(json["data"].map((x) => OrderData.fromMap(x))),
        message: json["message"],
        status: json["status"],
      );
}

class OrderData {
  String? id;
  String? userId;
  ProductId? productId;
  int? count;
  AddressId? addressId;
  String? sellerId;
  int? price;
  int? productPrice;
  String? status;
  int? shippingCharge;
  String? orderDate;
  int? orderStatus;
  String? createdAt;
  String? updatedAt;
  int? v;

  OrderData({
    this.id,
    this.userId,
    this.productId,
    this.count,
    this.addressId,
    this.sellerId,
    this.price,
    this.productPrice,
    this.status,
    this.shippingCharge,
    this.orderDate,
    this.orderStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory OrderData.fromMap(Map<String, dynamic> json) => OrderData(
        id: json["_id"],
        userId: json["user_id"],
        productId: ProductId.fromMap(json["product_id"]),
        count: json["count"],
        addressId: AddressId.fromMap(json["address_id"]),
        sellerId: json["seller_id"],
        price: json["price"],
        productPrice: json["product_price"],
        status: json["status"],
        shippingCharge: json["shipping_charge"],
        orderDate: json["order_date"],
        orderStatus: json["order_status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        v: json["__v"],
      );
}

class AddressId {
  String? id;
  String? userId;
  String? buildingName;
  String? fullName;
  String? phoneNumber;
  String? landmark;
  String? cityName;
  String? districtName;
  String? pincode;
  String? country;
  bool? isDefault;
  String? createdAt;
  String? updatedAt;
  int? v;

  AddressId({
    this.id,
    this.userId,
    this.buildingName,
    this.fullName,
    this.phoneNumber,
    this.landmark,
    this.cityName,
    this.districtName,
    this.pincode,
    this.country,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AddressId.fromMap(Map<String, dynamic> json) => AddressId(
        id: json["_id"],
        userId: json["user_id"],
        buildingName: json["building_name"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        landmark: json["landmark"],
        cityName: json["city_name"],
        districtName: json["district_name"],
        pincode: json["pincode"],
        country: json["country"],
        isDefault: json["is_default"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        v: json["__v"],
      );
}

class ProductId {
  int? shippingCharges;
  String? id;
  String? name;
  String? description;
  UserId? userId;
  int? price;
  int? offerPrice;
  dynamic brand;
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

  factory ProductId.fromMap(Map<String, dynamic> json) => ProductId(
        shippingCharges: json["shipping_charges"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        userId: UserId.fromMap(json["user_id"]),
        price: json["price"],
        offerPrice: json["offer_price"],
        brand: json["brand"],
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
