import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/ticket.dart';
import 'package:ivent/data/providers/app_get_connect.dart';

class TicketProvider extends AppGetConnect {
  Future<Ticket> create(Ticket ticket) async {
    final response = await post('tickets', ticket.toJson());
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error creating ticket',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      return Ticket.fromJson(response.body['data']);
    }
  }

  Future<List<Ticket>> list() async {
    final response = await get('tickets');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching tickets',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final d = response.body['data'] as List;
      return d.map((e) => Ticket.fromJson(e)).toList();
    }
  }

  Future<void> scanTicket(int ticketId) async {
    final response = await post('tickets/$ticketId/scan', {});
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error scanning ticket',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    }
  }
}
