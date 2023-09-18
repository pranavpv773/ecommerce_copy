import 'dart:convert';

CategoryModel categoryModelFromMap(String str) =>
    CategoryModel.fromMap(json.decode(str));

String categoryModelToMap(CategoryModel data) => json.encode(data.toMap());

class CategoryModel {
  int? statusCode;
  CategoryData? data;
  String? message;
  bool? status;

  CategoryModel({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : CategoryData.fromMap(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "data": data?.toMap(),
        "message": message,
        "status": status,
      };
}

class CategoryData {
  List<Category>? categories;
  int? count;

  CategoryData({
    this.categories,
    this.count,
  });

  factory CategoryData.fromJson(String str) =>
      CategoryData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryData.fromMap(Map<String, dynamic> json) => CategoryData(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromMap(x))),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "count": count,
      };
}

class Category {
  String? id;
  String? name;
  String? description;
  String? available;
  String? createdBy;
  List<String>? countriesAvailable;
  bool? isActive;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;

  Category({
    this.id,
    this.name,
    this.description,
    this.available,
    this.createdBy,
    this.countriesAvailable,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        available: json["available"],
        createdBy: json["createdBy"],
        countriesAvailable: json["countries_available"] == null
            ? []
            : List<String>.from(json["countries_available"]!.map((x) => x)),
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "available": available,
        "createdBy": createdBy,
        "countries_available": countriesAvailable == null
            ? []
            : List<dynamic>.from(countriesAvailable!.map((x) => x)),
        "is_active": isActive,
        "is_deleted": isDeleted,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "__v": v,
      };
}
