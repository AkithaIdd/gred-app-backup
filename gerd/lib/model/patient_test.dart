import 'package:flutter/foundation.dart';

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
    @required this.id,
    @required this.name,
    // @required this.age,
    @required this.phone,
    @required this.dob,


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

