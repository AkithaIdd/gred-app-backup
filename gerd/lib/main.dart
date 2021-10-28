import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerd/service/add_patient_record_service.dart';
import 'package:gerd/service/get_patient_list_service.dart';
import 'package:gerd/service/get_patient_records_list_service.dart';
import 'package:gerd/service/register_service.dart';
import 'package:gerd/view/add_patient_view.dart';
import 'package:gerd/view/change_password.dart';
import 'package:gerd/view/dashboard_new.dart';
import 'package:gerd/view/forgot_password.dart';
import 'package:gerd/view/register.dart';
import 'package:gerd/view/view.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helpers/helpers.dart';
import 'service/login_service.dart';
import 'package:gerd/service/add_patient_service.dart';
import 'view/profile.dart';

void setupLocator() {
  // GetIt.instance.registerLazySingleton(() => LoginService());
  GetIt.instance.registerLazySingleton(() => RegisterService());
  GetIt.instance.registerLazySingleton(() => AddPatientService());
  GetIt.instance.registerLazySingleton(() => AddPatientRecordService());
  GetIt.instance.registerLazySingleton(() => GetPatientListService());
  GetIt.instance.registerLazySingleton(() => GetPatientRecordsListService());
}

void main() async {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

  await Preference.init();

  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Gred App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        // 'dashboard': (context) => DashboardView(),
        // 'settings': (context) => SettingsView(),
        // 'settingsServerDetails': (context) => SettingsServerDetails(),
        // 'settingsRemember': (context) => SettingsRemember(),
        'register': (context) => RegisterPage(),
        'dashboard_new': (context) => Dashboard(),
        'addPatient': (context) => AddPatient(),
        'forgotPassword': (context) => ForgotPassword(),
        'changePassword': (context) => ChangePassword(),
        'profile': (context) => Profile(),
      },
    );
  }
}
