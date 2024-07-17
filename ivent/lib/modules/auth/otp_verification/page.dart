import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/modules/auth/otp_verification/controller.dart';
import 'package:ivent/modules/auth/otp_verification/timer.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class OtpVerificationPage extends GetView<OtpVerificationController> {
  OtpVerificationPage({super.key});

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
                      controller.navigateBack();
                    },
                  ),
                  Expanded(
                      child: Container()), // to center the Verification text
                ],
              ),
              Center(
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
              Gap(40.h),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Gap(10.h),
              Text(
                "We’ve sent you the verification code on ${controller.user.phone}",
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
              Gap(30.h),
              PinCodeFields(
                controller: controller.codeCtrl,
                length: 4,
                keyboardType: TextInputType.number,
                onComplete: (value) {
                  controller.verifyCode();
                },
                focusNode: controller.focusNode,
              ),
              Gap(30.h),
              GMainButton(
                text: 'CONTINUE',
                onPressed: () {
                  controller.verifyCode();
                },
              ),
              Gap(20.h),
              Center(
                child: OtpTimer(controller.user),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
