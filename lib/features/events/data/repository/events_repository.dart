import 'package:dio/dio.dart';

import '../../../../core/const/api_consts.dart';
import '../../../../services/dio_helper/dio_helper.dart';
import '../../../../services/dio_helper/error_handler.dart';

class EventsRepository {
  static Future<Response?> getActiveEvents() async {
    final response = await DioHelper.getData(url: EndPoints.getAllActiveEvents);
    if (response?.statusCode == 200) {
      return response;
    } else {
      errorHandler(response);
    }
    return null;
  }

  static Future<Response?> getZonesOfEvent(id) async {
    final response = await DioHelper.getData(
        url: EndPoints.getZonesOfEvent, query: {'zoneId': id});
    if (response?.statusCode == 200) {
      return response;
    } else {
      errorHandler(response);
    }

    return null;
  }

  static Future<Response?> getSubZonesOfEvent(eventId,zoneId) async {
    final response = await DioHelper.getData(
        url: EndPoints.getSubZonesOfEvent, query: {'eventId': eventId,
    'zoneId':zoneId});
    if (response?.statusCode == 200) {
      return response;
    } else {
      errorHandler(response);
    }
    return null;
  }
}
