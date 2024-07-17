import 'package:get/get.dart';
import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/auth.model.dart';
import 'package:ivent/data/models/user.model.dart';
import 'package:ivent/data/providers/auth.provider.dart';

class AuthRepository {
  final AuthProvider apiClient;

  AuthRepository(this.apiClient);

  Future<Auth> register(User user) async {
    try {
      return await apiClient.register(user);
    } catch (e) {
      throw e;
    }
  }

  Future<Auth> login(String email, String password) async {
    try {
      return await apiClient.login(email, password);
    } catch (e) {
      throw e;
    }
  }

  Future<User> getProfile() async {
    try {
      return await apiClient.getProfile();
    } catch (e) {
      throw e;
    }
  }

  Future<User> updateProfile(User user) async {
    try {
      return await apiClient.updateProfile(user);
    } catch (e) {
      throw e;
    }
  }

  // Implement other user-related methods here
}
