import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent/data/models/user.model.dart';
import 'package:ivent/data/providers/auth.provider.dart';
import 'package:ivent/data/repository/auth.repository.dart';
import 'package:ivent/global/store/auth_store.dart';
import 'package:ivent/routes/app_navigation.dart';

class RegisterController extends GetxController {
  final AuthRepository authRepository = AuthRepository(AuthProvider());
  AuthStore authStore = Get.find<AuthStore>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      // Show error message
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      final newUser = User(
          name: name,
          email: email,
          phone: phone,
          password: password,
          confirmationPassword: confirmPassword);
      final user = await authRepository.register(newUser);
      authStore.loggedIn(user);
      AppNavigation.toHome();
    } catch (e) {
      // Handle error (e.g., show a snackbar or dialog)
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      // final user = await authRepository.loginWithGoogle();
      // authStore.loggedIn(user);
      // Navigate to home or dashboard
    } catch (e) {
      // Handle error (e.g., show a snackbar or dialog)
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      // final user = await authRepository.loginWithFacebook();
      // authStore.loggedIn(user);
      // Navigate to home or dashboard
    } catch (e) {
      // Handle error (e.g., show a snackbar or dialog)
      Get.snackbar('Error', e.toString());
    }
  }

  void navigateToLogin() {
    Get.toNamed('/login');
  }
}
