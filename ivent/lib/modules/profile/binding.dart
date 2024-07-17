import 'package:get/get.dart';
import 'package:ivent/modules/profile/controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController(), permanent: true);
  }
}
