import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/helpers/size.dart';
import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/pId.dart';
import 'package:gerd/model/patient_new.dart';
import 'package:gerd/model/patient_record.dart';
import 'package:gerd/model/patient_test.dart';
import 'package:gerd/service/add_patient_service.dart';
import 'package:gerd/service/get_patient_list_service.dart';
import 'package:gerd/service/get_patient_records_list_service.dart';
import 'package:gerd/widgets/new_patient_record.dart';
import 'package:gerd/widgets/patient_record%20_list.dart';
import 'package:gerd/widgets/text_inputs_date.dart';
import 'package:gerd/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/cupertino.dart';

// import 'package:gerd/helpers/string.dart';
import 'package:gerd/model/api_response_model.dart';
import 'package:gerd/widgets/button.dart';
import 'package:gerd/widgets/show_dialog.dart';
import 'package:gerd/widgets/snack_bar.dart';
import 'package:gerd/widgets/text_inputs.dart';
import 'package:get_it/get_it.dart';

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
}

class _AddPatientState extends State<AddPatient> {
  AddPatientService get addPatientService =>
      GetIt.instance<AddPatientService>();

  GetPatientRecordsListService get getPatientRecordsService =>
      GetIt.instance<GetPatientRecordsListService>();
  ResponseModel responseModel;

  final List<PatientRecord> patients = [];

  // pId paID = Preference.getString('patientId');
  // String paID = Preference.getString('patientId');

  pId patId = pId(patientId: Preference.getString('patientId'));

  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
      _dobController.addListener(() {
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
      });
    }
  }

  _fetchPatientRecords() async {
    setState(() {
      _isLoading = true;
    });

    pId patId = pId(patientId: Preference.getString('id'));

    _apiResponse = await getPatientRecordsService.getPatientRecordsList(patId);

    setState(() {
      _isLoading = false;
    });
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

  void _addNew_patient(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: GestureDetector(
              onTap: () {},
              child: NewPatientRecord(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          Preference.getBool('isNewPatient') == false
              ? 'Patient Details'
              : 'Add New Patient',
          // widget.isNewPatient == false ? 'Patient Details' : 'Add New Patient',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
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
              // labelText: Preference.getString('name'),
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
              // labelText: Preference.getString('phone'),
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
                        width: double.infinity,
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
                        // labelText: age,
                        hint: 'Age',
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        backgroundColor: Colors.white,
                        width: double.infinity,
                        padding: 0,
                        height: 36,
                        readonly: false,
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
<<<<<<< HEAD
            SizedBox(
              height: 18,
            ),
=======

            // const Divider(
            //   height: 20,
            //   thickness: 5,
            //   indent: 20,
            //   endIndent: 20,
            // ),
>>>>>>> bbc49b33f038c9385cca39f2e754f63850ef4ae9
            InkWell(
              onTap: () {
                _addNew_patient(context);
              },
              child: Card(
                color: Colors.lightBlue[200],
                margin: EdgeInsets.only(bottom: size_8),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 70,
                      // height: 200,
                      // width: 200,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Image.asset(
                          'assets/plus.png',
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
            // NewPatientRecordList(),
            Builder(
              builder: (_) {
                if (_isLoading) {
                  return CircularProgressIndicator();
                }

                if (_apiResponse.error) {
                  return Center(child: Text(_apiResponse.errorMessage));
                }
                return Expanded(
                  flex: 1,
                  child: SizedBox(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
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
                                          Text(
                                            _apiResponse
                                                .data[index].date_of_test,
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
                                      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
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
                                                .data[index].length_of_les,
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
                                      padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
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
                                      padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
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
                  ),
                );
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Button(
                  buttonName: Preference.getBool('isNewPatient') == false
                      ? 'Edit Patient'
                      : 'Add Patient',
                  onTap: () {
                    if (widget.isNewPatient == true) {
                      _addNew_patient(context);
                    } else {
                      addPatient();
                    }
                    Navigator.pop(context);
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
    setState(() {
      _isLoading = true;
    });
    String token = 'Bearer' + " " + Preference.getString('token');
    toast.showToast('Patient Added Succesfully');
    final register = PatientNew(
      name: _nameController.text,
      dob: _dobController.text,
      phoneNumber: _phoneNoController.text,
      age: _ageController.text,
    );
    final result = await addPatientService.addPatient(register, token);

    setState(() {
      _isLoading = false;
    });
    final title = 'Done';

    if (result.error) {
      SnackBarWidget.buildSnackbar(context, result.error);
    } else {
      if (result.data.status == 200) {
        ShowDialog(
          title: title,
          text: result.data.message,
          btn: 'Ok',
          onPress: () => Navigator.pop(context, true),
        );
      } else {
        showSnackBar(result.data.message);
      }
    }
  }

  showSnackBar(String message) {
    SnackBarWidget.buildSnackbar(context, message);
  }
}
