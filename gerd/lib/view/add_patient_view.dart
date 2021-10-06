import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/helpers/size.dart';
import 'package:gerd/model/patient.dart';
import 'package:gerd/widgets/new_patient_record.dart';
import 'package:gerd/widgets/patient_record%20_list.dart';
import 'package:gerd/widgets/text_inputs_date.dart';
import 'package:gerd/widgets/widgets.dart';
import 'package:intl/intl.dart';

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
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

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
        _selectedBirthDate = pickedDate;
        // _dobController.text = _selectedBirthDate as String;
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
              textEditingController: _nameController,
            ),
            SizedBox(
              height: size_8,
            ),
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
              textEditingController: _dobController,
            ),
            SizedBox(
              height: size_8,
            ),
            TextInputN(
              // labelText: 'Name',
              hint: 'Enter Phone No',
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
                  buttonName:widget.isNewPatient == false ? 'Add Record' : 'Add Patient',
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
