import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ivent/global/store/app_store.dart';
import 'package:ivent/global/store/auth_store.dart';
import 'package:ivent/routes/app_navigation.dart';
import 'package:ivent/themes/app_theme.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(AppStore
                        .authStore.currentUser.value!.user!.photoUrl ??
                    ""), // Replace with the actual path to the profile image
              ),
              accountName: Text(
                AppStore.authStore.currentUser.value!.user!.name!,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                AppStore.authStore.currentUser.value!.user!.email!,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              onTap: () {
                AppNavigation.toProfile();
              },
            ),
            ListTile(
              leading: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(Icons.message),
                  CircleAvatar(
                    radius: 7.r,
                    backgroundColor: Colors.orange,
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 10.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
              title: Text('Messages'),
              onTap: () {
                // Handle Messages tap
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendar'),
              onTap: () {
                // Handle Calendar tap
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                // Handle Contact Us tap
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Helps & FAQs'),
              onTap: () {
                // Handle Helps & FAQs tap
              },
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () {
                AppStore.authStore.loggedOut();
                AppNavigation.toLogin(offNamed: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
