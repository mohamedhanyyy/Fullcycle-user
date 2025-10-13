import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/features/candidate/data/models/candidate_doc_model.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';

class GetCandidateDocsCubit extends Cubit<CubitState> {
  GetCandidateDocsCubit() : super(CubitState.initial);

  CandidateDocModel? candidateDocModel;
  Future<void> getCandidateDocs(id) async {
    emit(CubitState.loading);

    try {
      final response = await CandidateRepository.getCandidateDoc(id);
      if (response != null) {
        candidateDocModel = CandidateDocModel.fromJson(response.data);
        emit(CubitState.done);
      } else {
        emit(CubitState.error);
      }
    } catch (e) {
      emit(CubitState.error);
    }
  }
}
