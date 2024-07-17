import 'package:get/get.dart';
import 'package:ivent/modules/events/show/controller.dart';
import 'package:ivent/modules/home/controller.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EventController>(EventController(), permanent: true);
  }
}
