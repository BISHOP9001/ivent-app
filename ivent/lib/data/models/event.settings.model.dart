class EventSettings {
  int? id;
  int? eventId;
  String? settingName;
  String? settingValue;

  EventSettings({
    this.id,
    this.eventId,
    this.settingName,
    this.settingValue,
  });

  factory EventSettings.fromJson(Map<String, dynamic> json) {
    return EventSettings(
      id: json['id'],
      eventId: json['event_id'],
      settingName: json['setting_name'],
      settingValue: json['setting_value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_id': eventId,
      'setting_name': settingName,
      'setting_value': settingValue,
    };
  }
}
