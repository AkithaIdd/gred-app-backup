import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/size.dart';
import 'package:gerd/helpers/style.dart';
import 'package:gerd/model/patient.dart';
import 'package:gerd/model/patient_test.dart';
import 'package:gerd/widgets/menu_drawer.dart';
import 'package:gerd/widgets/patient_list.dart';
import 'package:gerd/widgets/widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<PatientTest> patients = [
    PatientTest(
      id: 'p1',
      name: 'Akitha Iddamalgoda',
      age: 50,
      phone: 0779033811,
    ),
    PatientTest(
      id: 'p2',
      name: 'Akitha Iddamalgoda',
      age: 60,
      phone: 0713465865,
    ),
    PatientTest(
      id: 'p3',
      name: 'Akitha Iddamalgoda',
      age: 70,
      phone: 0713465865,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        appBar: AppBar(
            actions: [
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: Theme
                          .of(context)
                          .textTheme
                          .body1,
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2.0),
                            child: Icon(FontAwesomeIcons.solidUser, size: 15,),
                          ),
                        ),
                        TextSpan(text: 'abc', style: TextStyle(
                            fontSize: 20
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ],
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'GERD APP',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            leading: Builder(
              builder: (context) =>
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
            )),
        drawer: MenuDrawer(),
        body: Container(
          // padding: EdgeInsets.all(5),
          child: Column(

            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child:
                  Row(children: [
                    // SizedBox(
                    //   // width: size_8,
                    // ),
                    TextInputN(
                      hint: 'Search Patient',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      backgroundColor: Colors.white,
                      width: 0.82,
                      padding: 0,
                      height: 36,
                      readonly: false,
                      // textEditingController: _searchController,
                    ),
                    ImageButton(
                      customIcon: FontAwesomeIcons.filter,
                      onTap: () {
                        // searchDialog();
                      },
                      margin: size_8,
                    ),
                    // ImageButton(
                    //   customIcon: FontAwesomeIcons.camera,
                    //   onTap: () {
                    //     scanBarcode();
                    //       },
                    //   margin: size_8,
                    // ),
                  ])
              ),

              // IconButton(onPressed: (){}, icon: Icon(Icons.menu_rounded))

              SizedBox(
                height: 4,
              ),
              // PatientList(patients),
              NewPatientList(),
              // Column(
              //   children: patients.map((tx) {
              //     return Container(
              //       // padding: EdgeInsets.only(top: 2.5,bottom: 2.5,right: 5,left: 5),
              //       width: double.infinity,
              //
              //       child:
              //       Card(
              //         // color: Colors.white,
              //         // child:
              //         // Container(
              //         //   padding: EdgeInsets.all(8),
              //         //   child: Column(
              //         //     crossAxisAlignment: CrossAxisAlignment.start,
              //         //     children: <Widget>[
              //         //       Row(
              //         //         children: [
              //         //           Text('Name:  '),
              //         //           Text(
              //         //             tx.name,
              //         //             style: TextStyle(
              //         //               fontSize: 16,
              //         //               fontWeight: FontWeight.bold,
              //         //             ),
              //         //           ),
              //         //         ],
              //         //       ),
              //         //       SizedBox(
              //         //         height: 5,
              //         //       ),
              //         //       Row(
              //         //         children: [
              //         //           Text('Age:  '),
              //         //           Text(
              //         //             tx.age.toString(),
              //         //             style: TextStyle(
              //         //               fontSize: 16,
              //         //               fontWeight: FontWeight.bold,
              //         //             ),
              //         //           ),
              //         //         ],
              //         //       ),
              //         //       SizedBox(
              //         //         height: 5,
              //         //       ),
              //         //       Row(
              //         //         children: [
              //         //           Text('Phone No:  '),
              //         //           Text(
              //         //             tx.phone.toString(),
              //         //             style: TextStyle(
              //         //               color: Colors.grey,
              //         //             ),
              //         //           ),
              //         //         ],
              //         //       ),
              //         //     ],
              //         //   ),
              //         // ),
              //         //   ],
              //         // ),
              //       ),
              //     );
              //   }).toList(),
              // )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, 'addPatient');

          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
