import 'dart:convert';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/api_response_model.dart';
import 'package:gerd/model/user_login.dart';
import 'package:gerd/model/user_register.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  int status;

  RegisterService({this.status});

  ResponseModel responseModel;
  static const API = BaseUrl;
  static const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',

  };
  Future<APIResponse<ResponseModel>> registerUser(UserRegister item) {
    return http.post(Uri.parse(API + '/register'), headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<ResponseModel>(data: ResponseModel.fromJson(jsonData) );
      }
      return APIResponse<ResponseModel>(error: true, errorMessage: 'An error occurred');
    })
        .catchError((_) => APIResponse<ResponseModel>(error: true, errorMessage: 'An error occurred'));
  }

  Future<APIResponse<UserLogin>> loginUser(UserLogin item) {
    return http.post(Uri.parse(API + '/login'), headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 200) {

        final jsonData = json.decode(data.body);
        return APIResponse<UserLogin>(data: UserLogin.fromJson(jsonData) );
      }
      return APIResponse<UserLogin>(error: true, errorMessage: 'An error occurred');
    })
        .catchError((_) => APIResponse<UserLogin>(error: true, errorMessage: 'An error occurred'));
  }


}