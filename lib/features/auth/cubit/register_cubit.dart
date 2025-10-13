import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/features/auth/screens/login_screen.dart';
import 'package:fullcycle/features/candidate/data/models/candidate_model.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';
import 'package:fullcycle/services/navigation/navigation.dart';
import 'package:fullcycle/services/cache/cache_helper.dart';

class RegisterCubit extends Cubit<CubitState> {
  RegisterCubit() : super(CubitState.initial);

  Future<void> register({
    required String arabicName,
    required String englishName,
    required String idNumber,
    required int cityId,
    required String dob,
    required String gender,
    required String nationality,
    required String email,
    required String height,
    required String weight,
    required String tshirtSize,
    required String phoneNumber,
  }) async {
    emit(CubitState.loading);

    final response = await CandidateRepository.register(
      arabicName: arabicName,
      englishName: englishName,
      idNumber: idNumber,
      email: email,
      cityId: cityId,

      dob: dob,
      gender: gender,
      nationality: nationality,
      height: height,
      weight: weight,
      tshirtSize: tshirtSize,
      phoneNumber: phoneNumber,
    );

    if (response?.status == 200) {
      emit(CubitState.done);
      await CacheHelper.saveCandidate(response!.data! as CandidateData);
      AppNavigation.navigateOffAll(const LoginScreen());
    } else {
      emit(CubitState.error);
    }
  }
}
