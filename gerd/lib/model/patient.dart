import 'package:flutter/foundation.dart';

class Patient {
  final String id;
  final String name;
  final int age;
  final int phone;
  final DateTime testDate;
  final int ageOfOnset;
  final double damageLength;


  Patient({
    @required this.id,
    @required this.name,
    @required this.age,
    @required this.phone,
    @required this.testDate,
    @required this.ageOfOnset,
    @required this.damageLength,

  });
}
