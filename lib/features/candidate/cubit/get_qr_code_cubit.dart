import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullcycle/core/cubit/base_cubit_state.dart';
import 'package:fullcycle/features/candidate/data/models/qr_code_model.dart';
import 'package:fullcycle/features/candidate/data/repository/candidate_repository.dart';
import '../../events/data/model/zone_model.dart';

class GetCandidateQRCodeCubit extends Cubit<CubitState> {
  GetCandidateQRCodeCubit() : super(CubitState.initial);

  QRCodeModel? qrCodeModel;

  bool qrLoading=false;
  List<ZoneModel> zones = [];
  List<ZoneModel> subZones = [];

  getZones(eventId) async {
    emit(CubitState.loading);

    final response = await CandidateRepository.getZonesOfEvent(eventId);
    if (response?.statusCode == 200) {
      zones =
          (response?.data as List).map((e) => ZoneModel.fromJson(e)).toList();
      emit(CubitState.done);
    } else {
      emit(CubitState.error);
    }
  }

  clearQRCode(){
    qrCodeModel=null;
    emit(CubitState.done);
  }
  getSubZones(eventId,zoneId) async {
    emit(CubitState.loading);

    final response = await CandidateRepository.getSubZonesOfEvent(eventId,zoneId);
    if (response?.statusCode == 200) {
      subZones =
          (response?.data as List).map((e) => ZoneModel.fromJson(e)).toList();
      emit(CubitState.done);
    } else {
      emit(CubitState.error);
    }
  }

  Future<void> getQRCode(eventId, zoneId, subZoneId, supervisorId) async {

    qrLoading=true;
    emit(CubitState.loading);

    final response = await CandidateRepository.getQRCode(
        eventId, zoneId, subZoneId, supervisorId);
    if (response != null) {
      qrCodeModel = QRCodeModel.fromJson(response.data);

      qrLoading=false;

      emit(CubitState.done);
    } else {
      qrLoading=false;

      emit(CubitState.error);
    }
  }
}
