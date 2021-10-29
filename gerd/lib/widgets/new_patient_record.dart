import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/model/api_response.dart';
import 'package:gerd/model/api_response_model.dart';
import 'package:gerd/model/pId.dart';
import 'package:gerd/model/patient_record.dart';
import 'package:gerd/service/add_patient_record_service.dart';
import 'package:gerd/service/add_patient_service.dart';
import 'package:gerd/service/get_patient_records_list_service.dart';
import 'package:gerd/widgets/text_inputs.dart';
import 'package:gerd/widgets/text_inputs_date.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:gerd/view/add_patient_view.dart';

import 'button.dart';
import 'package:gerd/helpers/size.dart';
import 'package:gerd/model/patient_new.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

// import 'package:gerd/helpers/string.dart';
import 'package:gerd/widgets/button.dart';
import 'package:gerd/widgets/show_dialog.dart';
import 'package:gerd/widgets/snack_bar.dart';

class NewPatientRecord extends StatefulWidget {
  const NewPatientRecord({
    Key key,
    // this.dob
  }) : super(key: key);

  // final DateTime dob;

  @override
  _NewPatientRecordState createState() => _NewPatientRecordState();
}

class _NewPatientRecordState extends State<NewPatientRecord> {
  DateTime _selectedTestDate;
  AddPatientRecordService get addPatientRecordService =>
      GetIt.instance<AddPatientRecordService>();
  GetPatientRecordsListService get getPatientRecordsService =>
      GetIt.instance<GetPatientRecordsListService>();

  ResponseModel responseModel;

  TextEditingController _onsetController = TextEditingController();
  TextEditingController _testController = TextEditingController();
  TextEditingController _lengthController = TextEditingController();

  APIResponse<List<PatientRecord>> _apiResponse;

  @override
  void initState() {
    _fetchPatientRecords();
    super.initState();
  }

  _fetchPatientRecords() async {
    setState(() {
      _isLoading = true;
    });

    pId patId = pId(patientId: Preference.getString('id'));

    _apiResponse = await getPatientRecordsService.getPatientRecordsList(patId);

    // setState(() {
    //   _isLoading = false;
    // });
  }

  // int _ageCalculate(){
  //   int age = _selectedTestDate.year - widget.dob.year;
  //
  //   return age;
  // }
  ShowToast toast = new ShowToast();

  void _testDatePicker() {
    showDatePicker(
      context: context,
      helpText: 'Select Date Of Test',
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        String selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        _selectedTestDate = pickedDate;
        _testController.text = selectedDate;
      });
    });
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                alignment: Alignment.center,
                // child: Text(
                //   'Add Test Records',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date of Test',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              TextInputDate(
                icon: FontAwesomeIcons.calendar,
                hint: _selectedTestDate == null
                    ? 'Select Date Of Test'
                    : DateFormat('dd,MM,yyyy').format(_selectedTestDate),
                inputType: null,
                inputAction: null,
                backgroundColor: Colors.white,
                width: double.infinity,
                padding: 0,
                height: 36,
                readonly: true,
                setDate: _testDatePicker,
                textEditingController: _testController,
              ),
              SizedBox(
                height: size_8,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Age of Onset',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              TextInputN(
                hint: 'Enter age of onset ',
                inputType: TextInputType.number,
                inputAction: null,
                backgroundColor: Colors.white,
                width: double.infinity,
                padding: 0,
                height: 36,
                readonly: false,
                // setDate: _presentDatePicker,
                textEditingController: _onsetController,
              ),
              SizedBox(
                height: size_8,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Length of LES Damage ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              TextInputN(
                hint: 'Enter length of LES damage ',
                inputType: TextInputType.number,
                inputAction: null,
                backgroundColor: Colors.white,
                width: double.infinity,
                padding: 0,
                height: 36,
                readonly: false,
                // setDate: _presentDatePicker,
                textEditingController: _lengthController,
              ),
              SizedBox(
                height: 25,
              ),
              Button(
                buttonName: 'Save',
                onTap: () {
                  setState(() {
                    addPatientRecord();
                  });

                  // Navigator.of(context).pop();
                },
                widthInc: 1,
                heightInc: 0.07,
              ),
              SizedBox(
                height: 40,
              ),
              // Text(_ageCalculate().toString())
            ],
          ),
        ),
      ),
    );
  }

  Future addPatientRecord() async {
    // int age = 27;
    setState(() {
      _isLoading = true;
    });
    String token = 'Bearer' + " " + Preference.getString('token');

    toast.showToast('Patient Record Added Succesfully');
    final register = PatientRecord(
      patientId: Preference.getString('id'),
      length_of_les: _lengthController.text,
      age_of_onset: _onsetController.text,
      date_of_test: _testController.text,
    );
    final result =
        await addPatientRecordService.addPatientRecord(register, token);

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
        Navigator.pop(context, true);
        _fetchPatientRecords();
      } else {
        showSnackBar(result.data.message);
      }
    }
  }

  showSnackBar(String message) {
    SnackBarWidget.buildSnackbar(context, message);
  }
}
