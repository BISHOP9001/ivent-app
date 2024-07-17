import 'dart:io';

class GlobalConstants {
  static const String authBox = "auth_box";
  static const String peferedLanguageBox = 'preferred_language';
  static const String searchHistory = 'search_history';

  static String BASE_API_URL = "http://127.0.0.1:8000/api/v1";

  // static const String moyasarKey =
  //     'pk_live_fPDDg7vj3KCopPcbxtEGSNqZYqdAc7JiENRqKR26';

  static const String moyasarKey =
      'pk_test_q9Dj1NDUmyoX7SaxKAxLyUNEm1Non195ZYCdfvAT';

  static void init(Map<String, String> env) {
    if (Platform.isAndroid) {
      BASE_API_URL = env['BASE_API_URL']!.replaceAll("127.0.0.1", "10.0.2.2");
    } else {
      BASE_API_URL = env['BASE_API_URL']!;
    }
  }
}
