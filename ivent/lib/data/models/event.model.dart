import 'package:ivent/data/models/event.settings.model.dart';
import 'package:ivent/data/models/location.model.dart';
import 'package:ivent/data/models/user.model.dart';

class Event {
  int? id;
  String? title;
  String? description;
  DateTime? startDate;
  DateTime? endDate;
  Location? location;
  int? organizerId;
  User? user;
  List<EventSettings>? eventSettings;

  Event(
      {this.id,
      this.title,
      this.description,
      this.startDate,
      this.endDate,
      this.location,
      this.organizerId,
      this.user,
      this.eventSettings});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      location: Location.fromJson(json['location']),
      organizerId: json['organizer_id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      eventSettings: json['event_settings'] != null
          ? List<EventSettings>.from(
              json['event_settings'].map((x) => EventSettings.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'start_date': startDate.toString(),
      'end_date': endDate.toString(),
      'location': location!.toJson(),
      'organizer_id': organizerId,
      'user': user!.toJson(),
    };
  }

  String? getLocationSetting() {
    EventSettings? setting = eventSettings!.firstWhere(
      (s) => s.settingName == 'location',
      orElse: () =>
          EventSettings(id: 0, eventId: 0, settingName: '', settingValue: ''),
    );
    return setting.settingName == '' ? null : setting.settingValue;
  }
}
