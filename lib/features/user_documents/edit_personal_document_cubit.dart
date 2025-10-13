import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';

class PersonalDocumentsCubit extends Cubit<CubitState> {
  PersonalDocumentsCubit() : super(CubitState.initial);

  Map<String, String?> documents = {
    "cv": null,
    "criminalRecord": null,
    "delegation": null,
  };

  void uploadDocument(String key, String filePath) async {
    emit(CubitState.loading);

    try {
      final response = await CandidateRepository.uploadDocument(
        filePath: filePath,
        documentType: key,
      );

      if (response?.statusCode == 200) {
        documents[key] = response?.data?.fileUrl ?? filePath;
        emit(CubitState.done);
      } else {
        emit(CubitState.error);
      }
    } catch (e) {
      emit(CubitState.error);
    }
  }

  void removeDocument(String key) {
    documents[key] = null;
    emit(CubitState.done);
  }
}
