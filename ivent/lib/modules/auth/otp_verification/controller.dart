import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent/data/models/user.model.dart';
import 'package:ivent/data/providers/auth.provider.dart';
import 'package:ivent/data/repository/auth.repository.dart';
import 'package:ivent/global/store/auth_store.dart';

class OtpVerificationController extends GetxController {
  final AuthRepository authRepository = AuthRepository(AuthProvider());
  AuthStore authStore = Get.find<AuthStore>();
  User user = User();

  final TextEditingController codeCtrl = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void verifyCode() async {
    final code = codeCtrl.text.trim();

    if (code.isEmpty || code.length != 4) {
      Get.snackbar('Error', 'Please enter a valid code');
      return;
    }

    try {
      // final auth = await authRepository.verifyOtpCode(user, code);
      // authStore.loggedIn(auth);
      Get.toNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void resendCode() async {
    try {
      // await authRepository.resendOtpCode(user);
      Get.snackbar('Success', 'Verification code sent');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void navigateBack() {
    Get.back();
  }
}
