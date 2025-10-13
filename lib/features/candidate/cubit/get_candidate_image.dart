import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';

import '../data/models/user_image_model.dart';

class GetCandidateImageCubit extends Cubit<CubitState> {
  GetCandidateImageCubit() : super(CubitState.initial);

  UserImageModel? imageModel;
  Future<void> getCandidateImage() async {
    emit(CubitState.loading);

    try {
      final response = await CandidateRepository.getCandidateImage();
      if (response != null) {
        imageModel = UserImageModel.fromJson(response.data);
        emit(CubitState.done);
      } else {
        emit(CubitState.error);
      }
    } catch (e) {
      emit(CubitState.error);
    }
  }
}
