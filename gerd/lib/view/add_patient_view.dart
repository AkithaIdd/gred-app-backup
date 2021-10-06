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
                            : DateFormat('dd,MM,yyyy')
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
              onTap: () {},
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
