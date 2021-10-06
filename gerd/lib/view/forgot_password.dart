import 'package:flutter/material.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/widgets/button.dart';
import 'package:gerd/widgets/text_inputs.dart';

class ForgotPassword extends StatelessWidget {
  // const ForgotPassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          forgotPassword,
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
                FORGOT_PASSWORD_MESSAGE,
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
                EMAIL,
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
                hint: ENTER_YOUR_EMAIL,
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
                buttonName: RESET_PASSWORD,
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
