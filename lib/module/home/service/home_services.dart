import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/home/model/banner_model.dart';
import 'package:ecommerce/module/home/model/get_wallet_model.dart';
import 'package:ecommerce/module/home/model/url_model.dart';
import 'package:ecommerce/module/onboarding/model/userModel.dart';
import 'package:ecommerce/utils/apppref.dart';

class HomeServices extends Endpoints {
  Future<BannerModel> getbannersList() async {
    try {
      final response = await dio.get(
        bannerlist,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      final body = bannerModelFromJson(jsonEncode(response.data));
      return body;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetUrlModel> getUrl() async {
    try {
      final response = await dio.get(
        getLiveUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      final body = getUrlModelFromMap(jsonEncode(response.data));
      return body;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetWalletModel> getWalletBalance() async {
    try {
      final response = await dio.get(
        walletUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      final body = getWalletModelFromMap(jsonEncode(response.data));
      return body;
    } catch (e) {
      rethrow;
    }
  }

  /* USER INFO API SERVICES */

  Future<UserModel> userInfoService() async {
    try {
      final response = await dio.get(
        userInfo,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppPref.userToken}',
          },
        ),
      );
      return userModelFromJson(jsonEncode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
