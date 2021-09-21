import 'package:fluttertoast/fluttertoast.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/helpers/string.dart';
import 'package:gerd/helpers/style.dart';
import 'package:gerd/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/widgets/widgets.dart';
import 'package:passwordfield/passwordfield.dart';

class SettingsView extends StatelessWidget {

  TextEditingController txtAuthPw = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBarWidget(
        title: settings_server_details,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return  confirmationDialog(context);
                    });
              },
              child: Container(
                  height: 50,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(children: [
                          Icon(
                            FontAwesomeIcons.server,
                            size: 18,
                            color: accentColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Server Details',
                              style: middleTextBlackStyle,
                            ),
                          ),
                        ]),
                      ),
                      Icon(FontAwesomeIcons.chevronRight,
                          size: 24, color: black),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'settingsRemember');
              },
              child: Container(
                height: 50,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(children: [
                        Icon(
                          FontAwesomeIcons.checkSquare,
                          size: 18,
                          color: accentColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Remember',
                            style: middleTextBlackStyle,
                          ),
                        ),
                      ]),
                    ),
                    Icon(FontAwesomeIcons.chevronRight, size: 24, color: black),
                  ],
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: InkWell(
          //     onTap: () {},
          //     child: Container(
          //       height: 50,
          //       color: Colors.white,
          //       margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
          //       padding: EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Container(
          //             child: Row(children: [
          //               Icon(
          //                 FontAwesomeIcons.infoCircle,
          //                 size: 18,
          //                 color: accentColor,
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 8.0),
          //                 child: Text(
          //                   'About',
          //                   style: middleTextBlackStyle,
          //                 ),
          //               ),
          //             ]),
          //           ),
          //           Icon(FontAwesomeIcons.chevronRight, size: 24, color: black),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget confirmationDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                color: primary,
                child: Center(
                  child: Text(
                    confirmAuthorization,
                    style: largeWhiteTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                child: Text(
                  password,
                  textAlign: TextAlign.left,
                  style: middleTextBlackStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: size_16),
                child:  Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: PasswordField(
                    inputStyle: TextStyle(fontSize: 14),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    suffixIconEnabled: false,
                    textPadding: EdgeInsets.symmetric(horizontal: 0),
                    backgroundColor: Colors.transparent ,
                    backgroundBorderRadius: BorderRadius.circular(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(width: 2, color: Colors.green)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.green)),
                      controller: txtAuthPw
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    buttonName: cancel,
                    onTap: () {
                      Navigator.pop(context, false);
                    },
                    widthInc: 0.25,
                    heightInc: 0.054,
                  ),
                  SizedBox(width: 10),
                  Button(
                    buttonName: yes,
                    onTap: () {
                      if(txtAuthPw.text == authPassword) {
                        Navigator.pushNamed(context, 'settingsServerDetails');
                      }else{
                        showToast("Authorization Failed");
                      }
                    },
                    widthInc: 0.25,
                    heightInc: 0.054,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
