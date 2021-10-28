import 'package:flutter/foundation.dart';

class pId {
  String patientId;

  pId({
    @required this.patientId,
  });

  Map<String, dynamic> toJson() {
    return {
      "getPatientRecords": patientId,
    };
  }
}
