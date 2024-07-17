import 'package:ivent/data/models/participation.dart';
import 'package:ivent/data/providers/participation.provider.dart';

class ParticipationRepository {
  final ParticipationProvider apiClient;

  ParticipationRepository(this.apiClient);

  Future<Participation> create(Map<String, dynamic> participation) async {
    try {
      return await apiClient.create(participation);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Participation>> list() async {
    try {
      return await apiClient.list();
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> checkParticipation(int eventId) async {
    try {
      return await apiClient.checkParticipation(eventId);
    } catch (e) {
      throw e;
    }
  }
  // Implement other participation-related methods here
}
