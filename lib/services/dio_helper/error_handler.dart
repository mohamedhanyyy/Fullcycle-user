import 'package:dio/dio.dart';

 import '../../features/candidate/data/repository/candidate_repository.dart';
import '../../shared/model/error_model.dart';
import '../../shared/widgets/custom_snack_bar.dart';



Future<void> errorHandler(Response? response) async {

   if (response?.statusCode == 400 ) {
    final errorModel = ErrorModel.fromJson(response?.data);

    CustomSnackBars.showErrorToast(
        title: errorModel.message ?? 'badRequestError');
  } else if (response?.statusCode == 500) {
    CustomSnackBars.showErrorToast(title: 'serverError');
  } else if ( response?.statusCode == 422 || response?.statusCode == 401) {

   await CandidateRepository.generateNewToken();

    // AwesomeDialog(
    //         context: AppNavigation.navigatorKey.currentContext!,
    //         title: 'انتهت صلاحية الجلسة',
    //         desc: 'برجاء تسجيل الدخول من جديد',
    //         btnOkText: 'نعم',
    //         btnCancelText: 'الغاء',
    //         dialogType: DialogType.error,
    //         btnOkColor: AppColors.primaryColor,
    //         btnOkOnPress: () {
    //           AppNavigation.navigateOffAll(LoginScreen());
    //         })
    //     .show();
  } else if (response?.statusCode == 404) {
    CustomSnackBars.showErrorToast(title: 'notFoundError');
  }
}
