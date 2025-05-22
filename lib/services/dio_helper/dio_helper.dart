import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/const/api_consts.dart';
import '../../features/auth/repo/auth_repo.dart';
import '../../features/auth/screens/login_screen.dart';
import '../navigation/navigation.dart';
import '../shared_preferences/preferences_helper.dart';

class DioHelper {
  static Future<Response?> postLoginData(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 505;
        },
      )).post(url,data: data);

      log('RESPONSE URL:${response.requestOptions.uri}');
      log('RESPONSE STATUS CODE:${response.statusCode}');
      log('RESPONSE DATA:${response.data}');
      log('RESPONSE REQUEST OPTIONS:${response.requestOptions.data}');

      if (response.statusCode == 422) {
        AuthRepo.generateNewToken();
      }
      else if (response.statusCode == 401) {
        AppNavigation.navigateOffAll(const LoginScreen());
       }
      return response;
    } catch (e) {
      log('$e');

      return e is DioException ? e.response : null;
    }
  }

  static Future<Response?> postData(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 505;
        },
      )).post(url,
          options: Options(headers: {'Authorization': 'Bearer ${CacheHelper.getToken}'}),
          data: data);

      log('RESPONSE URL:${response.requestOptions.uri}');
      log('RESPONSE STATUS CODE:${response.statusCode}');
      log('RESPONSE DATA:${response.data}');
      log('RESPONSE REQUEST OPTIONS:${response.requestOptions.data}');

      if (response.statusCode == 422) {
        // AuthRepo.generateNewToken();
      }
      else if (response.statusCode == 401) {
        // AppNavigation.navigateOffAll(const LoginScreen());
      }
      return response;
    } catch (e) {
      log('$e');

      return e is DioException ? e.response : null;
    }
  }

  static Future<Response?> getDataWithoutTokn(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      )).get(url,

          data: data);
      log('RESPONSE STATUS CODE:${response.statusCode}');
      log('RESPONSE DATA:${response.data}');
      log('RESPONSE REQUEST OPTIONS:${response.requestOptions.data}');


      return response;
    } catch (e) {
      log('$e');

      return e is DioException ? e.response : null;
    }
  }
  static Future<Response?> getData(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
      )).get(url,
          options: Options(
              headers: {'Authorization': 'Bearer ${CacheHelper.getToken}'}),
          data: data);
      log('RESPONSE STATUS CODE:${response.statusCode}');
      log('RESPONSE DATA:${response.data}');
      log('RESPONSE REQUEST OPTIONS:${response.requestOptions.data}');

      return response;
    } catch (e) {
      log('$e');

      return e is DioException ? e.response : null;
    }
  }
}
