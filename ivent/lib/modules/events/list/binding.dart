import 'package:get/get.dart';
import 'package:ivent/modules/events/list/controller.dart';
import 'package:ivent/modules/home/controller.dart';

class EventsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EventsController>(EventsController(), permanent: true);
  }
}
