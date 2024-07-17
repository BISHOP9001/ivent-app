import 'package:get/get.dart';
import 'package:ivent/modules/home/controller.dart';
import 'package:ivent/modules/participation/controller.dart';

class RegistrationFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ParticipationController>(ParticipationController(),
        permanent: true);
  }
}
