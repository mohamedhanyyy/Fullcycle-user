class EventModel {
  final int id;
  final String guid;
  final String eventName;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final String startTime;
  final String endTime;
  final double latitude;
  final double longitude;

  EventModel({
    required this.id,
    required this.guid,
    required this.eventName,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.startTime,
    required this.endTime,
    required this.latitude,
    required this.longitude,
  });

  factory EventModel.fromJson(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as int,
      guid: map['guid'] as String,
      eventName: map['eventName'] as String,
      eventStartDate: DateTime.parse(map['eventStartDate']),
      eventEndDate: DateTime.parse(map['eventEndDate']),
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
    );
  }
}

