import 'package:flutter/foundation.dart';

class UserRegister {
  String name;
  String email;
  String phoneNumber;
  String password;

  UserRegister(
      {
        @required this.name,
        @required this.email,
        @required this.phoneNumber,
        @required this.password,
      }
      );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password
    };
  }

}