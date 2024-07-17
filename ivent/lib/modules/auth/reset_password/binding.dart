import 'package:get/get.dart';
import 'package:ivent/modules/auth/reset_password/controller.dart';
import 'package:ivent/modules/home/controller.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ResetPasswordController>(ResetPasswordController(),
        permanent: true);
  }
}
