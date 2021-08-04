import 'package:flutter/material.dart';
import 'package:super_todo/pages/SplashScreen.dart';
import 'package:super_todo/pages/onboarding/onboarding.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/Login.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          button: GoogleFonts.lato(color: cLight,fontWeight: FontWeight.bold,fontSize: 18),
          headline1: GoogleFonts.lato(color: cLight,fontWeight: FontWeight.bold),
          headline3: GoogleFonts.lato(color: cLight,fontWeight: FontWeight.bold),
          headline5: GoogleFonts.lato(color: cLight)
          ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route:(BuildContext context)=>SplashScreen(),
        OnBoarding.route:(BuildContext context)=>OnBoarding(),
        Login.route: (BuildContext context) => Login(),
        Home.route: (BuildContext context) => Home(),
      },
    );
  }
}
