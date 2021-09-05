import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/adminhome.dart';
import 'package:isurance/Login_signup/choose_signup_account.dart';
import 'package:isurance/Login_signup/login.dart';
import 'package:isurance/constant.dart';
import 'package:isurance/slide_screen/slide_screen1.dart';
import 'package:isurance/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(ArboretumProperties());
}

class ArboretumProperties extends StatelessWidget {
  const ArboretumProperties({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: Colors.grey,
        dialogBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(primary: Colors.cyanAccent[700]),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        highlightColor: Colors.grey[400],
        textSelectionColor: Colors.grey,
      ),
      title: 'main page',
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        SLIDE_SCREEN1: (BuildContext context) => Slider1(),
        LOGIN: (BuildContext context) => Login(),
        CHOOSE_SIGNUP_ACCOUNT: (BuildContext context) => ChooseSignUpAccount(),
        MOTOR_BOAT_INSURANCE: (BuildContext context) => AdminHome(),
        //ADMINPANEL: (BuildContext context) => AdminpanelMainpage(),
      },
      initialRoute: SPLASH_SCREEN,
      //initialRoute: MOTOR_BOAT_INSURANCE,
    );
  }
}
