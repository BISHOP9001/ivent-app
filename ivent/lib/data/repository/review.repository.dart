import 'package:ivent/data/models/review.dart';
import 'package:ivent/data/providers/review.provider.dart';

class ReviewRepository {
  final ReviewProvider apiClient;

  ReviewRepository(this.apiClient);

  Future<Review> create(Review review) async {
    try {
      return await apiClient.create(review);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Review>> list(int eventId) async {
    try {
      return await apiClient.list(eventId);
    } catch (e) {
      throw e;
    }
  }

  // Implement other review-related methods here
}
