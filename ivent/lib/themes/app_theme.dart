import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const Color primaryColor =
      Color(0XFF56C596); // Mint green from the design
  static const Color whiteColor = Color(0XFFFFFFFF);
  static const Color blackColor = Color(0XFF383737);
  static const Color successColor = Color(0XFF079F3C);
  static Color lightColor = const Color(0XFFF8F3F7);
  static Color orangeColor = const Color(0XFFFFB459);
  static const Color placeholder = Color(0XFFA8A8A8);
  static const Color dangerColor = Color(0XFFc0392b); // for errors
  static Color greyColor = const Color(0XFFDDDDDD);
  static Color lightGreyColor = const Color(0XFFF7F7F7);
  static Color dividerColor = const Color(0XFF707070);
  static Color iconColor = const Color(0XFF909090);
  static Color btnGreyColor = const Color(0XFFDBDADA);

  static Color transparent = const Color(0X00909090);

  static Color background = const Color.fromARGB(255, 252, 254, 255);

  static const Color warning = Color.fromARGB(255, 227, 196, 57);

  static const Color turquoise = Color(0xFF1abc9c); // Turquoise
  static const Color emerald = Color(0xFF2ecc71); // Emerald
  static const Color peterRiver = Color(0xFF3498db); // Peter River
  static const Color amethyst = Color(0xFF9b59b6); // Amethyst
  static const Color wetAsphalt = Color(0xFF34495e); // Wet Asphalt
  static const Color carrot = Color(0xFFe67e22); // Carrot
  static const Color alizarin = Color(0xFFe74c3c); // Alizarin
  static const Color clouds = Color(0xFFecf0f1); // Clouds
  static const Color concrete = Color(0xFF95a5a6); // Concrete
  static const Color orange = Color(0xFFf39c12); // Orange

  static List<Color> themeColors = [
    turquoise,
    emerald,
    peterRiver,
    amethyst,
    wetAsphalt,
    carrot,
    alizarin,
    clouds,
    concrete,
    orange,
  ];
}

final ThemeData appThemeData = ThemeData(
  primaryColor: const Color(0XFF56C596), // Mint green from the design
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    color: Color(0XFF56C596), // Mint green
    titleTextStyle: TextStyle(
      color: Colors.white, // Set title text color to white
      fontSize: 20.0, // Example size, adjust as needed
      fontWeight: FontWeight.bold, // Example weight, adjust as needed
    ),
    toolbarTextStyle: TextStyle(
      color: Colors.white, // Set other toolbar text color to white
      fontSize: 18.0, // Example size, adjust as needed
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 25.0.sp,
      fontFamily: 'Almarai',
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0.sp,
      fontFamily: 'Almarai',
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black.withOpacity(.8),
    surfaceTintColor: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.whiteColor,

  // Customize ElevatedButton's default style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        Color(0XFF56C596), // Mint green background for buttons
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        Colors.white, // Set the text color
      ),
    ),
  ),
  useMaterial3: true,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        AppColors.primaryColor.withOpacity(0.05),
      ),
    ),
  ),
  tabBarTheme: TabBarTheme(
    dividerColor: Colors.transparent,
    labelStyle: TextStyle(
      fontSize: 16.0.sp,
      fontFamily: 'Almarai',
      color: Colors.white,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 16.0.sp,
      fontFamily: 'Almarai',
      color: Colors.white,
    ),
  ),
);

final ThemeData darkThemeData = ThemeData(
  primaryColor: Colors.grey.shade800,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    color: Colors.grey.shade900,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 25.0.sp,
      fontFamily: 'Almarai',
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0.sp,
      fontFamily: 'Almarai',
      color: Colors.white70,
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black.withOpacity(.6),
  ),
  scaffoldBackgroundColor: Colors.grey.shade900,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        Colors.grey.withOpacity(0.05),
      ),
    ),
  ),
);
