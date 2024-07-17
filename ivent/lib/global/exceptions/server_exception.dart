import 'package:ivent/data/models/server_response.model.dart';

class ServerException implements Exception {
  final ServerResponse response;

  ServerException({required this.response});

  @override
  String toString() {
    if (response.message is String) {
      return 'ServerException: ${response.message}';
    } else if (response.message is Map<String, dynamic>) {
      return 'ServerException: ${response.message}';
    } else {
      return 'ServerException: Unknown error';
    }
  }
}
