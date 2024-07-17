import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ivent/global/config/global_constants.dart';
import 'package:ivent/global/helper/request_exception.dart';
import 'package:ivent/global/helper/utils.dart';
import 'package:ivent/global/store/auth_store.dart';

abstract class AppGetConnect extends GetConnect {
  AuthStore authStore = Get.find<AuthStore>();
  late final List<dynamic Function(dynamic)> _decoders = [];

  AppGetConnect() {
    timeout = const Duration(seconds: 45);
    // httpClient.defaultDecoder = _decoder;
    baseUrl = dotenv.get(
      "BASE_API_URL",
      fallback: GlobalConstants.BASE_API_URL,
    );
    if (Platform.isAndroid) {
      baseUrl = baseUrl.toString().replaceAll("127.0.0.1", "10.0.2.2");
    }

    httpClient.addAuthenticator<dynamic>((request) async {
      return request;
    });
    httpClient.addRequestModifier<dynamic>(
      (request) {
        try {
          request.headers['Content-Type'] = "application/json";
          request.headers['Accept'] = "application/json";
          request.headers['lang'] = "ar";

          if (authStore.isLoggedIn.value == true) {
            request.headers['Authorization'] =
                'Bearer ${authStore.currentUser.value!.token}';
          }
          //  request.headers['Authorization'] =
          //   'Bearer 8|bckto3uCcRzZGO8ZjeuCS0fNqpBcjPax1kv8m1PI';
        } catch (e) {
          printWithTag("#GENIT_ERROR", e.toString());
        }
        return request;
      },
    );
  }

  String buildUrl(String endpoint) {
    var burl = dotenv.get(
      "BASE_API_URL",
      fallback: GlobalConstants.BASE_API_URL,
    );
    if (Platform.isAndroid) {
      burl = burl.replaceAll("127.0.0.1", "10.0.2.2");
    }
    return "$burl/$endpoint";
  }

  getData(Response<dynamic> response) {
    if (response.status.code == 200 || response.status.code == 202) {
      var data = response.body;
      return response.body['data'];
    } else if (response.status.code == 422 || response.status.code == 401) {
      var d = response;

      var data = response.body;

      throw RequestException(response.body);
    } else {
      throw Exception({'message': 'Problème au niveau du serveur'});
    }
  }

  useDecoder({
    required dynamic Function(dynamic) decoder,
  }) {
    _decoders.add(decoder);
  }

  T _decoder<T>(res) {
    for (var decoder in _decoders) {
      res = decoder(res);
    }
    return _jsonDecoder<T>(res);
  }

  T _jsonDecoder<T>(res) {
    try {
      var sbody = res;
      printWithTag("_jsonDecoder", sbody);
      var data = jsonDecode(sbody);
      return data;
    } catch (e) {
      printWithTag("jsonDecoder-error", e);
      rethrow;
    }
  }
}
