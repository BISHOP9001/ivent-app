import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent/data/models/user.model.dart';
import 'package:ivent/data/providers/auth.provider.dart';
import 'package:ivent/data/repository/auth.repository.dart';

class ProfileController extends GetxController {
  final AuthRepository userRepository = AuthRepository(AuthProvider());
  var isLoading = true.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;
      User user = await userRepository.getProfile();
      nameController.text = user.name ?? '';
      emailController.text = user.email ?? '';
      phoneController.text = user.phone ?? '';
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error fetching profile: $e");
    }
  }

  Future<void> updateProfile() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    if (passwordController.text != "") {
      if (passwordController.text != confirmPasswordController.text) {
        Get.snackbar('Error', 'Passwords do not match');
        return;
      }
    }

    try {
      isLoading.value = true;
      User updatedUser = User(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password:
            passwordController.text != "" ? passwordController.text : null,
      );
      await userRepository.updateProfile(updatedUser);
      isLoading.value = false;
      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      isLoading.value = false;
      print("Error updating profile: $e");
      Get.snackbar('Error', 'Failed to update profile');
    }
  }
}
