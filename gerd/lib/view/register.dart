import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerd/helpers/colors.dart';
import 'package:gerd/helpers/helpers.dart';

// import 'package:gerd/helpers/string.dart';
import 'package:gerd/helpers/style.dart';
import 'package:gerd/model/api_response_model.dart';
import 'package:gerd/model/user_register.dart';
import 'package:gerd/service/register_service.dart';
import 'package:gerd/widgets/button.dart';
import 'package:gerd/widgets/show_dialog.dart';
import 'package:gerd/widgets/snack_bar.dart';
import 'package:gerd/widgets/text_inputs.dart';
import 'package:get_it/get_it.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    key,
  }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterService get registerService => GetIt.instance<RegisterService>();

  ResponseModel responseModel;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool checkedValue = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          height: 30,
          decoration: BoxDecoration(color: primaryLight),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: new Text(
            "REGISTER",
            style: TextStyle(fontWeight: FontWeight.bold, color: white),
          ),
        ),
        backgroundColor: background,
        body: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image:AssetImage("assets/background.png"),
              fit: BoxFit.scaleDown,alignment: Alignment.topRight,
            ),
          ),
          child: Center(
              child: Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formkey,
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            height: 40,
                            child: TextInputN(
                              textEditingController: _name,
                              hint: 'Enter your name',
                              width: double.infinity,
                              padding: 0,
                              height: null,
                              readonly: false,
                              // validator: (String value) {
                              //   if (value.isEmpty) {
                              //     return "Please enter name";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            height: 40,
                            child: TextInputN(
                              textEditingController: _email,
                              hint: 'Email',
                              // hint: 'email',
                              width: double.infinity,
                              padding: 0,
                              height: null,
                              readonly: false,
                              // validator: (String value) {
                              //   if (value.isEmpty) {
                              //     return "Please enter  email";
                              //   }
                              //   if (!RegExp(
                              //           "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              //       .hasMatch(value)) {
                              //     return "Please enter valid email";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                        Text(
                          "Password",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            height: 40,
                            child: TextInputN(
                              textEditingController: _password,
                              hint: 'Password',
                              width: double.infinity,
                              padding: 0,
                              height: null,
                              readonly: false,
                              // validator: (String value) {
                              //   if (value.isEmpty) {
                              //     return "Please enter password";
                              //   }
                              //   if (value.length < 8) {
                              //     return "Please choose a password with at least 8 characters";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            height: 40,
                            child: TextInputN(
                              textEditingController: _password,
                              hint: 'Password',
                              width: double.infinity,
                              padding: 0,
                              height: null,
                              readonly: false,
                              // validator: (String value) {
                              //   if (value.isEmpty) {
                              //     return "Please enter password";
                              //   }
                              //   if (value.length < 8) {
                              //     return "Please choose a password with at least 8 characters";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            height: 40,
                            child: TextInputN(
                              textEditingController: _phone,
                              hint: 'Phone Number',
                              width: double.infinity,
                              padding: 0,
                              height: null,
                              readonly: false,
                              // validator: (String value) {
                              //   if (value.isEmpty) {
                              //     return "Please enter  phone";
                              //   }
                              //   if (value.length != 10) {
                              //     return "Please enter valid phone";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          title: GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, 'register');
                            },
                            child: Text('I Agree to Gerd Terms & Conditions',
                                textAlign: TextAlign.start,
                                style: smallTextUnderLineBlackStyle),
                          ),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                        Button(
                          buttonName: 'REGISTER',
                          onTap: () {
                            if (_formkey.currentState.validate()) {
                              registerUser();
                            }
                          },
                          widthInc: 0.9,
                          heightInc: 0.07,
                        ),
                      ],
                    ),
            ),
          )),
        ));
  }

  Future registerUser() async {
    setState(() {
      _isLoading = true;
    });
    final register = UserRegister(
      name: _name.text,
      email: _email.text,
      phoneNumber: _phone.text,
      password: _password.text,
    );
    final result = await registerService.registerUser(register);

    setState(() {
      _isLoading = false;
    });
    final title = 'Done';

    final text = result.error
        ? (result.errorMessage ?? 'An error occurred')
        : result.data.message;

    if (result.error) {
      SnackBarWidget.buildSnackbar(context, text);
    } else {
      if (result.data.status == 200) {
        ShowDialog(
          title: title,
          text: text,
          btn: 'Ok',
          onPress: () => Navigator.pushNamed(context, '/'),
        );
      } else {
        showSnackBar(result.data.message);
      }
    }
  }

  showSnackBar(String message) {
    SnackBarWidget.buildSnackbar(context, message);
  }
}
