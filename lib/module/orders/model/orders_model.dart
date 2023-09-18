// To parse this JSON data, do
//
//     final myOrderModel = myOrderModelFromMap(jsonString);

import 'dart:convert';

import 'package:ecommerce/module/bag/model/my_bag_model.dart';

MyOrderModel myOrderModelFromMap(String str) =>
    MyOrderModel.fromMap(json.decode(str));

String myOrderModelToMap(MyOrderModel data) => json.encode(data.toMap());

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

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "status": status,
      };
}

class OrderData {
  String? id;
  String? userId;
  ProductId? productId;
  dynamic count;
  AddressId? addressId;
  String? sellerId;
  dynamic price;
  dynamic productPrice;
  String? status;
  dynamic shippingCharge;
  String? orderDate;
  dynamic orderStatus;
  String? createdAt;
  String? updatedAt;
  dynamic v;

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

  Map<String, dynamic> toMap() => {
        "_id": id,
        "user_id": userId,
        "product_id": productId!.toMap(),
        "count": count,
        "address_id": addressId!.toMap(),
        "seller_id": sellerId,
        "price": price,
        "product_price": productPrice,
        "status": status,
        "shipping_charge": shippingCharge,
        "order_date": orderDate,
        "order_status": orderStatus,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "__v": v,
      };
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

  Map<String, dynamic> toMap() => {
        "_id": id,
        "user_id": userId,
        "building_name": buildingName,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "landmark": landmark,
        "city_name": cityName,
        "district_name": districtName,
        "pincode": pincode,
        "country": country,
        "is_default": isDefault,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "__v": v,
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
