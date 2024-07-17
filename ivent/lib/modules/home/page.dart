import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ivent/data/models/category.model.dart';
import 'package:ivent/data/models/event.model.dart';
import 'package:ivent/global/widgets/buttons/icon_button.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/global/widgets/components/count_down.dart';
import 'package:ivent/global/widgets/components/custom_drawer.dart';
import 'package:ivent/global/widgets/inputs/text_feild.dart';
import 'package:ivent/global/widgets/navigation/bottom_navigation_bar.dart';
import 'package:ivent/modules/home/controller.dart';
import 'package:ivent/routes/app_navigation.dart';
import 'package:ivent/themes/app_theme.dart';
import 'package:lottie/lottie.dart';

class HomePage extends GetView<HomeController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: GBottomNavigationBar(currentIndex: 0, onTap: () {}),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 240.h,
              floating: true,
              pinned: true,
              backgroundColor: AppColors.whiteColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      height: 250.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.r, vertical: 50.r),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(33.r),
                          bottomRight: Radius.circular(33.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(53.r),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Current Location',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.whiteColor,
                                      )),
                                  Row(
                                    children: [
                                      Obx(() => Text(
                                          controller.currentLocation.value,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.bold))),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.whiteColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.notifications_none,
                                  color: AppColors.whiteColor,
                                ),
                                onPressed: () {
                                  controller.handleNotifications();
                                },
                              ),
                            ],
                          ),
                          Gap(40.h),
                          Row(
                            children: [
                              Expanded(
                                child: GTextField(
                                  hintText: "code",
                                  prefixIcon: Icons.search,
                                  isPassword: false,
                                  controller: TextEditingController(),
                                ),
                              ),
                              Gap(10.w),
                              SizedBox(
                                width: 102.r,
                                height: 60,
                                child: GSecondaryButton(
                                  color: AppColors.wetAsphalt,
                                  text: "Join event",
                                  onPressed: () {
                                    controller.filterEvents();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 210.r,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.r, horizontal: 12.r),
                          child: Obx(
                            () => !controller.loadingCategories.value
                                ? Container(
                                    height: 42.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      itemCount: controller.categories.length,
                                      itemBuilder: (context, index) =>
                                          _buildCategoryChip(
                                              controller.categories[index]),
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.r, horizontal: 12.r),
            child: Obx(
              () => controller.selectedCategory == -1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => !controller.loadingCurrentEvent.value
                              ? controller.currentEvent.id == null
                                  ? SizedBox()
                                  : _currentEventCard()
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                        Gap(20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text('Upcoming Events',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Gap(10.h),
                        Obx(
                          () => !controller.loadingEvents.value
                              ? SizedBox(
                                  height: 200.h,
                                  child: ListView.builder(
                                    itemCount: controller.events.length,
                                    itemBuilder: (context, index) =>
                                        _buildEventCard(
                                            controller.events[index]),
                                    scrollDirection: Axis.horizontal,
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                        Gap(20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text('Nearby You',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Gap(10.h),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: controller
                              .events.length, // Replace with actual item count
                          itemBuilder: (context, index) {
                            return _buildEventCard(controller.events[index]);
                          },
                        ),
                        Gap(10.h),
                        Gap(20.h),
                      ],
                    )
                  : controller.filtredEvents.isNotEmpty
                      ? Column(
                          children: [
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 10.h,
                                childAspectRatio: 0.75,
                              ),
                              itemCount: controller.filtredEvents
                                  .length, // Replace with actual item count
                              itemBuilder: (context, index) {
                                return _buildEventCard(
                                    controller.filtredEvents[index]);
                              },
                            ),
                          ],
                        )
                      : Center(
                          child: Text('No Event found for this category'),
                        ),
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }

  Widget _currentEventCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Color(0xFFE3F4F1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.currentEvent.title!,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              Lottie.asset("assets/animations/popcircle.json", width: 32.r)
            ],
          ),
          CountdownTimer(eventStartTime: controller.currentEvent.startDate!),
          Gap(10.h),
          GSecondaryButton(
            width: 102.w,
            height: 32.h,
            text: 'SEE MORE',
            onPressed: () {
              AppNavigation.toShowEvent(id: controller.currentEvent.id!);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(Category category, {bool isSelected = false}) {
    return Obx(
      () => InkWell(
        onTap: () {
          if (controller.selectedCategory.value != category.id) {
            controller.selectedCategory.value = category.id;
            controller.fetchEventsByCategory(controller.selectedCategory.value);
          } else {
            controller.selectedCategory.value = -1;
          }
        },
        child: Container(
          margin: EdgeInsets.only(right: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: !(controller.selectedCategory.value == category.id)
                ? controller.getRandomColor()
                : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(33.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10.r,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(category.name,
                style:
                    TextStyle(color: isSelected ? Colors.white : Colors.black)),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return InkWell(
      onTap: () {
        AppNavigation.toShowEvent(id: event.id!);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 180.w,
          height: 200.h,
          margin: EdgeInsets.only(right: 10.w),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: Image.asset('assets/images/event1.png',
                    fit: BoxFit.cover, height: 80.h, width: 180.w),
              ),
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        controller.dateFormatter(
                            event.startDate.toString()), // Use event date here
                        style: TextStyle(fontSize: 12.sp, color: Colors.red)),
                    Text(event.title ?? "", // Use event name here
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    Text(
                        event.location?.address ??
                            "", // Use event location here
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
