import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/category.model.dart';
import 'package:ivent/data/providers/app_get_connect.dart';

class CategoryProvider extends AppGetConnect {
  Future<List<Category>> getCategories() async {
    final response = await get('categories');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching categories',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final data = response.body as List;
      return data.map((e) => Category.fromJson(e)).toList();
    }
  }
}
