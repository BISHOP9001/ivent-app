import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ivent/themes/app_styles.dart';
import 'package:ivent/themes/app_theme.dart';
import 'package:lottie/lottie.dart';

class GUtils {
  static void printWithTag(tag, dynamic data) {
    // ignore_for_file: avoid_print
    print("👋🏼 -🕷--------------------🕷---------------------------🕷");
    // ignore: prefer_interpolation_to_compose_strings
    print({"TAG": "🤖 #GENIT :" + tag, "data": data});
    print("👋🏼 🕷--------------------🕷----------------------------🕷");
  }

  static String? hasError(String errorMessages, String key) {
    // Check if errorMessages is not empty
    if (errorMessages.isNotEmpty) {
      try {
        var response = jsonDecode(errorMessages);

        if (response is Map && response.containsKey(key)) {
          if (response[key] is List && response[key].isNotEmpty) {
            return response[key][0];
          }
        }
      } catch (e) {
        // Handle the exception here, probably not valid JSON.
        print('Invalid JSON: $errorMessages');
      }
    }
    return null;
  }

  static DateTime? parseDateTime(String? value) {
    if (value == null) return null;
    return DateTime.tryParse(value);
  }

  static bool get isRTL => Get.locale!.languageCode == 'ar';
  static void snackbar(
    String title,
    String message, {
    Color color = Colors.red,
    IconData icon = Icons.error,
    SnackPosition snackPosition = SnackPosition.TOP,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 3),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        title: title,
        message: message,
        backgroundColor: color,
        snackPosition: snackPosition,
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

  static Future<Uint8List> compressImageToWebp(
    Uint8List list, {
    int minWidth = 1920,
    int minHeight = 1080,
    int quality = 95,
    int rotate = 0,
  }) async {
    final result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: minHeight,
      minWidth: minWidth,
      quality: quality,
      rotate: rotate,
      format: CompressFormat.webp,
    );
    print(list.length);
    print(result.length);
    return result;
  }

  static bool isValidLatLng(double lat, double lng) {
    return lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180;
  }

  static Widget empty({
    double? w,
    double? h,
    String text = "Empty for the moment",
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/empty.json',
            width: w,
            height: h,
          ),
          Text(
            text.tr,
            style: AppStyles.placeholder,
          ),
        ],
      ),
    );
  }
}

class GenitDevice {
  static Future<String?> getDeviceID() async {
    try {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      return Platform.isAndroid
          ? _readAndroidId(await deviceInfoPlugin.androidInfo)
          : _readIOSId(await deviceInfoPlugin.iosInfo);
    } catch (e) {
      print({'#ERROR': 'Erreur lors de la récupération du device ID'});
      print(e);
    }
    return null;
  }

  static String? _readAndroidId(AndroidDeviceInfo build) {
    // device ID
    return build.id;
    // IF NOT device
    //return build.device;
  }

  static String? _readIOSId(IosDeviceInfo build) {
    return build.identifierForVendor;
  }
}

void printWithTag(tag, dynamic data) {
  // ignore_for_file: avoid_print
  print("👋🏼 -🕷--------------------🕷---------------------------🕷");
  // ignore: prefer_interpolation_to_compose_strings
  print({"TAG": "🤖 #GENIT :" + tag, "data": data});
  print("👋🏼 🕷--------------------🕷----------------------------🕷");
}

void showErrorSnackBar(
  String title,
  String message, {
  IconData iconData = Icons.warning,
}) {
  Get.showSnackbar(GetSnackBar(
    title: title,
    message: message,
    isDismissible: true,
    duration: const Duration(milliseconds: 2500),
    icon: Icon(
      iconData,
      color: AppColors.whiteColor,
    ),
    backgroundColor: AppColors.dangerColor,
    snackPosition: SnackPosition.TOP,
  ));
}

truncate(String text, {int lenght = 30}) {
  if (text.length > lenght) {
    return "${text.substring(0, lenght - 3)}...";
  }
  return text;
}

void showSuccessSnackBar(
  String title,
  String message, {
  IconData iconData = Icons.done,
}) {
  Get.showSnackbar(GetSnackBar(
    title: title,
    message: message,
    isDismissible: true,
    duration: const Duration(milliseconds: 2500),
    icon: Icon(
      iconData,
      color: AppColors.whiteColor,
    ),
    backgroundColor: AppColors.successColor,
  ));
}
