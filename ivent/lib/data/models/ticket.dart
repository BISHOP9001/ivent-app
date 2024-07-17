class Ticket {
  int id;
  int userId;
  int eventId;
  String uniqueCode;
  DateTime issuedDate;
  DateTime validUntil;
  String type;
  String status;

  Ticket({
    required this.id,
    required this.userId,
    required this.eventId,
    required this.uniqueCode,
    required this.issuedDate,
    required this.validUntil,
    required this.type,
    required this.status,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      userId: json['user_id'],
      eventId: json['event_id'],
      uniqueCode: json['unique_code'],
      issuedDate: DateTime.parse(json['issued_date']),
      validUntil: DateTime.parse(json['valid_until']),
      type: json['type'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'event_id': eventId,
      'unique_code': uniqueCode,
      'issued_date': issuedDate.toIso8601String(),
      'valid_until': validUntil.toIso8601String(),
      'type': type,
      'status': status,
    };
  }
}
