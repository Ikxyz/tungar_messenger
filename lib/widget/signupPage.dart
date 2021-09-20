import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/module/auth.dart';
import 'package:super_todo/module/crypto.dart';
import 'package:super_todo/pages/Login.dart';
import 'package:super_todo/styles/colors.dart';

class CreateAccout extends StatefulWidget {
  const CreateAccout({Key? key}) : super(key: key);

  @override
  State<CreateAccout> createState() => _CreateAccoutState();
}

class _CreateAccoutState extends State<CreateAccout> {
  int _currentStep = 0;
  bool _passwordVisible = false;
  final _signupformkey = GlobalKey<FormState>();
  // * user data info
  String name = "";
  String username = "";
  String uid = "";
  String photo = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final lastStep = _currentStep == getSteps(context).length - 1;
    // CurrentUser currentUser = context.watch<CurrentUser>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Create Accout",
              style: TextStyle(
                  fontSize: 28, color: cPrimary, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        body: Stepper(
          elevation: 0,
          steps: getSteps(context),
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: () {
            if (lastStep) {
              print("Completed");
              signup();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Login.route, (route) => false);
            } else if (_signupformkey.currentState!.validate()) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          onStepTapped: (step) => {
            if (_signupformkey.currentState!.validate())
              {
                setState(() {
                  _currentStep = step;
                })
              }
          },
          controlsBuilder: (context, {onStepContinue, onStepCancel}) {
            return Container(
              child: Row(children: [
                // * NEXT button
                Expanded(
                  child: OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 20)),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    onPressed: onStepContinue,
                    child: Text(lastStep ? "SIGNUP" : "NEXT"),
                  ),
                ),

                SizedBox(
                  width: 20,
                ),

                //  * back button
                if (_currentStep != 0)
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 20)),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                      onPressed: onStepCancel,
                      child: Text("BACK"),
                    ),
                  )
              ]),
            );
          },
        ),
      ),
    );
  }

  // * select photo
  Future choosePhoto() async {
    File? file;
    final picker = await FilePicker.platform.pickFiles();
    if (picker != null) {
      final filePath = picker.files.single.path!;
      file = File(filePath);
      print(filePath);
      // * store image to database
      try {
        final photoName = basename(file.path);
        final ref = fStorage.ref("images/$photoName");

        await ref.putFile(file);

        final photoUrl = await ref.getDownloadURL();

        print(photoUrl);

        setState(() {
          photo = photoUrl;
        });
      } on FirebaseException catch (e) {
        return null;
      }
    }
  }

// * creating account function
  Future signup() async {
    await Auth.signup(
        uid: uid,
        name: name,
        photoUrl: photo,
        email: email,
        username: username,
        password: password);

    // currentUser.setUser(details);

    // print(currentUser.user);
  }

  // * account creation steps
  List<Step> getSteps(BuildContext context) => <Step>[
        Step(
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: _currentStep >= 0,
            title: Text("Personal"),
            content: signupForm(context)),
        Step(
            isActive: _currentStep >= 1,
            title: Text("Upload photo"),
            content: Container(
              child: uploadPhoto(context),
            )),
      ];

// * upload photo
  Widget uploadPhoto(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                shape:
                    MaterialStateProperty.all<OutlinedBorder>(CircleBorder()),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black26),
                elevation: MaterialStateProperty.all(0)),
            onPressed: choosePhoto,
            child: Icon(Icons.person, size: 180),
          ),
          TextButton(
              onPressed: choosePhoto,
              child: Text("Upload photo",
                  style: TextStyle(
                    color: cMute,
                    fontSize: 24,
                  )))
        ],
      ),
    );
  }

  // * signup actual form
  Widget signupForm(BuildContext context) {
    final double boxpad = 25;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
          // autovalidateMode: AutovalidateMode.always,
          key: _signupformkey,
          child: Column(
            children: [
              // * field for full name
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
                    hintText: "Enter your full name",
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: cMute),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                onChanged: (val) => setState(() {
                  name = val;
                }),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Enter your full name";
                  }
                  if (val.contains(RegExp(r'[0-9]'))) {
                    return "Name cannot contain numbers";
                  }
                },
              ),
              SizedBox(
                height: boxpad,
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
                    hintText: "Enter your username",
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: cMute),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                onChanged: (val) => setState(() {
                  username = val;

                  uid = Crypto.hash(username.trim(), CryptoAlg.md5);
                }),
                validator: (val) {
                  if (val == null || val.length < 2) {
                    return "Enter a valid username";
                  }
                },
              ),
              SizedBox(
                height: boxpad,
              ),
              // * field for email address
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: cMute,
                    ),
                    focusColor: cMute,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: cMute,
                    )),
                    hintText: "Enter your email address",
                    labelText: "Email Address",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: cMute),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                onChanged: (val) => setState(() {
                  email = val;
                }),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Email address cannot be empty nor contain space";
                  }
                },
              ),
              SizedBox(
                height: boxpad,
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
                    hintText: "Enter your password",
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: cMute),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                onChanged: (val) => setState(() {
                  password = val;
                }),
                validator: (val) {
                  if (val == null || val.length < 6) {
                    return "password cannot be less than 6 characters";
                  }
                },
              ),
              SizedBox(
                height: boxpad,
              ),
              //  * Field for confirming password
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
                    hintText: "Confirm password",
                    labelText: "Confirm password",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: cMute),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                validator: (val) {
                  if (val != password) {
                    return "password does not match";
                  }
                },
              ),
              SizedBox(
                height: boxpad + 30,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  color: cMute,
                ))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text("Signup up with"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/google.png',
                              width: 50,
                            ),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  CircleBorder())),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: boxpad + 30,
              )
            ],
          )),
    );
  }
}
