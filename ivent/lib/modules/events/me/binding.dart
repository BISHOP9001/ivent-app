import 'package:get/get.dart';
import 'package:ivent/modules/events/filter/controller.dart';
import 'package:ivent/modules/events/me/controller.dart';
import 'package:ivent/modules/events/search/controller.dart';

class MyEventsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MyEventsController>(MyEventsController(), permanent: true);
  }
}
