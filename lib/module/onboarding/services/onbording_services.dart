import 'dart:convert';
import 'package:ecommerce/backend/api_urls.dart';
import 'package:ecommerce/module/onboarding/model/onboarding_model.dart';

class OnbaordingServices extends Endpoints {
  Future<OnBoardingModel> userOnboarding(
      {required String email, required String password}) async {
    final response = await dio.post(
      onboardUser,
      data: {"email": email, "password": password},
    );
    final body = onBoardingModelFromMap(jsonEncode(response.data));
    return body;
  }
}
