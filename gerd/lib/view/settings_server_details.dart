import 'package:gerd/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:passwordfield/passwordfield.dart';


class SettingsServerDetails extends StatefulWidget {
  @override
  _SettingsServerDetailsState createState() => _SettingsServerDetailsState();
}

class _SettingsServerDetailsState extends State<SettingsServerDetails> {

  @override
  void initState() {
    _initSteps();
    super.initState();
  }

  String serviceIP;
  String subscriptionIP;
  String sessionTime;

  _initSteps() {
    // serviceIP = Preference.getString('serviceIP') ?? SERVICE_IP_VAL;
    // subscriptionIP = Preference.getString('subscriptionIP') ?? SUBSCRIPTION_ID_VAL;
    // sessionTime = Preference.getString('sessionTime') ?? SESSION_TIME_OUT_VAL;
  }

  TextEditingController txtServiceIP = new TextEditingController();
  TextEditingController txtSubscriptionIP = new TextEditingController();
  TextEditingController txtSessionTime = new TextEditingController();
  TextEditingController txtAuthPw = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    txtServiceIP.text = serviceIP;
    txtSubscriptionIP.text = subscriptionIP;
    txtSessionTime.text = sessionTime;

    return  Scaffold(
        backgroundColor: background,
        appBar: AppBarWidget(
          title: settings_server_details,
          onPressed: (){
            Navigator.pop(context);
          },),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 16),
            width: size.width * .85,
            height: size.height * .52,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.server,
                        size: 16,
                        color: accentColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: line_space),
                        child: Text(
                          SERVICE_IP_SERVER,
                          style: middleTextBlackStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,bottom: line_space),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        SERVICE_IP,
                        style: smallTextBlackStyle,
                      )),
                ),
                TextInputN(
                    hint: SERVICE_IP_VAL,
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    width: 0.8,
                    padding: 6,
                    height: 40,
                    textEditingController: txtServiceIP,),
                // Padding(
                //   padding: const EdgeInsets.only(left: 16.0,top: line_space,bottom: line_space),
                //   child: Container(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       SUBSCRIPTION_ID,
                //       style: smallTextBlackStyle,
                //     ),
                //   ),
                // ),
                // TextInputN(
                //     hint: SUBSCRIPTION_ID_VAL,
                //     inputType: TextInputType.name,
                //     inputAction: TextInputAction.next,
                //     width: 0.8,
                //     padding: 6,
                //     height: 40,
                //     textEditingController: txtSubscriptionIP),
                // Padding(
                //   padding: const EdgeInsets.only(left: 16.0,bottom: line_space),
                //   child: Container(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       SESSION_TIME_OUT,
                //       style: smallTextBlackStyle,
                //     ),
                //   ),
                // ),
                // TextInputN(
                //     hint: SESSION_TIME_OUT_VAL,
                //     inputType: TextInputType.number,
                //     inputAction: TextInputAction.done,
                //     width: 0.8,
                //     padding: 6,
                //     height: 40,
                //     textEditingController: txtSessionTime),

                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Button(
                        buttonName: CANCEL,
                        onTap: () {Navigator.pop(context, false);},
                        widthInc: 0.3,
                        heightInc: 0.048,
                      ),

                      Button(
                        buttonName: OK,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return confirmationDialog();
                              });

                          },
                        widthInc: 0.3,
                        heightInc: 0.048,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget confirmationDialog() {
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
                child: Container(
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
                    controller: txtAuthPw,


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
                    buttonName: save,
                    onTap: () {
                      if(txtAuthPw.text == authPassword) {
                        setUserDetailsToPref();
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

  void setUserDetailsToPref(){
    Preference.setString('serviceIP',txtServiceIP.text);
    Preference.setString('subscriptionIP',txtSubscriptionIP.text);
    Preference.setString('sessionTime',txtSessionTime.text);
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

