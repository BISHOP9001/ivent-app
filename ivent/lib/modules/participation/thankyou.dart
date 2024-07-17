import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/modules/participation/controller.dart';

class ThankYouPage extends StatelessWidget {
  final ParticipationController controller =
      Get.find<ParticipationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100.r),
            Gap(40.h),
            Text(
              'Registration Completed',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Gap(20.h),
            Text(
              'Your registration to RSA conferences is completed successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            Gap(40.h),
            GMainButton(
              text: 'GET YOUR BADGE',
              onPressed: () {
                controller.generateBadge();
              },
            ),
          ],
        ),
      ),
    );
  }
}
