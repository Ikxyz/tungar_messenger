import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/pages/onboarding/onboarding.dart';
import 'package:super_todo/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  static final route = "splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            () => Navigator.of(context).pushNamed(OnBoarding.route)
    );
  }

  @override
  Widget build(BuildContext context) {
    // void gotoOnBoarding() {
    //   Navigator.of(context).pushNamed(OnBoarding.route);
    // }

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
