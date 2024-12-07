
import 'package:flutter_mvvm_riverpod_task/res/app_urls.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> signIn(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.loginApiEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUp(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.signUpApiEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
