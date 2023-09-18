import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/shop/model/category_model.dart';
import 'package:ecommerce/utils/apppref.dart';

class ShopServices extends Endpoints {
  Future<CategoryModel> getcategoryList() async {
    try {
      final response = await dio.get(
        "$mainCategory?country=IN",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      return categoryModelFromMap(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
