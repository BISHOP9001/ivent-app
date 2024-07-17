import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ivent/global/store/app_store.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/global/widgets/inputs/text_feild.dart';
import 'package:ivent/modules/profile/controller.dart';
import 'package:ivent/themes/app_theme.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 100.h,
                  width: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(
                        AppStore.authStore.currentUser.value!.user!.photoUrl ??
                            "assets/images/user_placeholder.jpg",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              GTextField(
                controller: controller.nameController,
                hintText: 'Full Name',
                prefixIcon: Icons.person,
              ),
              Gap(16.h),
              GTextField(
                controller: controller.emailController,
                hintText: 'Email',
                prefixIcon: Icons.email,
              ),
              Gap(16.h),
              // GTextField(
              //   controller: controller.phoneController,
              //   hintText: 'Phone',
              //   prefixIcon: Icons.phone,
              // ),
              GTextField(
                controller: controller.passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                isPassword: true,
                onChanged: (value) {
                  controller.confirmPasswordController.clear();
                },
              ),
              Gap(16.h),
              GTextField(
                controller: controller.confirmPasswordController,
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock,
                isPassword: true,
                onChanged: (value) {},
              ),
              Gap(80.h),
              GMainButton(
                text: 'Update Profile',
                onPressed: () {
                  controller.updateProfile();
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
