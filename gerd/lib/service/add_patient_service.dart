import 'dart:convert';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/api_response_model.dart';
import 'package:gerd/model/patient_new.dart';
import 'package:gerd/model/user_login.dart';
import 'package:gerd/model/user_register.dart';
import 'package:gerd/view/add_patient_view.dart';
import 'package:http/http.dart' as http;

class AddPatientService {
  ResponseModel responseModel;
  static const API = BaseUrl;
  // String x = 'Bearer' + Preference.getString('token');
  static const headers = {};
  Future<APIResponse<ResponseModel>> addPatient(PatientNew item, String token) {
    return http
        .post(
      Uri.parse(API + '/addPatient'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$token',
      },
      body: json.encode(
        item.toJson(),
      ),
    )
        .then(
      (data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          return APIResponse<ResponseModel>(
            data: ResponseModel.fromJson(jsonData),
          );
        }
        return APIResponse<ResponseModel>(
            error: true, errorMessage: 'An error occurred');
      },
    ).catchError(
      (_) => APIResponse<ResponseModel>(
          error: true, errorMessage: 'An error occurred'),
    );
  }
}
