import 'package:ivent/data/models/ticket.dart';
import 'package:ivent/data/providers/ticket.provider.dart';

class TicketRepository {
  final TicketProvider apiClient;

  TicketRepository(this.apiClient);

  Future<Ticket> create(Ticket ticket) async {
    try {
      return await apiClient.create(ticket);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Ticket>> list() async {
    try {
      return await apiClient.list();
    } catch (e) {
      throw e;
    }
  }

  Future<void> scanTicket(int ticketId) async {
    try {
      return await apiClient.scanTicket(ticketId);
    } catch (e) {
      throw e;
    }
  }

  // Implement other ticket-related methods here
}
