import 'package:gerd/model/patient_test.dart';

class GetPatientModel {
  List<PatientTest> patientList;

  GetPatientModel(this.patientList);

  GetPatientModel.fromJson(Map<String, dynamic> json) {
    this.patientList = json['patientList'];
  }
}
