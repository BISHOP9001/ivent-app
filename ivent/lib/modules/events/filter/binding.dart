import 'package:get/get.dart';
import 'package:ivent/modules/events/filter/controller.dart';
import 'package:ivent/modules/events/search/controller.dart';

class FilterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FilterController>(FilterController(), permanent: true);
  }
}
