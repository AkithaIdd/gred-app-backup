import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/string.dart';
import 'package:gerd/helpers/style.dart';
import 'package:gerd/widgets/button.dart';

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
        appBar: AppBar(),
        backgroundColor: background,
        body: Center(
            child: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Text(
                  REGISTER,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Phone No'),
              ),
              SizedBox(
                height: 20,
              ),
              CheckboxListTile(
                title: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, 'register');
                  },
                  child: Text('Terms & Conditions',
                      textAlign: TextAlign.center,
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
              Button(
                buttonName: 'REGISTER',
                onTap: () {
                  // Navigator.pushNamed(context, 'dashboard');
                  // Navigator.pushNamed(context, 'dashboard');
                  // String username = "dynslnbc\\mobAdmin";
                  // toast.showToast(username);
                },
                widthInc: 0.9,
                heightInc: 0.07,
              ),
            ],
          ),
        )));
  }
}
