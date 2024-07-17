class Participation {
  int? id;
  int? userId;
  int? eventId;
  String? status;
  String? activities;

  Participation({
    this.id,
    this.userId,
    this.eventId,
    this.status,
    this.activities,
  });

  factory Participation.fromJson(Map<String, dynamic> json) {
    return Participation(
      id: json['id'],
      userId: json['user_id'],
      eventId: json['event_id'],
      status: json['status'],
      activities: json['activities'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'event_id': eventId,
      'status': status,
      'activities': activities,
    };
  }
}
