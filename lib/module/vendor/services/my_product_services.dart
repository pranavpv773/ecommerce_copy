import 'package:dio/dio.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/utils/apppref.dart';

class MyProductServices extends Endpoints {
  Future<dynamic> postProductsApi({required dynamic body}) async {
    try {
      final response = await dio.post(
        "$baseurl/product/add",
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
