import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ivent/data/models/auth.model.dart';
import 'package:ivent/global/config/global_constants.dart';
import 'package:ivent/global/helper/utils.dart';
import 'package:ivent/routes/app_routes.dart';

class AuthStore extends GetxService {
  late Rx<Auth?> auth = Rx<Auth?>(null);
  GetStorage box = GetStorage();
  RxBool isLoggedIn = false.obs;
  RxString preferredLanguage = "".obs;
  late Rx<Auth?> currentUser = Rx<Auth?>(null);
  Map<String, dynamic> jsonUser = {};
  String? manualToken;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<AuthStore> init() async {
    if (manualToken != null) {
      currentUser.value = Auth(accessToken: manualToken, user: null);
      isLoggedIn.value = true;
    } else {
      currentUser.value = null;
      await GetStorage.init();
      bool result = box.hasData(GlobalConstants.authBox);
      printWithTag('authbox', result);
      if (box.hasData(GlobalConstants.authBox)) {
        jsonUser = await box.read(GlobalConstants.authBox);
        printWithTag('authbox', jsonUser);
        currentUser.value = Auth.fromJson(jsonUser);
        await _updateToken();
      }

      if (currentUser.value?.token == '' || currentUser.value?.token == null) {
        isLoggedIn.value = false;
      } else {
        isLoggedIn.value = true;
      }
    }

    return this;
  }

  loggedIn(Auth newAuth) async {
    await box.write(GlobalConstants.authBox, newAuth.toJson());
    box.save();
    auth.value = newAuth;
    isLoggedIn.value = true;
    currentUser.value = newAuth;

    saveFCMToken();
  }

  Future<bool> loggedOut() async {
    await box.remove(GlobalConstants.authBox);
    auth.value = null;
    currentUser.value = null;
    isLoggedIn.value = false;
    return true;
  }

  Future<void> _updateToken() async {
    // if (AppFirebaseMessaging.instance.fcmToken != null) {
    //   // Send the token to the API
    //   AuthProvider().updateFcmToken(
    //     AppFirebaseMessaging.instance.fcmToken!,
    //   );
    // }
  }

  get user {
    return isLoggedIn.value == true ? auth.value!.user : null;
  }

  get currentUserId {
    return isLoggedIn.value == true ? auth.value!.user?.id : null;
  }

  get token {
    return isLoggedIn.value == true ? auth.value!.token : '';
  }

  updatePreferredLanguage(String newLanguage) async {
    await box.write(GlobalConstants.peferedLanguageBox, newLanguage);
    preferredLanguage.value = newLanguage;
    if (newLanguage == 'en') {
      Get.updateLocale(const Locale('en', 'US'));
    } else if (newLanguage == 'ar') {
      Get.updateLocale(const Locale('ar', 'AR'));
    }
    Get.offAllNamed(AppRoutes.home);
  }

  void updateUserProfile() {
    box.write(GlobalConstants.authBox, auth.toJson());
  }

  Future<void> saveFCMToken() async {
    try {
      // final fcmToken = await FirebaseMessaging.instance.getToken();
      // final device = Platform.isAndroid ? 'android' : 'ios';
      // if (fcmToken != null) {
      //   await AuthRepository().setFCMToken(fcmToken, device);
      // }
    } catch (e) {
      print('#Error while stroing the FCM.......');
    }
  }
}
