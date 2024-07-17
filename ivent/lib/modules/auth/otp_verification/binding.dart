import 'package:get/get.dart';
import 'package:ivent/modules/auth/otp_verification/controller.dart';
import 'package:ivent/modules/home/controller.dart';

class OtpVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<OtpVerificationController>(OtpVerificationController(),
        permanent: true);
  }
}
