import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import '../../candidate/data/repository/candidate_repository.dart';

class JoinEventCubit extends Cubit<CubitState> {
  JoinEventCubit() : super(CubitState.initial);

  Future<void> joinEvent(id) async {
    emit(CubitState.loading);

    try {
      final response = await CandidateRepository.joinEvent(id.toString());
      if (response != null) {
        emit(CubitState.done);
      } else {
        emit(CubitState.error);
      }
    } catch (e) {
      emit(CubitState.error);
    }
  }
}
