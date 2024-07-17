import 'package:ivent/data/models/user.model.dart';

class Auth {
  String? accessToken;
  String? tokenType;
  User? user;

  Auth({
    this.accessToken,
    this.tokenType,
    this.user,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'user': user?.toJson(),
    };
  }

  get token {
    return "$tokenType $accessToken";
  }
}
