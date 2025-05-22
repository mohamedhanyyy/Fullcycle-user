import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../core/const/api_consts.dart';
import '../../../services/dio_helper/dio_helper.dart';
import '../../../services/dio_helper/error_handler.dart';
import '../../../services/shared_preferences/preferences_helper.dart';
import '../../../shared/model/user_model.dart';
import '../../../shared/widgets/custom_snack_bar.dart';

class AuthRepo {
  static Future<Response?> sendOtp(String number) async {
    final response = await DioHelper.postLoginData(url: EndPoints.sendOTP, data: {
      'nationalId': number,
      'userCategory': 0,
    });
    if (response?.statusCode == 200) {
      CustomSnackBars.showSuccessToast(title: 'تم إرسال رمز التحقق بنجاح');
      return response;
    } else {
      errorHandler(response);
    }
    return null;
  }

 static Future<UserModel?> login(String nationalId, String otp) async {
    final response = await DioHelper.postLoginData(url: EndPoints.login, data: {
      'nationalId': nationalId,
      'otp': otp,
      "firebase_token":await FirebaseMessaging.instance.getToken(),
      "device_name": Platform.isIOS?'ios':'android',
    });
    if (response?.statusCode == 200) {
      CustomSnackBars.showSuccessToast(title: 'تم تسجيل الدخول بنجاح');

      final user = UserModel.fromJson(response?.data);
      return user;
    }
    return null;
  }

  static generateNewToken() async {
    final response =
        await DioHelper.postData(url: EndPoints.refreshToken, data: {
      'ExpiredToken': CacheHelper.getToken,
      'refreshTokenId': CacheHelper.getRefreshToken,
    });

    if (response?.statusCode == 200) {

      final user=UserModel.fromJson(response?.data);
      CacheHelper.saveToken(token: user.data!.authToken!);
      CacheHelper.saveRefreshToken(refreshToken: user.data!.refreshTokenId!);

    } else {
      errorHandler(response);
    }
  }
}
