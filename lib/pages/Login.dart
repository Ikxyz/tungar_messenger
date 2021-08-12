import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_todo/pages/home.dart';
import 'package:super_todo/styles/colors.dart';

class Login extends StatelessWidget {
  static final String route = 'login';
  late BuildContext context;
  late TextTheme textTheme;

  Login({Key? key}) : super(key: key);

  void login() {
    Navigator.of(context).pushNamedAndRemoveUntil(Home.route, (route) => false);
  }

  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
   statusBarColor: Colors.white,
   statusBarIconBrightness: Brightness.dark,

   systemNavigationBarColor: Colors.white,
   
));

    this.context = context;
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Image.asset(
                    "assets/bg1.png",
                    height: 250,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Welcome to Tungar Messenger",
                  style: textTheme.headline3?.copyWith(
                      color: Colors.red.shade500, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 20),
                    child: Text(
                      "Sign in to Get Started",
                      style: textTheme.headline4?.copyWith(color: cMute),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: OutlinedButton.icon(
                      onPressed: login,
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          elevation: MaterialStateProperty.all(0),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 30, right: 30))),
                      icon: Icon(
                        Icons.person,
                        size: 25,
                      ),
                      label: Text("Continue As Guest")),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton.icon(
                      onPressed: login,
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          elevation: MaterialStateProperty.all(0),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 30, right: 30))),
                      icon: Image.asset(
                        'assets/google.png',
                        width: 25,
                        height: 25,
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                      label: Text("Sign In With Google")),
                ),
              ],
            ),
          )),
    );
  }
}

