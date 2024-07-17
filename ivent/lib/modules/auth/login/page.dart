import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ivent/global/widgets/buttons/icon_button.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/global/widgets/inputs/text_feild.dart';
import 'package:ivent/modules/auth/login/controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset('assets/images/logo.svg'),
            ),
            Gap(40.h),
            Text(
              'Sign in',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Gap(20.h),
            GTextField(
              controller: controller.emailController,
              hintText: 'abc@email.com',
              prefixIcon: Icons.email,
            ),
            Gap(16.h),
            GTextField(
              controller: controller.passwordController,
              hintText: 'Your password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: controller.toggleRememberMe,
                      );
                    }),
                    Text('Remember Me'),
                  ],
                ),
                TextButton(
                  onPressed: controller.forgotPassword,
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
            Gap(20.h),
            GMainButton(
              text: 'SIGN IN',
              onPressed: controller.login,
            ),
            Gap(20.h),
            Center(child: Text('OR')),
            Gap(20.h),
            GIconButton(
              text: 'Login with Google',
              iconPath: 'assets/images/google_logo.svg',
              onPressed: controller.loginWithGoogle,
            ),
            Gap(10.h),
            GIconButton(
              text: 'Login with Facebook',
              iconPath: 'assets/images/facebook_logo.svg',
              onPressed: controller.loginWithFacebook,
            ),
            Gap(20.h),
            Center(
              child: GestureDetector(
                onTap: controller.navigateToSignUp,
                child: RichText(
                  text: TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    children: [
                      TextSpan(
                        text: 'Sign up',
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
    );
  }
}
