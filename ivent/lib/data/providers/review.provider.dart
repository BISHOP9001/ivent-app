import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/review.dart';
import 'package:ivent/data/providers/app_get_connect.dart';

class ReviewProvider extends AppGetConnect {
  Future<Review> create(Review review) async {
    final response = await post('reviews', review.toJson());
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error creating review',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      return Review.fromJson(response.body['data']);
    }
  }

  Future<List<Review>> list(int eventId) async {
    final response = await get('reviews/$eventId');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching reviews',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final d = response.body['data'] as List;
      return d.map((e) => Review.fromJson(e)).toList();
    }
  }

  // Other review-related methods
}
