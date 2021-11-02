import 'package:flutter/foundation.dart';

class GetPatientRecords {
  int patientId;

  GetPatientRecords({
    @required this.patientId,
  });

  Map<String, dynamic> toJson() {
    return {
      "getPatientRecords": patientId,
    };
  }
}
