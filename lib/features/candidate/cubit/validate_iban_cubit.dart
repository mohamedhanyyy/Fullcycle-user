import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';
import 'package:fullcycle/shared/widgets/custom_snack_bar.dart';

class ValidateIbanCubit extends Cubit<CubitState> {
  ValidateIbanCubit() : super(CubitState.initial);

  Future<void> validateIban(String iban, bankId) async {
    // emit(CubitState.loading);
    final result = await CandidateRepository.validateIBAN(iban, bankId);
    if (result?.statusCode == 200) {
      // emit(CubitState.done);
      CustomSnackBars.showSuccessToast(title: 'رقم ال IBAN صحيح');
    } else {
      CustomSnackBars.showErrorToast(title: 'رقم ال IBAN خطأ');

      // emit(CubitState.error);
    }
  }

  Future<void> upldateIban(
      iban, bankId, hasDelegate, delegateID, delegateName) async {
    emit(CubitState.loading);
    final result = await CandidateRepository.updateIBAN(
        iban, bankId, hasDelegate, delegateID, delegateName);
    if (result?.statusCode == 200) {
      emit(CubitState.done);
      CustomSnackBars.showSuccessToast(title: 'تم تحديث بيانات حسابك');
    } else {
      CustomSnackBars.showErrorToast(title: 'خطأ في تحديث بيانات حسابك');

      emit(CubitState.error);
    }
  }
}
