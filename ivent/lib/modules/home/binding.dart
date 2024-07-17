import 'package:get/get.dart';
import 'package:ivent/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
