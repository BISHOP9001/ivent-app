import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ivent/modules/events/filter/controller.dart';

class FilterPage extends GetView<FilterController> {
  FilterPage({super.key});

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
          'Filter',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10.h),
            SizedBox(
              height: 50.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryChip('Sports', Icons.sports_basketball),
                  _buildCategoryChip('Music', Icons.music_note),
                  _buildCategoryChip('Art', Icons.brush),
                  _buildCategoryChip('Food', Icons.restaurant),
                  _buildCategoryChip('Tech', Icons.computer),
                ],
              ),
            ),
            Gap(20.h),
            Text(
              'Time & Date',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTimeChip('Today'),
                _buildTimeChip('Tomorrow'),
                _buildTimeChip('This week'),
              ],
            ),
            Gap(10.h),
            ElevatedButton.icon(
              onPressed: () {
                // Handle date picker
              },
              icon: Icon(Icons.calendar_today, color: Colors.black),
              label: Text(
                'Choose from calendar',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Gap(20.h),
            Text(
              'Location',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10.h),
            Obx(() => Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      Gap(10.w),
                      Text(
                        controller.selectedLocation.value,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,
                          size: 16.sp, color: Colors.grey),
                    ],
                  ),
                )),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: controller.resetFilters,
                  child: Text('RESET', style: TextStyle(color: Colors.black)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.applyFilters,
                  child: Text('APPLY'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon) {
    return Obx(() {
      final isSelected = controller.selectedCategories.contains(label);
      return GestureDetector(
        onTap: () => controller.toggleCategory(label),
        child: Container(
          margin: EdgeInsets.only(right: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
              color: isSelected ? Colors.green : Colors.grey,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? Colors.green : Colors.grey),
              Gap(5.w),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildTimeChip(String label) {
    return Obx(() {
      final isSelected = controller.selectedTime.value == label;
      return GestureDetector(
        onTap: () => controller.selectTime(label),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
              color: isSelected ? Colors.green : Colors.grey,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      );
    });
  }
}
