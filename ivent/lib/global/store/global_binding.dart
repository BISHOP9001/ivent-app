import 'package:get/get.dart';
import 'package:ivent/global/store/auth_store.dart';
import 'package:ivent/global/widgets/navigation/bottom_navigation_bar.dart';
import 'package:ivent/modules/auth/login/controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(GBottomNavigationBarController());

    // Get.put(AuthStore());
    if (AuthStore().isLoggedIn == true) {}
    Get.lazyPut<LoginController>(() => LoginController());
    // Get.lazyPut<CreatBookingController>(() => CreatBookingController());

    // Get.put(CreatBookingController());

    // Get.lazyPut<HomeController>;
  }
}
