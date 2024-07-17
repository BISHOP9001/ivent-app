import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ivent/global/store/app_store.dart';
import 'package:ivent/global/store/auth_store.dart';
import 'package:ivent/routes/app_navigation.dart';
import 'package:ivent/themes/app_theme.dart';

class GBottomNavigationBarController extends GetxController {
  RxInt? unreadNotificationsCount = 0.obs;

  @override
  void onInit() {
    subscribeToUnreadNotificationsCount();
    super.onInit();
  }

  void subscribeToUnreadNotificationsCount() async {
    AuthStore authStore = Get.find();

    if (!authStore.isLoggedIn.value) {
      return;
    }

    // int userId = authStore.currentUser.value!.user!.id!;

    await updateUnreadNotificationsCount();
  }

  Future<void> updateUnreadNotificationsCount() async {
    AuthStore authStore = Get.find();
    // int userId = authStore.currentUser.value!.user!.id!;
  }
}

class GBottomNavigationBar extends GetView<GBottomNavigationBarController> {
  final int currentIndex;
  final Function()? onTap;

  GBottomNavigationBar(
      {required this.currentIndex, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Safely get the user type or default to an empty string if not logged in

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      elevation: 1,
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavItem(
            0,
            Icons.explore,
            'Explore',
            menuIndex: 0,
            onTap: () {
              navigate(0);
            },
          ),
          // Only show this item for logged-in passengers
          _bottomNavItem(
            1,
            Icons.calendar_month,
            'Events',
            menuIndex: 1,
            onTap: () {
              navigate(1);
            },
          ),
          _bottomNavItem(
            2,
            Icons.event_available_outlined,
            'My Events',
            menuIndex: 2,
            onTap: () {
              navigate(2);
            },
          ),
          _bottomNavItem(
            3,
            Icons.account_box_sharp,
            'Profil',
            menuIndex: 3,
            onTap: () {
              navigate(3);
            },
          ),
        ],
      ),
    );
  }

  Widget _bottomNavItem(int i, IconData icon, String title,
      {Function()? onTap, int? menuIndex}) {
    var notifications;
    return Expanded(
      child: IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          if (currentIndex != menuIndex && onTap != null) {
            onTap();
          }
        },
        icon: Column(
          children: [
            const SizedBox(height: 10),
            Icon(
              icon,
              color: menuIndex == currentIndex
                  ? AppColors.primaryColor
                  : const Color(0xFFBAC5CF),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.0,
                color: menuIndex == currentIndex
                    ? AppColors.primaryColor
                    : const Color(0xFFBAC5CF),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            )
          ],
        ),
      ),
    );
  }

  navigate(int index) {
    switch (index) {
      case 0:
        AppNavigation.toHome(offNamed: false);
      case 1:
        return AppNavigation.toListEvents();
      case 2:
        return AppNavigation.toMyEvents();

      case 3:
        AppNavigation.toProfile();
        break;
    }
  }
}
