import 'package:flutter/material.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/widgets/button.dart';
import 'package:gerd/widgets/text_inputs.dart';

class Profile extends StatelessWidget {
  // const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'PROFILE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: 150,
                width: 150,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/user.png',
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: Text(
                "Upload Picture",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
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
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextInputN(
                hint: 'Enter your name',
                width: 1,
                height: 40,
                backgroundColor: Colors.white,
                padding: 0,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.done,
                readonly: false,
                setDate: null,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextInputN(
                hint: 'name@example.com',
                width: 1,
                height: 40,
                backgroundColor: Colors.white,
                padding: 0,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.done,
                readonly: false,
                setDate: null,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
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
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 90),
              child: TextInputN(
                hint: 'Enter phone number',
                width: 1,
                height: 40,
                backgroundColor: Colors.white,
                padding: 0,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.done,
                readonly: false,
                setDate: null,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Button(
                buttonName: 'UPDATE',
                onTap: null,
                widthInc: 1,
                heightInc: 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
