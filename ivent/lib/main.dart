import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ivent/global/config/global_constants.dart';
import 'package:ivent/global/store/app_store.dart';
import 'package:ivent/routes/app_pages.dart';

import 'dart:io';

import 'package:ivent/routes/app_routes.dart';
import 'package:ivent/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp
  ]); // forcer affichage portrait
  await inialisation();
  var initialRoute = dotenv.get(
    "INITIAL_ROUTE",
    fallback: AppRoutes.initial,
  );
  GlobalConstants.init(dotenv.env);
  await AppStore.init();
  const locale = Locale(
    'en',
    'EN',
  );
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (_, __) => MyApp(
        initialRoute: initialRoute,
        locale: locale,
      ),
    ),
  );
}

inialisation() async {
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  String surl = dotenv.get(
    "SUPABASE_URL",
    fallback: "http://127.0.0.1:8000",
  );
  if (Platform.isAndroid) {
    surl = surl.replaceAll("127.0.0.1", "10.0.2.2");
  }
}

class MyApp extends GetMaterialApp {
  MyApp({Key? key, required String initialRoute, required Locale locale})
      : super(
          key: key,
          title: "Mostaajel",
          debugShowCheckedModeBanner: false,
          theme: appThemeData,
          initialRoute: initialRoute,
          getPages: AppPages.routes,
          locale: locale,
          fallbackLocale: locale,
          //initialBinding: GlobalBinding(),
        );
}
