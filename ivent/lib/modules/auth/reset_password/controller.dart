import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent/data/providers/auth.provider.dart';
import 'package:ivent/data/repository/auth.repository.dart';
import 'package:ivent/global/store/auth_store.dart';

class ResetPasswordController extends GetxController {
  final AuthRepository userRepository = AuthRepository(AuthProvider());
  AuthStore authStore = Get.find<AuthStore>();

  final TextEditingController emailCtrl = TextEditingController();

  void resetPassword() async {
    final email = emailCtrl.text.trim();

    if (email.isEmpty || !GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email address');
      return;
    }

    try {
      // await userRepository.resetPassword(email);
      Get.snackbar('Success', 'Password reset email sent');
      // Optionally, navigate to the login page or any other page
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void navigateBack() {
    Get.back();
  }
}
