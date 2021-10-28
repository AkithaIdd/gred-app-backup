import 'package:flutter/foundation.dart';

class PatientRecord {
  String patientId;
  String date_of_test;
  String age_of_onset;
  String length_of_les;

  PatientRecord({
    @required this.patientId,
    @required this.date_of_test,
    @required this.age_of_onset,
    @required this.length_of_les,
  });

  Map<String, dynamic> toJson() {
    return {
      "patientId": patientId,
      "date_of_test": date_of_test,
      "age_of_onset": age_of_onset,
      "length_of_les": length_of_les,
    };
  }
}
