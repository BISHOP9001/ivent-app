class ServerResponse {
  final bool status;
  final dynamic message;
  final dynamic data;

  ServerResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    var status = json['status'] as bool;
    var message = json['message'];
    var data = json.containsKey('data') ? json['data'] : null;

    var serverResponse = ServerResponse(
      status: status,
      message: message,
      data: data,
    );

    return serverResponse;
  }

  bool get hasData => data != null;
}
