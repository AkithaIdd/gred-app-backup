import 'package:flutter/foundation.dart';

class UserLogin {
  int id;
  String name;
  String email;
  String password;
  String token;
  int status;
  String message;

  UserLogin({
    @required this.email,
    @required this.password,
    @required this.name,
    @required this.id,
    @required this.token,
  });

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }

  UserLogin.fromJson(Map<String, dynamic> item) {
    this.id = item['id'];
    this.name = item['user'];
    this.email = item['email'];
    this.token = item['token'];
    this.status = item['status'];
    this.message = item['message'];

    print(name);
  }
}
