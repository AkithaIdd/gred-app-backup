import 'package:flutter/material.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/widgets/button.dart';
import 'package:gerd/widgets/button_with_color.dart';
import 'package:gerd/widgets/text_inputs.dart';

class ChangePassword extends StatelessWidget {
  // const ChangePassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          changePassword,
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
                // height: 200,
                // width: 200,
                child: Container(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                'assets/lock.png',
                fit: BoxFit.cover,
              ),
            )),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: Text(
                CHANGE_PASSWORD_MESSAGE,
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
                CURRENT_PASSWORD,
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
                hint: ENTER_YOUR_CURRENT_PASSWORD,
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
                NEW_PASSWORD,
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
                hint: ENTER_YOUR_NEW_PASSWORD,
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
                CONFIRM_PASSWORD,
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
                hint: ENTER_YOUR_CONFIRMED_PASSWORD,
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
                buttonName: CHANGE_PASSWORD,
                onTap: null,
                widthInc: 1,
                heightInc: 0.05,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ButtonWithColor(
                buttonName: CANCEL,
                onTap: null,
                widthInc: 1,
                heightInc: 0.05,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
