import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/helpers/size.dart';
import 'package:gerd/helpers/style.dart';
import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/patient.dart';
import 'package:gerd/model/patient_test.dart';
import 'package:gerd/service/add_patient_service.dart';
import 'package:gerd/service/get_patient_list_service.dart';
import 'package:gerd/view/add_patient_view.dart';
import 'package:gerd/view/forgot_password.dart';
import 'package:gerd/widgets/menu_drawer.dart';
import 'package:gerd/widgets/patient_list.dart';
import 'package:gerd/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // GetPatientListService get addPatientService =>GetIt.instance<GetPatientListService>();
  GetPatientListService get getPatientService =>
      GetIt.instance<GetPatientListService>();
  String name = Preference.getString('name');
  final List<PatientTest> patients = [];
  APIResponse<List<PatientTest>> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchPatients();
    super.initState();
  }

  _fetchPatients() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await getPatientService.getPatientsList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
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
                      style: Theme.of(context).textTheme.bodyText1,
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2.0,
                            ),
                            child: Icon(
                              FontAwesomeIcons.solidUser,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: Preference.getString('username'),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
            flexibleSpace: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'GERD APP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
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
                  child: Row(
                    children: [
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
                    ],
                  ),
                ),

                // IconButton(onPressed: (){}, icon: Icon(Icons.menu_rounded))

                SizedBox(
                  height: 4,
                ),
                // PatientList(patients),

                // NewPatientList(),
                Builder(
                  builder: (_) {
                    if (_isLoading) {
                      return CircularProgressIndicator();
                    }

                    if (_apiResponse.error) {
                      return Center(child: Text(_apiResponse.errorMessage));
                    }
                    return Expanded(
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          // separatorBuilder: (_, __) => Divider(
                          //   height: 10,
                          // ),
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => AddPatient(
                                //       pname: _apiResponse.data[index].name,
                                //       phoneNo: _apiResponse.data[index].phone,
                                //       dob: _apiResponse.data[index].dob,
                                //       id: _apiResponse.data[index].id,
                                //       isNewPatient: false,
                                //     ),
                                //   ),
                                // );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddPatient(
                                      pname: _apiResponse.data[index].name,
                                      phoneNo: _apiResponse.data[index].phone,
                                      dob: _apiResponse.data[index].dob,
                                      id: _apiResponse.data[index].id,
                                      isNewPatient: false,
                                    ),
                                  ),
                                );

                                // Preference.setString(
                                //   'name',
                                //   _apiResponse.data[index].name,
                                // );
                                // Preference.setString(
                                //   'id',
                                //   _apiResponse.data[index].id.toString(),
                                // );
                                // Preference.setString(
                                //   'phone',
                                //   _apiResponse.data[index].phone.toString(),
                                // );
                                // Preference.setString(
                                //   'dob',
                                //   _apiResponse.data[index].dob,
                                // );
                                // Preference.setBool(
                                //   'isNewPatient',
                                //   false,
                                // );
                                // // Navigator.pushNamed(context, 'addPatient');
                                // Navigator.pushNamed(context, 'addPatient')
                                //     .then((_) {
                                //   // This block runs when you have returned back to the 1st Page from 2nd.
                                //   setState(() {
                                //     // Call setState to refresh the page.
                                //   });
                                // });
                              },
                              child: Card(
                                key: ValueKey(_apiResponse.data[index].id),
                                child: Column(
                                  children: <Widget>[
                                    // InkWell(
                                    //   onTap: () {
                                    //     Preference.setString(
                                    //       'name',
                                    //       _apiResponse.data[index].name,
                                    //     );
                                    //     Navigator.pushNamed(
                                    //         context, 'addPatient');
                                    //   },
                                    // ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Name: ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            _apiResponse.data[index].name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(10, 3, 0, 3),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Date Of Birth: ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            _apiResponse.data[index].dob,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 0, 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Phone Number: ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            _apiResponse.data[index].phone
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: _apiResponse.data.length,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Preference.setBool('isNewPatient', true);

              Preference.setString(
                'name',
                '',
              );
              Preference.setString(
                'phone',
                '',
              );
              Preference.setString(
                'dob',
                '',
              );
              // Navigator.pushNamed(context, 'addPatient');
              Navigator.pushNamed(context, 'addPatient').then((_) {
                // This block runs when you have returned back to the 1st Page from 2nd.
                _fetchPatients();
              });
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         AddPatient(
              //           pname: patients[index].name,
              //           phoneNo:patients[index].phone,
              //           dob: patients[index].dob,
              //
              //         )));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
