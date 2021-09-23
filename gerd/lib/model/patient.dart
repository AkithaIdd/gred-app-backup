import 'package:flutter/foundation.dart';

class Patient {
  final String id;
  final String name;
  final int age;
  final int phone;

  Patient({
    @required this.id,
    @required this.name,
    @required this.age,
    @required this.phone,
  });
}
