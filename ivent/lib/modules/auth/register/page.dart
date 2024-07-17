import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ivent/global/widgets/buttons/icon_button.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/global/widgets/inputs/text_feild.dart';
import 'package:ivent/modules/auth/register/controller.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({super.key});

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
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      controller.navigateToLogin();
                    },
                  ),
                  Expanded(child: Container()), // to center the Sign up text
                ],
              ),
              Center(
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
              Gap(40.h),
              Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Gap(20.h),
              GTextField(
                controller: controller.nameController,
                hintText: 'Full name',
                prefixIcon: Icons.person,
              ),
              Gap(16.h),
              GTextField(
                controller: controller.emailController,
                hintText: 'abc@email.com',
                prefixIcon: Icons.email,
              ),
              Gap(16.h),
              GTextField(
                controller: controller.phoneController,
                hintText: '+212 6 99 12 99 88',
                prefixIcon: Icons.phone,
              ),
              Gap(16.h),
              GTextField(
                controller: controller.passwordController,
                hintText: 'Your password',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              Gap(16.h),
              GTextField(
                controller: controller.confirmPasswordController,
                hintText: 'Confirm password',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              Gap(20.h),
              GMainButton(
                text: 'SIGN UP',
                onPressed: () {
                  controller.register();
                },
              ),
              Gap(20.h),
              Center(child: Text('OR')),
              Gap(20.h),
              GIconButton(
                text: 'Login with Google',
                iconPath: 'assets/images/google_logo.svg',
                onPressed: () {
                  controller.loginWithGoogle();
                },
              ),
              Gap(10.h),
              GIconButton(
                text: 'Login with Facebook',
                iconPath: 'assets/images/facebook_logo.svg',
                onPressed: () {
                  controller.loginWithFacebook();
                },
              ),
              Gap(20.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    controller.navigateToLogin();
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: Color(0xFF56C596),
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
