import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/helpers/size.dart';
import 'package:gerd/model/api_response.dart';

// import 'package:gerd/helpers/string.dart';
import 'package:gerd/model/api_response_model.dart';
import 'package:gerd/model/pId.dart';
import 'package:gerd/model/patient_new.dart';
import 'package:gerd/model/patient_record.dart';
import 'package:gerd/service/add_patient_service.dart';
import 'package:gerd/service/get_patient_records_list_service.dart';
import 'package:gerd/widgets/button.dart';
import 'package:gerd/widgets/new_patient_record.dart';
import 'package:gerd/widgets/snack_bar.dart';
import 'package:gerd/widgets/text_inputs.dart';
import 'package:gerd/widgets/text_inputs_date.dart';
import 'package:gerd/widgets/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({
    Key key,
    this.pname,
    this.id,
    this.phoneNo,
    this.dob,
    this.isNewPatient,
  }) : super(key: key);

  final String pname;
  final int id;
  final int phoneNo;
  final String dob;
  final bool isNewPatient;

  @override
  _AddPatientState createState() => _AddPatientState();

  static _AddPatientState of(BuildContext context) =>
      context.findAncestorStateOfType<_AddPatientState>();
}

class _AddPatientState extends State<AddPatient> {
  AddPatientService get addPatientService =>
      GetIt.instance<AddPatientService>();

  GetPatientRecordsListService get getPatientRecordsService =>
      GetIt.instance<GetPatientRecordsListService>();
  ResponseModel responseModel;

  final List<PatientRecord> patients = [];


  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isNewPatients;
  ShowToast toast = new ShowToast();

  APIResponse<List<PatientRecord>> _apiResponse;

  @override
  void initState() {
    _fetchPatientRecords();
    super.initState();

    if (widget.isNewPatient == false) {
      _nameController.text = widget.pname;
      _phoneNoController.text = widget.phoneNo.toString();
      _dobController.text = widget.dob;
      DateTime birthDate = new DateFormat("yyyy-MM-dd").parse(
        widget.dob,
      );
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      int month1 = currentDate.month;
      int month2 = birthDate.month;
      if (month2 > month1) {
        age--;
      } else if (month1 == month2) {
        int day1 = currentDate.day;
        int day2 = birthDate.day;
        if (day2 > day1) {
          age--;
        }
      }
      _ageController.text = age.toString();
    }
  }

  _fetchPatientRecords() async {
    setState(() {
      _isLoading = true;
    });

    _dobController.addListener(_ageCalculate);

    GetPatientRecords pId = new GetPatientRecords(patientId: widget.id);
    String token = 'Bearer' + " " + Preference.getString('token');
    _apiResponse =
        await getPatientRecordsService.getPatientRecordsList(pId, token);

    setState(() {
      _isLoading = false;
    });
    if (widget.isNewPatient) {
      isNewPatients = true;
    } else {
      isNewPatients = false;
    }
  }

  void _ageCalculate() {
    DateTime birthDate =
        new DateFormat("yyyy-MM-dd").parse(_dobController.text);
    if (_dobController != null) {
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      int month1 = currentDate.month;
      int month2 = birthDate.month;
      if (month2 > month1) {
        age--;
      } else if (month1 == month2) {
        int day1 = currentDate.day;
        int day2 = birthDate.day;
        if (day2 > day1) {
          age--;
        }
      }
      _ageController.text = age.toString();
    }
  }

  DateTime _selectedBirthDate;
  DateTime _selectedTestDate;
  bool _isLoading = false;

