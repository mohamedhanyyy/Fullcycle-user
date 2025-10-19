import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';
import 'package:fullcycle/features/events/data/model/event_model.dart';

class GetActiveEventsCubit extends Cubit<CubitState> {
  GetActiveEventsCubit() : super(CubitState.initial);

  List<EventModel> events = [];
  Future<void> getActiveEvents() async {
    if (events.isNotEmpty) {
      return;
    }
    emit(CubitState.loading);

    try {
      final response = await CandidateRepository.getActiveEvents();
      if (response != null) {
        events =
            (response.data['data'] as List).map((e) => EventModel.fromJson(e)).toList();
        emit(CubitState.done);
      } else {

        emit(CubitState.error);
      }
    } catch (e) {
      emit(CubitState.error);
    }
  }
}
