import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/event.model.dart';
import 'package:ivent/data/providers/app_get_connect.dart';

class EventProvider extends AppGetConnect {
  Future<Event> create(Event event) async {
    final response = await post('events', event.toJson());
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error creating event',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      return Event.fromJson(response.body['data']);
    }
  }

  Future<List<Event>> list() async {
    final response = await get('events');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching events',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final d = response.body as List;
      return d.map((e) => Event.fromJson(e)).toList();
    }
  }

  Future<Event> show(int id) async {
    final response = await get('events/$id');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching events',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final d = response.body;
      return Event.fromJson(d);
    }
  }

  Future<List<Event>> eventsByCategory(int categoryId) async {
    final response = await get('events/category/$categoryId');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching events',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final d = response.body as List;
      return d.map((e) => Event.fromJson(e)).toList();
    }
  }

  Future<List<Event>> myEvents() async {
    final response = await get('user/events/participating');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching events',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final d = response.body as List;
      return d.map((e) => Event.fromJson(e)).toList();
    }
  }
}
