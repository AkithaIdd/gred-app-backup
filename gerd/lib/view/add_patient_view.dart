import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/size.dart';
import 'package:gerd/helpers/style.dart';
import 'package:gerd/model/patient.dart';
import 'package:gerd/widgets/new_patient_record.dart';
import 'package:gerd/widgets/patient_record%20_list.dart';
import 'package:gerd/widgets/text_input_search.dart';
import 'package:gerd/widgets/text_inputs_date.dart';
import 'package:gerd/widgets/widgets.dart';
import 'package:intl/intl.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key key}) : super(key: key);

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  DateTime _selectedBirthDate;
  DateTime _selectedTestDate;
  bool _isLoading = false;


  final List<Patient> itemLineList = [
    Patient(
      id: 'p1',
      testDate: DateTime.now(),
      ageOfOnset: 50,
      damageLength: 20,
    ),
    Patient(
      id: 'p2',
      testDate: DateTime.now(),
      ageOfOnset: 60,
      damageLength: 40,
    ),
    Patient(
      id: 'p3',
      testDate: DateTime.now(),
      ageOfOnset: 70,
      damageLength: 70,
    ),
    // Patient(
    //   id: 'p1',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 50,
    //   damageLength: 20,
    // ),
    // Patient(
    //   id: 'p2',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 60,
    //   damageLength: 40,
    // ),
    // Patient(
    //   id: 'p3',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 70,
    //   damageLength: 70,
    // ),
    // Patient(
    //   id: 'p1',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 50,
    //   damageLength: 20,
    // ),
    // Patient(
    //   id: 'p2',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 60,
    //   damageLength: 40,
    // ),
    // Patient(
    //   id: 'p3',
    //   testDate: DateTime.now(),
    //   ageOfOnset: 70,
    //   damageLength: 70,
    // ),
  ];

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
        _selectedBirthDate = pickedDate;
      });
    });
  }



  void _addNew_patient(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_){
      return GestureDetector(
        onTap: (){},
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
          'Add New Patient',
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
            TextInputN(
              // labelText: 'Name',
              hint: 'Enter Name',
              inputType: TextInputType.name,
              inputAction: TextInputAction.next,
              backgroundColor: Colors.white,
              width: double.infinity,
              padding: 0,
              height: 36,
              readonly: false,
              // textEditingController: _searchController,
            ),
            SizedBox(
              height: size_8,
            ),
            // Text(DateFormat.yMd().format(_selectedDate)),
            TextInputDate(

              hint: _selectedBirthDate == null
                  ? 'Select Date Of Birth'
                  : DateFormat('dd,MM,yyyy').format(_selectedBirthDate),
              inputType: TextInputType.text,
              inputAction: null,
              backgroundColor: Colors.white,
              icon: FontAwesomeIcons.calendar,
              width: double.infinity,
              padding: 0,
              height: 36,
              readonly: true,
              setDate: _ageDatePicker,
              // textEditingController: _searchController,
            ),
            SizedBox(
              height: size_8,
            ),

            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),

            NewPatientRecordList(),



            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Button(
                  buttonName: 'Add Patient',
                  onTap: () {
                    _addNew_patient(context);

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
}
