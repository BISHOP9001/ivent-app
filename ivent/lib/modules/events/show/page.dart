import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/global/widgets/inputs/text_feild.dart';
import 'package:ivent/global/widgets/navigation/bottom_navigation_bar.dart';
import 'package:ivent/modules/events/show/controller.dart';
import 'package:ivent/modules/participation/badge.dart';
import 'package:ivent/modules/review/page.dart';
import 'package:ivent/routes/app_navigation.dart';
import 'package:ivent/themes/app_theme.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class EventPage extends GetView<EventController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Obx(
          () => !controller.isLoading.value
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 300.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/event1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 300.h,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Positioned(
                                top: 40.h,
                                left: 20.w,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Positioned(
                                top: 40.h,
                                right: 20.w,
                                child: Icon(Icons.bookmark_border,
                                    color: Colors.white),
                              ),
                              Positioned(
                                bottom: 20.h,
                                left: 20.w,
                                right: 20.w,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.r, horizontal: 32.r),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(30.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.blackColor
                                              .withOpacity(0.3),
                                          offset: Offset(0, 2),
                                          blurRadius: 1,
                                          spreadRadius: 0.01),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_today,
                                          color: AppColors.primaryColor),
                                      Gap(10.w),
                                      Text(
                                        controller.formatDateTimeRange(
                                          controller.event.value.startDate!,
                                          controller.event.value.endDate!,
                                        ),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(20.h),
                                Text(
                                  controller.event.value.title!,
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(20.h),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: AppColors.primaryColor),
                                    Gap(10.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.event.value
                                                  .getLocationSetting() ??
                                              "",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .event.value.location!.address,
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(20.h),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage:
                                          AssetImage('assets/images/user.png'),
                                    ),
                                    Gap(10.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.event.value.user!.name!,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Organizer',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(20.h),
                                Text(
                                  'About Event',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(10.h),
                                Text(
                                  controller.event.value.description!,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                Gap(100
                                    .h), // Adjusted to give enough space for scrolling
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: controller.reviews.length,
                              itemBuilder: (context, index) {
                                final review = controller.reviews[index];
                                return ListTile(
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Rating: ${review.rating}'),
                                      Text('Comment: ${review.comment}'),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => !controller.isParticipate.value
                          ? Positioned(
                              bottom: 2.r,
                              child: Padding(
                                padding: EdgeInsets.all(22.r),
                                child: SizedBox(
                                  height: 60.r,
                                  width: 300.r,
                                  child: GMainButton(
                                    text: 'JOIN EVENT NOW',
                                    onPressed: () {
                                      // Handle join event action
                                      AppNavigation.toParticipation(
                                          id: controller.eventId);
                                    },
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.all(22.r),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 60.r,
                                    width: 300.r,
                                    child: GMainButton(
                                      text: 'Get itinerary',
                                      onPressed: () {
                                        _launchGoogleMaps(controller
                                            .event.value.location!.coordinates);
                                      },
                                    ),
                                  ),
                                  Gap(12.r),
                                  SizedBox(
                                    height: 60.r,
                                    width: 300.r,
                                    child: GMainButton(
                                      text: 'Get Badge',
                                      onPressed: () {
                                        AppNavigation.toBadge(
                                            id: controller.eventId);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
        ));
  }

  void _launchGoogleMaps(String coordinates) async {
    try {
      // Split the string by the comma
      final parts = coordinates.split(',');

      // Trim any leading/trailing spaces and parse the strings into doubles
      final lat = double.parse(parts[0].trim());
      final lng = double.parse(parts[1].trim());
      MapsLauncher.launchCoordinates(lat, lng);
    } catch (e) {}
  }
}
