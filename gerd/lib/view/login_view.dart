import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerd/helpers/helpers.dart';
import 'package:gerd/model/login_model.dart';
import 'package:gerd/model/login_request.dart';
import 'package:gerd/service/login_service.dart';
import 'package:gerd/view/view.dart';
import 'package:gerd/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginService get service => GetIt.I<LoginService>();
  LoginResponse loginResponse;

  // CompanyResponse _companyResponse;
  bool rememberUser = true;
  bool rememberPassword = true;
  String userName;
  String password;
  ShowToast toast = new ShowToast();
  var _isLoading = false;

  // DBProvider databaseHelper = DBProvider();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    _initSteps();
  }

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _initSteps() {
    rememberUser = Preference.getBool('rememberUser') ?? true;
    rememberPassword = Preference.getBool('rememberPassword') ?? true;
    userName = Preference.getString('username') ?? 'B01';
    password = Preference.getString('password') ?? 'abc@123';

    _usernameController.text = userName;
    _passwordController.text = password;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      body: Column(
        children: [
          Container(
            height: 12,
            decoration: BoxDecoration(
              color: primaryLight,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/logo.png'),
                  width: 120,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    APP_NAME,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextInputWithIcon(
                    icon: FontAwesomeIcons.solidUser,
                    hint: ENTER_YOUR_USERNAME,
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    textEditingController: _usernameController),
                TextInputWithIcon(
                    icon: FontAwesomeIcons.lock,
                    hint: ENTER_YOUR_PASSWORD,
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.done,
                    textEditingController: _passwordController),
                SizedBox(
                  height: 20,
                ),
                Button(
                  buttonName: 'LOGIN',
                  onTap: () {
                    Navigator.pushNamed(context, 'dashboard_new');
                    // pressedLoginBtn();
                    // Navigator.pushNamed(context, 'dashboard');
                    // String username = "dynslnbc\\mobAdmin";
                    // toast.showToast(username);
                  },
                  widthInc: 0.9,
                  heightInc: 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: rememberUser,
                      onChanged: (value) {
                        setState(() async {
                          rememberUser = value;
                          Preference.setBool('rememberUser', null);
                        });
                      },
                    ),
                    Text(
                      REMEMBER_PASSWORD,
                      style: smallTextBlackStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New User?  ',
                      style: smallTextBlackStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child:
                          Text('Register', style: smallTextUnderLineBlackStyle),
                    )
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(right: 20,left: 20),
            height: 50,
            decoration: BoxDecoration(color: primaryLight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Version 1.0.2',
                  style: middleTextBlackStyle,
                ),
                Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: middleTextBlackStyle,

                )
              ],
            ),
          )
          // Container(
          //   alignment: Alignment.bottomCenter,
          //   height: 55,
          //   decoration: BoxDecoration(
          //     color: primaryLight,
          //   ),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 16.0),
          //       child: ButtonWithColor(
          //           buttonName: 'Settings',
          //           onTap: () {
          //             Navigator.pushNamed(context, 'settings');
          //           },
          //           widthInc: 0.3,
          //           heightInc: 0.054,
          //           color: heinkenBlue),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Future<void> pressedLoginBtn() async {
    setState(() {
      buildShowDialog(context);
    });

    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      final loginRequest = LoginRequest(
          password: _passwordController.text,
          userName: _usernameController.text);

      if (rememberUser) {
        Preference.setString('username', loginRequest.userName);
      } else {
        Preference.setString('username', '');
      }

      if (rememberPassword) {
        Preference.setString('password', loginRequest.password);
      } else {
        Preference.setString('password', '');
      }

      // loginResponse = service.getLoginDetails();
      // try {
      // final jasonData = json.decode(
      //     '{"value":[{"id":"5f425477-865c-4cab-9cd6-4b120d9bb046","DSRNo":"B01",'
      //         '"DSRName":"Burhan","Password":"abc@123","CACode":"30113"'
      //         ',"CAName":"N.A.S Ceylon Beverages (Pvt) Ltd","Address":"30113"}]}');
      // loginResponse = LoginResponse.fromJson(jasonData);

      // if(loginResponse.navUrlList[0].password == loginRequest.password &&
      //     loginResponse.navUrlList[0].dsrNo.toLowerCase() == loginRequest.userName.toLowerCase()){
      // UserDbHandler userDbHandler = new UserDbHandler();
      // // userDbHandler.open();
      // bool isExitUser = await userDbHandler.isUserExist(loginResponse.navUrlList[0].dsrNo);

      // int result = 0;
      // if(!isExitUser){
      //   result = await userDbHandler.insertUser(loginResponse.navUrlList[0]);
      // }

      // DBProvider _dbProvider = new DBProvider();
      //
      // int result = await _dbProvider.insertUser(loginResponse.navUrlList[0]);
      // if(isExitUser || result != 0){
      gotoNext();
      // }

      // }else{
      //   Navigator.pop(context, false);
      //   toast.showToast("Username or password wrong");
      // }

      // } on Exception catch(e){
      //   toast.showToast(e.toString());
      // }
      // await service.postLogin(loginRequest).then((response) {
      //   setState(() {
      //     Navigator.pop(context, false);
      //     _isLoading = false;
      //   });
      //   if (response.error) {
      //     toast.showToast(response.errorMessage);
      //   } else {
      //     loginResponse = response.data;
      //
      //     if (loginResponse != null) {
      //       loginRequest.dbName = loginResponse.message;
      //
      //       if (loginResponse.status != 200) {
      //         toast.showToast("Username or password wrong");
      //       }else if (loginResponse.navUrlList.length == 0) {
      //         toast.showToast("Username company empty. Please contact administrator for permissions");
      //       }else if(loginResponse.navUrlList.length == 1){
      //         loginResponse.navUrlList[0].userName = loginResponse.user;
      //         getCompanyList();
      //       }
      //     } else {
      //       toast.showToast("Response Error");
      //     }
      //   }
      // });
    } else {
      setState(() {
        _isLoading = false;
      });
      toast.showToast("Username or password can not be empty!");
    }
  }

  var valueChoose;

  // company selection dialog box
  Widget dialog() {
    // valueChoose = this._companyResponse.list[0];
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Container(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'Select Your Company',
                style: middleTextBlackStyle,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                      border: Border.all()),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: valueChoose,
                      onChanged: (val) {
                        setState(() {
                          valueChoose = val;
                        });
                      },
                      // items:
                      // this._companyResponse.list.map((Company company) {
                      //   return DropdownMenuItem(
                      //     value: company,
                      //     child:
                      //         Text(company.name, style: middleTextBlackStyle),
                      //   );
                      // }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    buttonName: 'Cancel',
                    onTap: () {
                      Navigator.pop(context, false);
                    },
                    widthInc: 0.2,
                    heightInc: 0.054,
                  ),
                  SizedBox(width: 10),
                  Button(
                    buttonName: 'Apply',
                    onTap: () {
                      // gotoNext();
                    },
                    widthInc: 0.2,
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

  // Future<void> getCompanyList() async {
  //   setState(() {
  //     buildShowDialog(context);
  //   });
  //
  //   await service.getCompanyList().then((response) {
  //     setState(() {
  //       Navigator.pop(context, false);
  //       _isLoading = false;
  //     });
  //
  //     if (response.error) {
  //       toast.showToast(response.errorMessage);
  //     } else {
  //       _companyResponse = response.data;
  //
  //       if (_companyResponse != null && _companyResponse.list != null) {
  //         if (_companyResponse.list.length >= 2) {
  //           showDialog(
  //               context: context,
  //               builder: (BuildContext context) {
  //                 return dialog();
  //               });
  //         } else {
  //           valueChoose = _companyResponse.list[0];
  //           gotoNext();
  //         }
  //       } else {
  //         toast.showToast("Response Error");
  //       }
  //     }
  //   });
  // }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  gotoNext() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardView(),
        settings: RouteSettings(
          arguments: null,
        ),
      ),
    );
  }
}
