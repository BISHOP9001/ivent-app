import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/event.settings.model.dart';
import 'package:ivent/data/providers/app_get_connect.dart';

class EventSettingsProvider extends AppGetConnect {
  Future<EventSettings> getSettings(int eventId) async {
    final response = await get('event-settings/$eventId');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching event settings',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      return EventSettings.fromJson(response.body['data']);
    }
  }

  // Other event settings related methods
}
