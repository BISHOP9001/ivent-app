import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/global/widgets/inputs/text_feild.dart';
import 'package:ivent/modules/events/search/controller.dart';
import 'package:ivent/themes/app_theme.dart';

class EventSearchPage extends GetView<EventSearchController> {
  EventSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
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
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GTextField(
                    hintText: "Search...",
                    prefixIcon: Icons.search,
                    isPassword: false,
                    controller: controller.searchController,
                    // onChanged: (value) {
                    //   controller.searchEvents(value);
                    // },
                  ),
                ),
                Gap(10.w),
                Icon(
                  Icons.filter_alt,
                  color: AppColors.primaryColor,
                  size: 30.r,
                ),
              ],
            ),
            Gap(20.h),
            Expanded(
              child: Obx(() {
                if (controller.events.isEmpty) {
                  return Center(child: Text("No events found."));
                }
                return ListView.builder(
                  itemCount: controller.events.length,
                  itemBuilder: (context, index) {
                    final event = controller.events[index];
                    return _buildEventItem(
                        event.title!, event.startDate.toString(), "");
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventItem(String title, String date, String imagePath) {
    return Container(
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
                image: AssetImage(imagePath),
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
                  date,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
