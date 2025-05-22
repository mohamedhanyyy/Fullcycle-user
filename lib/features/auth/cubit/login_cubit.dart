import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/services/navigation/navigation.dart';
import '../../../core/cubit/base_cubit_state.dart';
import '../../../services/shared_preferences/preferences_helper.dart';
import '../../../shared/model/user_model.dart';
import '../../../shared/widgets/custom_snack_bar.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../repo/auth_repo.dart';

class LoginCubit extends Cubit<BaseCubitState> {
  LoginCubit() : super(BaseCubitState.initial);

  Future<void> login(String number, String otp) async {
    emit(BaseCubitState.loading);
    final response = await AuthRepo.login(number, otp);
    if (response.runtimeType == UserModel) {
      final user = response;
      CacheHelper.saveToken(token: user!.data!.authToken!);
      CacheHelper.saveRefreshToken(refreshToken: user.data!.refreshTokenId!);
      emit(BaseCubitState.done);
      AppNavigation.navigateOffAll(const HomeScreen());
    } else {
      emit(BaseCubitState.error);
      CustomSnackBars.showErrorToast(title: "رمز خاطئ");
    }
  }
}
