import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import '../data/model/sub_zone_model.dart';
import '../data/repository/events_repository.dart';

class GetEventSubZonesCubit extends Cubit<CubitState> {
  GetEventSubZonesCubit() : super(CubitState.initial);

  List<SubZoneModel> subZones = [];
  Future<void> getEventSubZones(eventId, zoneId) async {
    if (subZones.isNotEmpty) {
      return;
    }
    emit(CubitState.loading);

    try {
      final response =
          await EventsRepository.getSubZonesOfEvent(eventId, zoneId);
      if (response != null) {
        subZones =
            (response.data as List).map((e) => SubZoneModel.fromJson(e)).toList();
        emit(CubitState.done);
      } else {
        emit(CubitState.error);
      }
    } catch (e) {
      emit(CubitState.error);
    }
  }
}
