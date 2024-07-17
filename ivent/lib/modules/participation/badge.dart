import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ivent/modules/participation/controller.dart';
import 'package:ivent/routes/app_navigation.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BadgePage extends StatelessWidget {
  final ParticipationController controller =
      Get.find<ParticipationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            AppNavigation.toHome();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage:
                  NetworkImage(controller.user.value.photoUrl ?? ""),
            ),
            Gap(20.h),
            Text(
              controller.user.value.name!,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              controller.user.value.email!,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            Gap(20.h),
            Center(
              child: Column(
                children: [
                  Text(
                    controller.event.value.title!,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10.h),
                  QrImageView(
                    data: controller.participation.toJson().toString(),
                    version: QrVersions.auto,
                    size: 140.0.r,
                  ),
                  Gap(10.h),
                  Text(
                    'PARTICIPANT',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Text(
              controller.formatDateTimeRange(
                controller.event.value.startDate!,
                controller.event.value.endDate!,
              ),
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            Gap(22.r),
            Text(
              controller.event.value.eventSettings![1].settingValue!,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              controller.event.value.location!.address!,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
