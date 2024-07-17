import 'package:get/get.dart';
import 'package:ivent/modules/auth/login/controller.dart';
import 'package:ivent/modules/home/controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
  }
}
