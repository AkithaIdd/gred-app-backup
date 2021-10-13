import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/helpers/size.dart';
import 'package:gerd/model/patient_new.dart';
import 'package:gerd/service/add_patient_service.dart';
import 'package:gerd/widgets/new_patient_record.dart';
import 'package:gerd/widgets/patient_record%20_list.dart';
import 'package:gerd/widgets/text_inputs_date.dart';
import 'package:gerd/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:convert' show json;
import 'dart:convert';
import 'dart:convert' show jsonDecode;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    this.phoneNo,
    this.dob,
    this.isNewPatient,
  }) : super(key: key);

  final String pname;
  final int phoneNo;
  final DateTime dob;
  final bool isNewPatient;

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  AddPatientService get addPatientService =>
      GetIt.instance<AddPatientService>();

  ResponseModel responseModel;

  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  ShowToast toast = new ShowToast();

  @override
  void initState() {
    super.initState();

    if (widget.phoneNo != null && widget.pname != null) {
      _nameController.text = widget.pname;
      _phoneNoController.text = widget.phoneNo.toString();
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

  void _addNew_patient(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewPatientRecord(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          widget.isNewPatient == false ? 'Patient Details' : 'Add New Patient',
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
                        // labelText: 'Name',
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

            // Row(
            //   children: <Widget>[
            //     Column(children: [Expanded(
            //       child: Text(
            //         "Date of Birth",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 16,
            //         ),
            //         textAlign: TextAlign.start,
            //       ),
            //     ),
            //     Expanded(
            //       child: TextInputDate(
            //         hint: _selectedBirthDate == null
            //             ? 'Select Date Of Birth'
            //             : DateFormat('dd,MM,yyyy').format(_selectedBirthDate),
            //         inputType: TextInputType.text,
            //         inputAction: null,
            //         backgroundColor: Colors.white,
            //         icon: FontAwesomeIcons.calendar,
            //         width: double.infinity,
            //         padding: 0,
            //         height: 36,
            //         readonly: true,
            //         setDate: _ageDatePicker,
            //         textEditingController: _dobController,
            //       ),
            //     ),
            //   ],
            // ),

            // Container(
            //   margin: EdgeInsets.only(left: 5),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Date of Birth",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 16,
            //     ),
            //     textAlign: TextAlign.start,
            //   ),
            // ),
            // TextInputDate(
            //   hint: _selectedBirthDate == null
            //       ? 'Select Date Of Birth'
            //       : DateFormat('dd,MM,yyyy').format(_selectedBirthDate),
            //   inputType: TextInputType.text,
            //   inputAction: null,
            //   backgroundColor: Colors.white,
            //   icon: FontAwesomeIcons.calendar,
            //   width: double.infinity,
            //   padding: 0,
            //   height: 36,
            //   readonly: true,
            //   setDate: _ageDatePicker,
            //   textEditingController: _dobController,
            // ),
            SizedBox(
              height: size_8,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Divider(
                  thickness: 3,
                )),
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
            // const Divider(
            //   height: 20,
            //   thickness: 5,
            //   indent: 20,
            //   endIndent: 20,
            // ),
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
            NewPatientRecordList(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Button(
                  buttonName: widget.isNewPatient == false
                      ? 'Edit Patient'
                      : 'Add Patient',
                  onTap: () {
                    // if (_formkey.currentState.validate() &
                    //         widget.isNewPatient ==
                    //     true) {
                    //   registerUser();
                    // } else {
                    //   _addNew_patient(context);
                    // }
                    if (widget.isNewPatient == true) {
                      _addNew_patient(context);
                    } else {
                      registerUser();
                    }
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

  Future registerUser() async {
    // int age = 27;
    setState(() {
      _isLoading = true;
    });
    // String token = 'Bearer' + " " + Preference.getString('token');
    String token =
        // 'Bearer' + " " + '25|AnHo9SSFrO22dw0gY21NjQSUFRXwMG5PVQb9UiuL';
        // 'Bearer' + " " + '14|atZ5A5m7HU9dtcFXd1YURwOUw9vbzXf2uHnm94Vu';
        'Bearer' + " " + '29|MgaOS0XTZDpcL4PgWBdETdsRyb0GjiAUPmgPwJQr';
    // var dt = new DateTime.now();
    // var str = JSON.encode(dt, toEncodable: myEncode);
    toast.showToast(_dobController.text);
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

    // final text = result.error
    //     ? (result.errorMessage ?? 'An error occurred')
    //     : result.data.message;

    if (result.error) {
      SnackBarWidget.buildSnackbar(context, result.error);
    } else {
      if (result.data.status == 200) {
        ShowDialog(
          title: title,
          text: result.data.message,
          btn: 'Ok',
          onPress: () => Navigator.pushNamed(context, '/'),
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
