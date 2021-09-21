import 'package:gerd/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerd/helpers/helpers.dart';

class SettingsRemember extends StatefulWidget {
  @override
  _SettingsRememberState createState() => _SettingsRememberState();
}

class _SettingsRememberState extends State<SettingsRemember> {

  @override
  void initState() {
    super.initState();
    _initSteps();

  }
  bool rememberUser = true;
  bool rememberPassword = true;

  _initSteps() {
    // rememberUser = Preference.getBool('rememberUser') ?? true;
    // rememberPassword = Preference.getBool('rememberPassword') ?? true;
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
        backgroundColor: background,
        appBar: AppBarWidget(
          title: settings_remember,
          onPressed: (){
          Navigator.pop(context);
        },),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 16),
            width: size.width * .85,
            height: size.height * .21,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: size.width * .75,
                  margin: const EdgeInsets.only(top: 16.0, bottom: 8),
                  padding: const EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        REMEMBER_USERNAME,
                        style: smallTextBlackStyle,
                      ),
                      Checkbox(
                        value: rememberUser,
                        onChanged: (value)  {
                          setState(() async {
                            rememberUser = value;
                            Preference.setBool('rememberUser',true);
                          });
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width * .75,
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        REMEMBER_PASSWORD,
                        style: smallTextBlackStyle,
                      ),
                      Checkbox(
                        value: rememberPassword,
                        onChanged: (bool value) {
                          setState(() async {
                            rememberPassword = value;
                            Preference.setBool('rememberPassword',value);
                          });
                        },)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}



