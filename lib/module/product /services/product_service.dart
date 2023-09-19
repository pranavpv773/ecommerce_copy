import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/product%20/model/allProduct_model.dart';
import 'package:ecommerce/module/product%20/model/product_description_model.dart';
import 'package:ecommerce/utils/apppref.dart';

class ProductServices extends Endpoints {
  Future<AllProductsModel> getAllProductsApi(
      {String? sort, required String categoryId}) async {
    try {
      final response = await dio.get(
        "$baseurl/product?limit=1000&page=1&minPrize=10&maxPrize=5000&country=IN&category=$categoryId",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      return allProductsModelFromMap(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductDescriptionModel> getDescriptionApi(
      {required String productId}) async {
    print("$baseurl/product/single/$productId");
    try {
      final response = await dio.get(
        "$baseurl/product/single/$productId",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      return productDescriptionModelFromMap(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
