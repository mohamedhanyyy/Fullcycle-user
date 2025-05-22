import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cubit/base_cubit_state.dart';
import '../../../services/navigation/navigation.dart';
import '../../../shared/widgets/custom_snack_bar.dart';
import '../repo/auth_repo.dart';
import '../screens/verification_screen.dart';

class SendOtpCubit extends Cubit<BaseCubitState> {
  SendOtpCubit() : super(BaseCubitState.initial);

  Future<void> sendOtp(String number) async {
    emit(BaseCubitState.loading);
    final response = await AuthRepo.sendOtp(number);
    if (response?.statusCode == 200) {
      emit(BaseCubitState.done);
      AppNavigation.navigateReplacement(VerificationScreen(name: number));
    } else {
      emit(BaseCubitState.error);
      CustomSnackBars.showErrorToast(title: "رقم الهوية غير صحيح");

    }
  }
}
