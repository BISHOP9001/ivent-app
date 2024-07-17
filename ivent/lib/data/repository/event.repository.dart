import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/event.model.dart';
import 'package:ivent/data/providers/event.provider.dart';

class EventRepository {
  final EventProvider apiClient;

  EventRepository(this.apiClient);

  Future<Event> create(Event event) async {
    try {
      return await apiClient.create(event);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Event>> list() async {
    try {
      return await apiClient.list();
    } catch (e) {
      throw e;
    }
  }

  Future<Event> show(int id) async {
    try {
      return await apiClient.show(id);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Event>> eventsByCategory(int categoryId) async {
    try {
      return await apiClient.eventsByCategory(categoryId);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Event>> myEvents() async {
    try {
      return await apiClient.myEvents();
    } catch (e) {
      throw e;
    }
  }

  // Implement other event-related methods here
}
