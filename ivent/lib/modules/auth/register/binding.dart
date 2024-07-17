import 'package:get/get.dart';
import 'package:ivent/modules/auth/register/controller.dart';
import 'package:ivent/modules/home/controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController(), permanent: true);
  }
}
