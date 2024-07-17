class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? confirmationPassword;

  String? photoUrl;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.confirmationPassword,
    this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      confirmationPassword: json['confirmationPassword'],
      photoUrl: json['photo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmationPassword,
      'photo_url': photoUrl,
    };
  }
}
