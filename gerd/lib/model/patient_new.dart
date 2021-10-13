import 'package:flutter/foundation.dart';

class PatientNew {
  String name;
  String dob;
  String phoneNumber;
  String age;

  PatientNew({
    @required this.name,
    @required this.dob,
    @required this.phoneNumber,
    @required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "date_of_birth": dob,
      "phoneNumber": phoneNumber,
      "age": age,
    };
  }
}
