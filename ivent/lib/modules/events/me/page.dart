import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ivent/data/models/event.model.dart';
import 'package:ivent/modules/events/filter/controller.dart';
import 'package:ivent/modules/events/filter/page.dart';
import 'package:ivent/modules/events/me/controller.dart';
import 'package:ivent/routes/app_navigation.dart';
import 'package:ivent/themes/app_theme.dart';

class MyEventsPage extends GetView<MyEventsController> {
  MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My Events',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_alt, color: Colors.black),
            onPressed: () {
              Get.put<FilterController>(FilterController());
              Get.bottomSheet(FractionallySizedBox(
                heightFactor: 1.5,
                child: FilterPage(),
              ));
            },
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(
            () => !controller.isloading.value
                ? ListView.builder(
                    itemCount: controller.events.length,
                    itemBuilder: (context, index) =>
                        _buildEventItem(controller.events[index]),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          )),
    );
  }

  Widget _buildEventItem(Event event) {
    return GestureDetector(
      onTap: () {
        AppNavigation.toShowEvent(id: event.id!);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10.r,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70.w,
              height: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: AssetImage('assets/images/event1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.formatDateTimeRange(
                        event.startDate!, event.endDate!),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    event.title!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    event.getLocationSetting() ?? "",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
