import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';

import '../../core/resources/colors.dart';
import '../../shared/model/error_model.dart';
import '../../shared/widgets/custom_snack_bar.dart';
import '../navigation/navigation.dart';
import '../shared_preferences/preferences_helper.dart';

void errorHandler(Response? response) {
  if (response?.statusCode == 400 || response?.statusCode == 401) {
    final errorModel = ErrorModel.fromJson(response?.data);

    CustomSnackBars.showErrorToast(
        title: errorModel.message ?? 'badRequestError');
  } else if (response?.statusCode == 500) {
    CustomSnackBars.showErrorToast(title: 'serverError');
  } else if (response?.statusCode == 401) {
    CacheHelper.preferences.remove('token');
    CacheHelper.preferences.remove('keepMeLogged');
    AwesomeDialog(
            context: AppNavigation.navigatorKey.currentContext!,
            title: 'unAuthorizedError',
            desc: 'un authorized description',
            btnOkText: 'ok',
            btnCancelText: 'cancel',
            dialogType: DialogType.error,
            btnOkColor: AppColors.primaryColor,
            btnOkOnPress: () {
              // AppNavigation.navigateOffAll(LoginScreen());
            })
        .show();
  } else if (response?.statusCode == 404) {
    CustomSnackBars.showErrorToast(title: 'notFoundError');
  }
}