  void _ageDatePicker() {
    showDatePicker(
      context: context,
      helpText: 'Select Date Of Birth',
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        String selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        _selectedBirthDate = pickedDate;
        _dobController.text = selectedDate;
      });
    });
  }

  void _addNewPatientRecord(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: GestureDetector(
              onTap: () {
              },
              child: NewPatientRecord(pid: widget.id,callback: (val) => setState(() {_fetchPatientRecords();})),

            ),
          );
        });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        leading: IconButton(icon:Image.asset('assets/back.png'),
        onPressed: () =>  Navigator.of(context).pop(),),
        actions: [],
        title: Column(
          children: [
            Text(
              widget.isNewPatient == false ? 'PATIENT' : 'Add New Patient',
              style: middleWhiteTextStyle,
            ),
            Visibility(
              visible: isNewPatients == false,
              child: Text(widget.isNewPatient == false ? widget.pname : '',

                style: smallWhiteTextStyle,
              ),
            ),

          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size_8,
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            TextInputN(
              // labelText: 'Name',
              hint: 'Enter your name',
              inputType: TextInputType.name,
              inputAction: TextInputAction.next,
              backgroundColor: Colors.white,
              width: double.infinity,
              padding: 0,
              height: 36,
              readonly: false,
              textEditingController: _nameController,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Please enter name";
                }
                return null;
              },
            ),
            SizedBox(
              height: size_8,
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Phone Number",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            TextInputN(
              // labelText: 'Name',
              hint: 'Enter phone number',
              inputType: TextInputType.number,
              inputAction: TextInputAction.next,
              backgroundColor: Colors.white,
              width: double.infinity,
              padding: 0,
              height: 36,
              readonly: false,

              textEditingController: _phoneNoController,
            ),
            SizedBox(
              height: size_8,
            ),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Date of Birth",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextInputDate(
                        hint: _selectedBirthDate == null
                            ? 'Select Date Of Birth'
                            : DateFormat('yyyy-MM-dd')
                                .format(_selectedBirthDate),
                        inputType: TextInputType.text,
                        inputAction: null,
                        backgroundColor: Colors.white,
                        icon: FontAwesomeIcons.calendar,
                        width:double.infinity,
                        padding: 0,
                        height: 36,
                        readonly: true,
                        setDate: _ageDatePicker,
                        textEditingController: _dobController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  // flex: 2,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Age",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextInputN(
                        // labelText: 'Name',

                        hint: 'Age',
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        backgroundColor: Colors.white,
                        width: double.infinity,
                        padding: 0,
                        height: 36,
                        readonly: true,
                        textEditingController: _ageController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),

            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: isNewPatients == false,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          thickness: 3,
                        ),
                      ),
                      Text(
                        'LES Damage Result',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 3),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size_16,
                  ),
                  InkWell(
                    onTap: ()  {
                       _addNewPatientRecord(context);
                       setState(() {
                         // if(_reload == 'reload'){
                         //   _fetchPatientRecords();
                         // }
                       });


                    },
                    child: Card(
                      color: Colors.lightBlue[100],
                      margin: EdgeInsets.only(bottom: size_8),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 60,
                            // height: 200,
                            // width: 200,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                'assets/plus Add New Patient.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                            child: Text(
                              "Add New LES Damage Result",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size_8,
                  )
                ],
              ),
            ),

            // const Divider(
            //   height: 20,
            //   thickness: 5,
            //   indent: 20,
            //   endIndent: 20,
            // ),

            // NewPatientRecordList(),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: isNewPatients == false,
              child: Builder(
                builder: (_) {
                  if (_isLoading) {
                    return CircularProgressIndicator();
                  }

                  if (_apiResponse.error) {
                    return Center(child: Text(_apiResponse.errorMessage));
                  }

                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      // separatorBuilder: (_, __) => Divider(
                      //   height: 10,
                      // ),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            key: ValueKey(_apiResponse.data[index].patientId),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 0, 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Date Of Test: ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(DateFormat('yyyy-MMM-dd').format(DateFormat("yyyy-MM-dd").parse(_apiResponse.data[index].date_of_test)),
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
                                          EdgeInsets.fromLTRB(10, 5, 0, 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Length Of LES Damage: ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            _apiResponse
                                                .data[index].length_of_les + "mm",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Image(
                                  image: AssetImage('assets/chart.png'),
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                      padding:
                                          EdgeInsets.fromLTRB(0, 5, 10, 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Age: ',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            _ageController.text,
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
                                          EdgeInsets.fromLTRB(0, 5, 10, 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Onset: ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            _apiResponse
                                                .data[index].age_of_onset,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: _apiResponse.data.length,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Button(
                  buttonName: 'Save',
                  onTap: () {
                    if (widget.isNewPatient == true) {
                      _addNewPatientRecord(context);
                    } else {
                      addPatient();
                    }
                    // Navigator.pop(context);
                  },
                  widthInc: 1,
                  heightInc: 0.07,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future addPatient() async {
    // int age = 27;
    // setState(() {
    //   _isLoading = true;
    // });
    String token = 'Bearer' + " " + Preference.getString('token');
    //
    final register = PatientNew(
      name: _nameController.text,
      dob: _dobController.text,
      phoneNumber: _phoneNoController.text,
      age: _ageController.text,
    );
    await addPatientService.addPatient(register, token).then((result) {
      if (result.error) {
        SnackBarWidget.buildSnackbar(context, result.error);
      } else {
        if (result.data.status == 200) {
          toast.showToast('Patient Added Successfully');
          setState(() {
            isNewPatients = false;
          });
        } else {
          SnackBarWidget.buildSnackbar(context, result.data.message);
        }
      }
    });

    // setState(() {
    //   _isLoading = false;
    // });
  }
}
