import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerd/view/add_patient_view.dart';
import 'package:gerd/view/dashboard_new.dart';
import 'package:gerd/view/register.dart';
import 'package:gerd/view/view.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helpers/helpers.dart';
import 'service/login_service.dart';

void setupLocator(){
  GetIt.instance.registerLazySingleton(() => LoginService());

}

void main() async{
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

  await Preference.init();

  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Gred App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme: GoogleFonts.josefinSansTextTheme(
            Theme.of(context).textTheme
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        'dashboard': (context) => DashboardView(),
        'settings': (context) => SettingsView(),
        'settingsServerDetails': (context) => SettingsServerDetails(),
        'settingsRemember': (context) => SettingsRemember(),
        'register': (context) => RegisterPage(),
        'dashboard_new': (context) => Dashboard(),
        'addPatient': (context) => AddPatient(),
      },
    );
  }
}