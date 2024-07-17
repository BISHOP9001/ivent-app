class RequestException implements Exception {
  final Map<String, dynamic> message;

  RequestException(this.message);

  String get error => message["message"] ?? "";
}
