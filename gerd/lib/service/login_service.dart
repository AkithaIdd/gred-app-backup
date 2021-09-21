
import 'dart:convert';

import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:gerd/helpers/helpers.dart';
import 'package:ntlm/ntlm.dart';

class LoginService{

  NTLMClient client = new NTLMClient(
      username: "mobAdmin",
      password: "admin@Mob",
      domain: "dynslnbc");


  Future<APIResponse<LoginResponse>> postLogin(){
      return http.get(Uri.parse(asureBaseUrl + asureEndPoint + login))
      .then((data) {
        if(data.statusCode == 200){
          final jasonData = json.decode(data.body);
          return APIResponse<LoginResponse>(data: LoginResponse.fromJson(jasonData));
        }
        return APIResponse<LoginResponse>(error: true, errorMessage: 'An error occured');
      }).catchError((_) => APIResponse<LoginResponse>(error: true,errorMessage: 'An error occured'));
  }

  LoginResponse getLoginDetails(){
    final jasonData = json.decode(
        '"value":[{"id":"5f425477-865c-4cab-9cd6-4b120d9bb046","DSRNo":"B01","DSRName":"Burhan","Password":"abc@123","CACode":""}]');
    try {
      return LoginResponse.fromJson(jasonData);
    }on Exception catch(e){
      return LoginResponse.fromJson(jasonData);
    }

  }

  // Future<APIResponse<CompanyResponse>> getCompanyList(){
  //   return client.get(Uri.parse(API_BASE_URL+SERVER_ENDPOINT+companies))
  //       .then((data) {
  //     if(data.statusCode == 200){
  //       final jasonData = json.decode(data.body);
  //       return APIResponse<CompanyResponse>(data: CompanyResponse.fromJson(jasonData));
  //     }
  //     return APIResponse<CompanyResponse>(error: true, errorMessage: responseError);
  //   })
  //       .catchError((_) => APIResponse<CompanyResponse>(error: true,errorMessage: appError));
  // }


  // Future<APIResponse<UserAuthResponse>> getUserAuthList(String request){
  //   return client.get(Uri.parse(API_BASE_URL+SERVER_ENDPOINT+companies+request+userSetups))
  //       .then((data) {
  //     if(data.statusCode == 200){
  //       final jasonData = json.decode(data.body);
  //       return APIResponse<UserAuthResponse>(data: UserAuthResponse.fromJson(jasonData));
  //     }
  //     return APIResponse<UserAuthResponse>(error: true, errorMessage: responseError);
  //   })
  //       .catchError((_) => APIResponse<UserAuthResponse>(error: true,errorMessage: appError));
  // }

}