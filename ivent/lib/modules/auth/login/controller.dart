import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent/data/models/user.model.dart';
import 'package:ivent/data/providers/auth.provider.dart';
import 'package:ivent/data/repository/auth.repository.dart';

import 'package:ivent/global/store/auth_store.dart';
import 'package:ivent/routes/app_navigation.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository = AuthRepository(AuthProvider());
  AuthStore authStore = Get.find<AuthStore>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMe = false.obs;

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    try {
      final user = await authRepository.login(email, password);
      await authStore.loggedIn(user);
      AppNavigation.toHome();
    } catch (e) {
      // Handle error (e.g., show a snackbar or dialog)
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      // final user = await authRepository.loginWithGoogle();
      // authStore.loggedIn(user);
      // Navigate to home or dashboard
    } catch (e) {
      // Handle error (e.g., show a snackbar or dialog)
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      // final user = await authRepository.loginWithFacebook();
      // authStore.loggedIn(user);
      // Navigate to home or dashboard
    } catch (e) {
      // Handle error (e.g., show a snackbar or dialog)
    }
  }

  void forgotPassword() {
    // Implement forgot password functionality
  }

  void navigateToSignUp() {
    AppNavigation.toRegister();
  }
}
