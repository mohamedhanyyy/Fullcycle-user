import 'package:intl/intl.dart';

class EventDateHelper {
  static String formatStartDate(DateTime startDate) {
    final formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(startDate);
  }

  static String timeLeftUntil(DateTime endDate) {
    final now = DateTime.now();
    if (endDate.isBefore(now)) {
      return 'انتهى الحدث';
    }

    final duration = endDate.difference(now);

    final years = duration.inDays ~/ 365;
    final months = (duration.inDays % 365) ~/ 30;
    final days = (duration.inDays % 365) % 30;

    final parts = <String>[];
    if (years > 0) parts.add('$years سنة${years > 1 ? '' : ''}');
    if (months > 0) parts.add('$months شهر${months > 1 ? '' : ''}');
    if (days > 0) parts.add('$days يوم${days > 1 ? '' : ''}');

    if (parts.isEmpty) return 'أقل من يوم متبقٍ';
    return 'متبقي ${parts.join(' و ')}';
  }
}
