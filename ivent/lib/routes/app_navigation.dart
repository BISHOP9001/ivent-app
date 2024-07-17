import 'package:get/get.dart';
import 'package:ivent/modules/events/show/controller.dart';
import 'package:ivent/modules/participation/controller.dart';
import 'package:ivent/routes/app_routes.dart';

class AppNavigation {
  static void toHome({bool offNamed = false}) {
    if (offNamed) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.toNamed(AppRoutes.home);
    }
  }

  static void toLogin({bool offNamed = false}) {
    if (offNamed) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.toNamed(AppRoutes.login);
    }
  }

  static void toRegister({bool offNamed = false}) {
    if (offNamed) {
      Get.offAllNamed(AppRoutes.register);
    } else {
      Get.toNamed(AppRoutes.register);
    }
  }

  static void toOtpVerification({bool offNamed = false}) {
    if (offNamed) {
      Get.offAllNamed(AppRoutes.otp);
    } else {
      Get.toNamed(AppRoutes.otp);
    }
  }

  static void toResetPassword({bool offNamed = false}) {
    if (offNamed) {
      Get.offAllNamed(AppRoutes.reset);
    } else {
      Get.toNamed(AppRoutes.reset);
    }
  }

  static void toShowEvent({bool offNamed = false, int id = 0}) {
    try {
      if (!Get.find<EventController>().isClosed) {
        Get.find<EventController>().eventId = id;
        Get.find<EventController>().onInit();
      }
      ;
    } catch (e) {}

    if (offNamed) {
      Get.offAllNamed(AppRoutes.showEvent,
          arguments: id, parameters: {"id": id.toString()});
    } else {
      Get.toNamed(AppRoutes.showEvent,
          arguments: id, parameters: {"id": id.toString()});
    }
  }

  static void toSearchEvent({bool offNamed = false}) {
    if (offNamed) {
      Get.offAllNamed(AppRoutes.searchEvent);
    } else {
      Get.toNamed(AppRoutes.searchEvent);
    }
  }

  static void toListEvents({bool offNamed = false}) {
    if (offNamed) {
      Get.offAllNamed(AppRoutes.listEvents);
    } else {
      Get.toNamed(AppRoutes.listEvents);
    }
  }

  static void toFilterEvent({bool offNamed = false}) {
    if (offNamed) {
      Get.offAllNamed(AppRoutes.filterEvent);
    } else {
      Get.toNamed(AppRoutes.filterEvent);
    }
  }

  static void toParticipation({bool offNamed = false, int id = 0}) {
    try {
      Get.find<ParticipationController>().onInit();
    } catch (e) {}
    if (offNamed) {
      Get.offAllNamed(AppRoutes.participation,
          arguments: id, parameters: {"id": id.toString()});
    } else {
      Get.toNamed(AppRoutes.participation,
          arguments: id, parameters: {"id": id.toString()});
    }
  }

  static void toBadge({int id = 0}) {
    try {
      var c = Get.find<ParticipationController>();
      c.eventId = id;
      c.onInit();
    } catch (e) {
      Get.lazyPut<ParticipationController>(() => ParticipationController());
      var c = Get.find<ParticipationController>();
      c.eventId = id;
      c.onInit();
    }
    Get.toNamed(AppRoutes.badge);
  }

  static void toMyEvents() {
    Get.toNamed(AppRoutes.myEvents);
  }

  static void toProfile() {
    Get.toNamed(AppRoutes.profile);
  }
}
