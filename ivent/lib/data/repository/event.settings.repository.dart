import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/event.settings.model.dart';
import 'package:ivent/data/providers/event.settings.provider.dart';

class EventSettingsRepository {
  final EventSettingsProvider apiClient;

  EventSettingsRepository(this.apiClient);

  Future<EventSettings> getSettings(int eventId) async {
    try {
      return await apiClient.getSettings(eventId);
    } catch (e) {
      throw e;
    }
  }

  // Implement other event settings-related methods here
}
