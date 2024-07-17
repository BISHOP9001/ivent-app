import 'package:get/get.dart';
import 'package:ivent/global/middleware/auth_middleware.dart';
import 'package:ivent/modules/auth/login/binding.dart';
import 'package:ivent/modules/auth/login/page.dart';
import 'package:ivent/modules/auth/otp_verification/binding.dart';
import 'package:ivent/modules/auth/otp_verification/page.dart';
import 'package:ivent/modules/auth/register/binding.dart';
import 'package:ivent/modules/auth/register/page.dart';
import 'package:ivent/modules/auth/reset_password/binding.dart';
import 'package:ivent/modules/auth/reset_password/page.dart';
import 'package:ivent/modules/events/filter/binding.dart';
import 'package:ivent/modules/events/filter/page.dart';
import 'package:ivent/modules/events/list/binding.dart';
import 'package:ivent/modules/events/list/page.dart';
import 'package:ivent/modules/events/me/binding.dart';
import 'package:ivent/modules/events/me/page.dart';
import 'package:ivent/modules/events/search/binding.dart';
import 'package:ivent/modules/events/search/controller.dart';
import 'package:ivent/modules/events/search/page.dart';
import 'package:ivent/modules/events/show/binding.dart';
import 'package:ivent/modules/events/show/page.dart';
import 'package:ivent/modules/home/binding.dart';
import 'package:ivent/modules/home/page.dart';
import 'package:ivent/modules/participation/badge.dart';
import 'package:ivent/modules/participation/binding.dart';
import 'package:ivent/modules/participation/registration.dart';
import 'package:ivent/modules/profile/binding.dart';
import 'package:ivent/modules/profile/page.dart';
import 'package:ivent/routes/app_routes.dart';

List<GetMiddleware> globalMiddleware = [
  AuthMiddleware(),
];

class AppPages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      middlewares: [...globalMiddleware],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpVerificationPage(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.reset,
      page: () => ResetPasswordPage(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.showEvent,
      page: () => EventPage(),
      binding: EventBinding(),
      middlewares: [...globalMiddleware],
    ),
    GetPage(
      name: AppRoutes.searchEvent,
      page: () => EventSearchPage(),
      binding: EventSearchBinding(),
      middlewares: [...globalMiddleware],
    ),
    GetPage(
      name: AppRoutes.listEvents,
      page: () => EventsPage(),
      binding: EventsBinding(),
      middlewares: [...globalMiddleware],
    ),
    GetPage(
      name: AppRoutes.filterEvent,
      page: () => FilterPage(),
      binding: FilterBinding(),
      middlewares: [...globalMiddleware],
    ),
    GetPage(
      name: AppRoutes.participation,
      page: () => RegistrationFormPage(),
      binding: RegistrationFormBinding(),
      middlewares: [...globalMiddleware],
    ),
    GetPage(
      name: AppRoutes.badge,
      page: () => BadgePage(),
      binding: RegistrationFormBinding(),
      middlewares: [...globalMiddleware],
    ),
    GetPage(
      name: AppRoutes.myEvents,
      page: () => MyEventsPage(),
      binding: MyEventsBinding(),
      middlewares: [...globalMiddleware],
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      middlewares: [...globalMiddleware],
    ),
  ];
}
