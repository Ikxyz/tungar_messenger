import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_todo/pages/onboarding/onboarding.dart';
import 'package:super_todo/styles/colors.dart';

import 'Login.dart';

class SplashScreen extends StatefulWidget {
  static final route = "splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
   _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SharedPreferences _store;

  @override
  void initState(){
    super.initState();
    this._initState();
  }

  void _initState() async{
    _store = await SharedPreferences.getInstance();
    // Timer(Duration(seconds: 5), gotoOnBoarding);
    /// if isFirstRUn == (true || null) ~ means the user has not finish the onboarding process
    ///
    /// else ifFirstRun == false ~ the user has finish the onboarding process
    bool isFirstRun = _store.getBool("isFirstRun") ?? true;

    Future.delayed(Duration(seconds: 2), () {
      if (isFirstRun) {
        gotoOnBoarding();
      } else {
        gotoLogin();
      }
    });
  }

  void gotoOnBoarding() {
    Navigator.of(context).pushNamed(OnBoarding.route);
  }

  void gotoLogin() {
    Navigator.of(context).pushNamed(Login.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: cPrimary,
              // gradient: LinearGradient(
              //     begin: Alignment.topLeft, colors: [cAccent, cPrimary])
            ),
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.chat_bubble_2,
                          color: cLight, size: 70),
                      Text(
                        "Tungar Messenger",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: cLight),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.0,),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: CircularProgressIndicator(
                  backgroundColor: cLight,
                ),
              ),
            ],
          ),
        ],
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: gotoOnBoarding,
      //   child: Icon(Icons.navigate_next),
      // ),
    );
  }
}
