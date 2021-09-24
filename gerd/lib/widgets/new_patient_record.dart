import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/widgets/text_inputs.dart';
import 'package:gerd/widgets/text_inputs_date.dart';
import 'package:intl/intl.dart';

import 'button.dart';

class NewPatientRecord extends StatefulWidget {
  const NewPatientRecord({Key key,
  // this.dob
  }) : super(key: key);

  // final DateTime dob;

  @override
  _NewPatientRecordState createState() => _NewPatientRecordState();
}

class _NewPatientRecordState extends State<NewPatientRecord> {
  DateTime _selectedTestDate;

  // int _ageCalculate(){
  //   int age = _selectedTestDate.year - widget.dob.year;
  //
  //   return age;
  // }

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
        _selectedTestDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          child: Column(
            children: [
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
                // textEditingController: _searchController,
              ),
              SizedBox(
                height: size_8,
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
                // textEditingController: _searchController,
              ),
              SizedBox(
                height: size_8,
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
                // textEditingController: _searchController,
              ),
              SizedBox(
                height: size_16,
              ),
              Button(
                buttonName: 'Save Record',
                onTap: () {
                  Navigator.of(context).pop();
                },
                widthInc: 1,
                heightInc: 0.07,
              ),
              // Text(_ageCalculate().toString())

            ],
          ),
        ),
      ),
    );
  }
}
