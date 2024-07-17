import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/auth.model.dart';
import 'package:ivent/data/models/user.model.dart';
import 'package:ivent/data/providers/app_get_connect.dart';

class AuthProvider extends AppGetConnect {
  Future<dynamic> register(User user) async {
    final response = await post('users/register', user.toJson());
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error registering user',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      return Auth.fromJson(response.body);
    }
  }

  Future<dynamic> login(String email, String password) async {
    var credentials = {"email": email, "password": password};
    final response = await post('users/login', credentials);
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error logging in user',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      return Auth.fromJson(response.body);
    }
  }

  Future<dynamic> getProfile() async {
    final response = await get('profile');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error registering user',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      return User.fromJson(response.body);
    }
  }

  Future<dynamic> updateProfile(User user) async {
    final response = await post('profile', user.toJson());
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error registering user',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      return User.fromJson(response.body);
    }
  }

  // Other user-related methods like logout, resetPassword, updatePassword, uploadPhoto, etc.
}
