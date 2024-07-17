import 'package:get/get.dart';

import 'auth_store.dart';

class AppStore {
  AppStore._();
  static Future<void> init() async {
    final authStore = AuthStore();
    await authStore.init();
    Get.put(authStore);
  }

  static AuthStore get authStore => Get.find<AuthStore>();
}
