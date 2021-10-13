import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTestRecord extends StatefulWidget {
  // const AddTestRecord({ Key? key }) : super(key: key);

  @override
  _AddTestRecordState createState() => _AddTestRecordState();
}

class _AddTestRecordState extends State<AddTestRecord> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('Add Test Records'),
            ],
          ),
        ),
      ),
    );
  }
}
