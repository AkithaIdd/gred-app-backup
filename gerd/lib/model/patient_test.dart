import 'package:flutter/foundation.dart';

<<<<<<< HEAD
class PatientTest {
  final int id;
  final String name;
  final int age;
  final int phone;
  final String dob;
  // final DateTime testDate;
  // final int ageOfOnset;
  // final double damageLength;

  PatientTest({
=======
class Patient {
  final List<PatientList> patientList;

  Patient(this.patientList);
}



class PatientList {
   String id;
   String name;
  // final int age;
   int phone;
   DateTime dob;




  PatientList({
>>>>>>> bbc49b33f038c9385cca39f2e754f63850ef4ae9
    @required this.id,
    @required this.name,
    // @required this.age,
    @required this.phone,
    @required this.dob,
<<<<<<< HEAD
    // @required this.testDate,
    // @required this.ageOfOnset,
    // @required this.damageLength,
=======


>>>>>>> bbc49b33f038c9385cca39f2e754f63850ef4ae9
  });

  PatientList.fromJson(Map<String, dynamic> item){
    this.id = item['id'];
    this.name = item['name'];
    this.phone = item['phoneNumber'];
    this.dob = item['date_of_birth'];
    // this.status = item['status'];
    // this.message = item['message'];

    print("aaa"+name);
  }
}

