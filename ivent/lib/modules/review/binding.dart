import 'package:get/get.dart';
import 'package:ivent/modules/profile/controller.dart';
import 'package:ivent/modules/review/controller.dart';

class ReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReviewController>(ReviewController(), permanent: true);
  }
}
