import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/favourites/model/favorite_model.dart';
import 'package:ecommerce/utils/apppref.dart';

class FavoriteServices extends Endpoints {
  Future<FavoriteModel> getFavoritesApi() async {
    try {
      final response = await dio.get(
        getFavorite,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      return favoriteModelFromMap(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
