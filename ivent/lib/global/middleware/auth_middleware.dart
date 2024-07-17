import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivent/routes/app_routes.dart';
import 'package:ivent/global/store/auth_store.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    AuthStore authStore = Get.find<AuthStore>();
    if (!authStore.isLoggedIn.value) {
      return RouteSettings(name: AppRoutes.login);
    }
    return null;
  }

  @override
  int? get priority => 1;
}
