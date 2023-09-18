import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/orders/model/orders_model.dart';
import 'package:ecommerce/utils/apppref.dart';

class OrderServices extends Endpoints {
  Future<MyOrderModel> getAllOrdersAPi() async {
    try {
      final response = await dio.get(
        'http://54.238.10.51:3000/api/order',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      return myOrderModelFromMap(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
