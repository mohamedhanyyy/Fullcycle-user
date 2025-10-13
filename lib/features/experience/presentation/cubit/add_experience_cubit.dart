import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';
import 'package:fullcycle/shared/widgets/custom_snack_bar.dart';

import '../../../../services/navigation/navigation.dart';

class AddExperienceCubit extends Cubit<CubitState> {
  AddExperienceCubit() : super(CubitState.initial);

  addExpeience(String companyName,String projectName,
      String description, String position, int years) async {
    emit(CubitState.loading);
    final response = await CandidateRepository.addExperience( companyName, projectName,
         description,  position,   years);
    if (response?.statusCode == 200) {
      AppNavigation.pop();
      AppNavigation.pop();

      emit(CubitState.done);
      CustomSnackBars.showSuccessToast(title: 'تم إضافة الخبرة');
    } else {
      emit(CubitState.error);
    }
  }
}
