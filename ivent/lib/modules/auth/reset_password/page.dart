import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/global/widgets/inputs/text_feild.dart';
import 'package:ivent/modules/auth/reset_password/controller.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  controller.navigateBack();
                },
              ),
              Gap(40.h),
              Center(
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Gap(20.h),
              Text(
                'Please enter your email address to request a password reset',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              Gap(20.h),
              GTextField(
                controller: controller.emailCtrl,
                hintText: 'abc@email.com',
                prefixIcon: Icons.email,
              ),
              Gap(20.h),
              Center(
                child: GMainButton(
                  text: 'SEND',
                  onPressed: () {
                    controller.resetPassword();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
