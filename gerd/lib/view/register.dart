import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/string.dart';
import 'package:gerd/helpers/style.dart';
import 'package:gerd/widgets/button.dart';
import 'package:gerd/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          REGISTER,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
      ),
      backgroundColor: background,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                NAME,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextInputN(
                hint: ENTER_YOUR_NAME,
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
              margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                EMAIL,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
              margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                PASSWORD,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextInputN(
                hint: ENTER_YOUR_PASSWORD,
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
              margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                CONFIRM_PASSWORD,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextInputN(
                hint: ENTER_YOUR_PASSWORD,
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
              margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                PHONE,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextInputN(
                hint: ENTER_YOUR_PHONE,
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
            CheckboxListTile(
              title: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, 'register');
                },
                child: Text('I Agree to Gerd Terms & Conditions',
                    textAlign: TextAlign.left,
                    style: smallTextUnderLineBlackStyle),
              ),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Button(
                buttonName: Register,
                onTap: null,
                widthInc: 1,
                heightInc: 0.05,
              ),
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: Container(
      //     padding: EdgeInsets.only(
      //       left: 15,
      //       right: 15,
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(
      //             bottom: 16,
      //           ),
      //           // child: Text(
      //           //   REGISTER,
      //           //   style: TextStyle(
      //           //       color: Colors.black,
      //           //       fontSize: 30,
      //           //       fontWeight: FontWeight.bold),
      //           // ),
      //         ),
      //         TextField(
      //           decoration: InputDecoration(labelText: 'Name'),
      //         ),
      //         TextField(
      //           decoration: InputDecoration(labelText: 'Email'),
      //         ),
      //         TextField(
      //           decoration: InputDecoration(labelText: 'Phone No'),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         CheckboxListTile(
      //           title: GestureDetector(
      //             onTap: () {
      //               // Navigator.pushNamed(context, 'register');
      //             },
      //             child: Text('Terms & Conditions',
      //                 textAlign: TextAlign.center,
      //                 style: smallTextUnderLineBlackStyle),
      //           ),
      //           value: checkedValue,
      //           onChanged: (newValue) {
      //             setState(() {
      //               checkedValue = newValue;
      //             });
      //           },
      //           controlAffinity:
      //               ListTileControlAffinity.leading, //  <-- leading Checkbox
      //         ),
      //         Button(
      //           buttonName: 'REGISTER',
      //           onTap: () {
      //             // Navigator.pushNamed(context, 'dashboard');
      //             // Navigator.pushNamed(context, 'dashboard');
      //             // String username = "dynslnbc\\mobAdmin";
      //             // toast.showToast(username);
      //           },
      //           widthInc: 0.9,
      //           heightInc: 0.07,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
