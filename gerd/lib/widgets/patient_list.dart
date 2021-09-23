import 'package:flutter/material.dart';
import 'package:gerd/model/patient.dart';

class PatientList extends StatelessWidget {
  //const PatientList({Key key}) : super(key: key);
  final List<Patient> patients;

  PatientList(this.patients);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: patients.isEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                print('a');
                return Column(
                  children: [
                    Text('No Added'),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              })
            : ListView.builder(itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text('Name:  '),
                            Text(
                              '${patients[index].name}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Age:  '),
                            Text(
                              '${patients[index].age}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Phone No:  '),
                            Text(
                              '${patients[index].phone}',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //   ],
                  // ),
                );
              }));
  }
}
