import 'dart:convert';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/api_response_model.dart';
import 'package:gerd/model/get_patient_model.dart';
import 'package:http/http.dart' as http;

import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/patient_test.dart';
import 'package:http/http.dart' as http;

class GetPatientListService {
  static const API = BaseUrl;

  Future<APIResponse<List<PatientTest>>> getPatientsList() {
    return http.get(
      Uri.parse(API + '/getPatient'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer' + " " + Preference.getString('token'),
      },
    ).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final patients = <PatientTest>[];
        for (var item in jsonData['patientList']) {
          final patient = PatientTest(
            id: item['id'],
            name: item['name'],
            age: item['age'].toInt(),
            phone: item['phoneNumber'].toInt(),
            dob: item['date_of_birth'],
          );
          patients.add(patient);
        }
        return APIResponse<List<PatientTest>>(data: patients);
      }
      return APIResponse<List<PatientTest>>(
          error: true, errorMessage: 'An error occurred 1');
    }).catchError(
      (_) => APIResponse<List<PatientTest>>(
          error: true, errorMessage: 'An error occurred 2'),
    );
  }
}
