import 'package:ivent/data/models/category.model.dart';
import 'package:ivent/data/providers/category.provider.dart';

class CategoryRepository {
  final CategoryProvider apiClient;

  CategoryRepository(this.apiClient);
  Future<List<Category>> getCategories() async {
    return await apiClient.getCategories();
  }
}
