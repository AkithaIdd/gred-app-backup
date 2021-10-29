// import 'package:flutter/material.dart';
// import 'package:gerd/helpers/helpers.dart';
// import 'package:gerd/model/patient_test.dart';
// import 'package:gerd/view/add_patient_view.dart';
// import 'package:intl/intl.dart';

// class NewPatientList extends StatefulWidget {
//   const NewPatientList({Key key}) : super(key: key);

//   @override
//   _NewPatientListState createState() => _NewPatientListState();
// }

// class _NewPatientListState extends State<NewPatientList> {
//   bool _isLoading = false;
//   // DateFormat dateForma = DateFormat("dd,MM,yyyy");
//   // DateTime dateTime = dateForma.parse("23,09,1988");

//   // final List<PatientTest> patients = [
//   //   PatientTest(
//   //     id: 'p1',
//   //     name: 'Akitha Iddamalgoda',
//   //     age: 90,
//   //     dob: DateTime.now(),
//   //     phone: 0779033811,
//   //   ),
//   //   PatientTest(
//   //     id: 'p2',
//   //     name: 'Akitha ',
//   //     age: 60,
//   //     dob: DateTime(23, 09, 1938),
//   //     phone: 0713465865,
//   //   ),
//   //   PatientTest(
//   //     id: 'p3',
//   //     name: ' Iddamalgoda',
//   //     age: 70,
//   //     dob: DateTime(23, 09, 1968),
//   //     phone: 0713465865,
//   //   ),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         color: Colors.transparent,
//         margin: EdgeInsets.symmetric(vertical: 4),
//         child: Builder(
//           builder: (_) {
//             // if (_isLoading) {
//             //   return Center(child: CircularProgressIndicator());
//             // }
//             return ListView.builder(
//                 physics: BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 // scrollDirection: Axis.vertical,
//                 padding: const EdgeInsets.symmetric(horizontal: 0),
//                 itemCount: patients.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {
//                       // AddPatient(name: 'akitha',);
//                       // Navigator.pushNamed(context, 'addPatient');
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => AddPatient(
//                                 pname: patients[index].name,
//                                 phoneNo: patients[index].phone,
//                                 dob: patients[index].dob,
//                                 isNewPatient: false,
//                               )));
//                     },
//                     child: Card(
//                       margin: EdgeInsets.only(bottom: size_8),
//                       child: Container(
//                         padding: EdgeInsets.all(8),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Row(
//                               children: [
//                                 Text('Name:  '),
//                                 Text(patients[index].name,
//                                     style: smallTextBlackBoldStyle
//                                     // tx.name,
//                                     // style: TextStyle(
//                                     //   fontSize: 16,
//                                     //   fontWeight: FontWeight.bold,
//                                     // ),
//                                     ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               children: [
//                                 Text('Age:  '),
//                                 Text(
//                                   patients[index].age.toString(),
//                                   style: smallTextBlackBoldStyle,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               children: [
//                                 Text('Phone No:  '),
//                                 Text(
//                                   patients[index].phone.toString(),
//                                   style: smallTextBlackBoldStyle,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 });
//           },
//         ),
//       ),
//     );
//   }
// }
