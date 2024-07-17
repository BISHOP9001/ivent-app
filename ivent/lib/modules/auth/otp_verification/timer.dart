import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivent/data/models/user.model.dart';
import 'package:ivent/modules/auth/otp_verification/controller.dart';
import 'package:ivent/themes/app_styles.dart';
import 'package:ivent/themes/app_theme.dart';

class OtpTimerController extends GetxController {
  var timeLeft = 60.obs;
  late Timer timer;
  var ct = Get.put(OtpVerificationController());
  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);

    timer = Timer.periodic(oneSec, (Timer t) {
      if (timeLeft.value == 0) {
        timer.cancel();
      } else {
        timeLeft.value -= 1;
      }
    });
  }

  void resendCode(User user) async {
    var c = Get.put(OtpTimerController());
    if (timeLeft.value == 0) {
      timeLeft.value = 60;
      // var code = ct.performLogin
      //     ? await AuthRepository(AuthProvider())
      //         .checkSignin(user.phone!, user.prefix!)
      //     : await AuthRepository(AuthProvider()).register(user);
      // print(code);
      // if (code != null) {
      //   _shonSnackbar(code.toString());
      // }
      // c.codeCtrl.clear();
      // _startTimer();
    }
  }

  _shonSnackbar(String code) {
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 7),
        title: "إشعار مؤقت",
        message: "code: $code",
        backgroundColor: const Color(0xFF16a085),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        mainButton: IconButton(
          onPressed: () {
            Get.closeAllSnackbars();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}

class OtpTimer extends GetView<OtpTimerController> {
  @override
  final controller = Get.put(OtpTimerController());

  User user;

  OtpTimer(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (controller.timeLeft.value == 0) {
                    controller.resendCode(user);
                  }
                },
                child: Container(
                  height: 35,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Re-send code in ",
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
                        ),
                      ),
                      const SizedBox(width: 5),
                      if (controller.timeLeft.value != 0)
                        Text(
                          controller.timeLeft.value.toString(),
                          style: const TextStyle(fontSize: 22),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
