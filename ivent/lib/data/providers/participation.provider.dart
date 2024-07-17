import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/participation.dart';
import 'package:ivent/data/providers/app_get_connect.dart';

class ParticipationProvider extends AppGetConnect {
  Future<Participation> create(Map<String, dynamic> participation) async {
    final response = await post('participations', participation);
    if (response.status.hasError) {
      throw ApiException(
        message: response.body['message'],
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      return Participation.fromJson(response.body);
    }
  }

  Future<List<Participation>> list() async {
    final response = await get('participations');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching participations',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final d = response.body['data'] as List;
      return d.map((e) => Participation.fromJson(e)).toList();
    }
  }

  Future<dynamic> checkParticipation(int eventId) async {
    final response = await get('events/$eventId/check-participation');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching participations',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final d = response.body['isParticipant'];
      return d;
    }
  }
  // Other participation-related methods
}
