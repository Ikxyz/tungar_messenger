import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/module/auth.dart';
import 'package:super_todo/module/currentUser.dart';
import 'package:super_todo/module/localDb.dart';
import 'package:super_todo/pages/home.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:super_todo/widget/signupPage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  bool _isLoading = false;
  final _formkey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    CurrentUser currentUser = context.watch<CurrentUser>();

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 45),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Login to your accout",
                style: TextStyle(
                    fontSize: 28, color: cPrimary, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 60,
              ),

              // * field for username
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: cMute,
                    ),
                    focusColor: cMute,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: cMute,
                    )),
                    hintText: "Username",
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: cMute),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                onChanged: (val) => setState(() {
                  username = val;
                }),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter your username";
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),

              //  * Field for password
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisible,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: cMute,
                    ),
                    suffixIcon: IconButton(
                        color: cMute,
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: !_passwordVisible
                            ? Icon(
                                Icons.visibility_off,
                              )
                            : Icon(
                                Icons.visibility,
                              )),
                    focusColor: cMute,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: cMute,
                    )),
                    hintText: "Password",
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: cMute),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                onChanged: (val) => setState(() {
                  password = val;
                }),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter your password";
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),

              // * form login button
              loginFormSubmit(currentUser),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccout()));
                  },
                  child: Text(
                    "Don't have an account yet? Create Account",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: cMute,
                        fontWeight: FontWeight.w300),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // * login button for the form
  Widget loginFormSubmit(CurrentUser currentUser) {
    return ElevatedButton(
      // onPressed: loginWithGoogle,
      onPressed: () async {
        FocusScope.of(context).unfocus();
        if (username.trim().length == 0 || username.length < 2) return;
        if (password.trim().length == 0 || username.length < 6) return;
        final isDetailsValid = _formkey.currentState!.validate();

        if (isDetailsValid) {
          setState(() {
            _isLoading = true;
          });

          // * Login to account
          final loggedInUser = await loginToAccount(username, password);

          currentUser.setUser(loggedInUser);
          // * save user to local db
          // LocalDb.save(currentUser.user);
        }

        Navigator.of(context)
            .pushNamedAndRemoveUntil(Home.route, (route) => false);
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20, horizontal: 100))),
      child: !_isLoading
          ? Text(
              "Login",
              style: TextStyle(fontSize: 22),
            )
          : CircularProgressIndicator(
              color: cLight,
            ),
    );
  }

  Future loginToAccount(String username, String password) async {
    final userDetails =
        await Auth.login(username: username, password: password);

    // print("LOGIN DATA: ${userDetails.toString()}");
    return userDetails;
  }
}
