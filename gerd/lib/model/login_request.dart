import 'package:flutter/foundation.dart';

class LoginRequest {
  int id;
  String userName;
  String password;
  String userCompany;
  String dbName;
  String serviceUrl;

  LoginRequest({this.password, this.userName});

  LoginRequest.withId(this.id,this.password, this.userName);


  Map<String, dynamic> toJson() {
    return {"userName": userName, "password": password};
  }

   LoginRequest.fromJson(Map<String, dynamic> item){
    this.userName = item['userName'];
    this.password = item['item'];
  }
}
