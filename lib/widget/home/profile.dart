import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/pages/Login.dart';

class Profile extends StatelessWidget {
  final bool isAnonymous;
  const Profile({Key? key, required this.isAnonymous}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Center(
            child: ElevatedButton(
                onPressed: () async {
                  this.isAnonymous
                      ? await fAuth.signOut()
                      : await GoogleSignIn().disconnect();

                  await fAuth.signOut();

                  Navigator.of(context).pushNamedAndRemoveUntil(Login.route, (Route<dynamic> route) => false);
                },
                child: Text("LOGOUT")))
      ],
    );
  }
}
