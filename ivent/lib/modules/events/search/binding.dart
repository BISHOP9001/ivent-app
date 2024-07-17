import 'package:get/get.dart';
import 'package:ivent/modules/events/search/controller.dart';

class EventSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EventSearchController>(EventSearchController(), permanent: true);
  }
}
