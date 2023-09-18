import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/bag/model/my_bag_model.dart';

class CartServices extends Endpoints {
  Future<MyBagModel> getAllBagItemsAPi() async {
    try {
      final response = await dio.get(
        myBagItems,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NGU0NGIzMWNiYzI4ZmU2MWEwZmQwNWIiLCJlbWFpbCI6IjIwMDRhYWRpdGhAZ21haWwuY29tIiwiYWNjZXNzX3Rva2VuIjoiZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnBaQ0k2SWpZMFpUTXlaV0kwWkRka05UWXdNekEyTmpjd1pXWTVaaUlzSW1WdFlXbHNJam9pTWpBd05HRmhaR2wwYUVCbmJXRnBiQzVqYjIwaUxDSnBibVp2SWpwN0luSnZiR1VpT2lJMk5HSXhZemxpTXpReU56WmhZamN6TkRCaVpXUmpPVFVpZlN3aWFXRjBJam94TmprME5qZ3pNalU1TENKbGVIQWlPakUzTWpZeU1Ua3lOVGw5LkhUN3NqTzdLMlFsZlJEZlNBV1lKNjRBRURVWkFKMUVvQ0xUYTNneXN5MGciLCJpYXQiOjE2OTQ2ODMyNTl9.D7xavGp2NaBcpepfu0O--PSkqGRgSEqIHIwvNzOU96c',
          },
        ),
      );
      return myBagModelFromMap(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
