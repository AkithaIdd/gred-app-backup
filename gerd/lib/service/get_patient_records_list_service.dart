import 'dart:convert';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/api_response_model.dart';
import 'package:gerd/model/get_patient_model.dart';
import 'package:gerd/model/pId.dart';
import 'package:gerd/model/patient_record.dart';
import 'package:http/http.dart' as http;

import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/patient_test.dart';
import 'package:http/http.dart' as http;

class GetPatientRecordsListService {
  static const API = BaseUrl;

  Future<APIResponse<List<PatientRecord>>> getPatientRecordsList(pId item) {
    return http
        .post(
      Uri.parse(API + '/getPatientRecords'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer' + " " + Preference.getString('token'),
      },
      body: json.encode(
        item.toJson(),
      ),
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final patientRecords = <PatientRecord>[];
        for (var item in jsonData['patientRecordList']) {
          final patientRecord = PatientRecord(
            date_of_test: item['date_of_test'],
            patientId: item['patientId'].toString(),
            age_of_onset: item['age_of_onset'].toString(),
            length_of_les: item['length_of_les'].toString(),
          );
          patientRecords.add(patientRecord);
        }
        return APIResponse<List<PatientRecord>>(data: patientRecords);
      }
      return APIResponse<List<PatientRecord>>(
          error: true, errorMessage: 'An error occurred 1');
    }).catchError(
      (_) => APIResponse<List<PatientRecord>>(
          error: true, errorMessage: 'An error occurred 2'),
    );
  }
}
