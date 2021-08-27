import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/models/user.dart';
import 'package:super_todo/module/crypto.dart';
import 'package:super_todo/module/utils.dart';
import 'package:super_todo/pages/home.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:super_todo/widget/loading.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  static final String route = 'login';
  late BuildContext context;
  late TextTheme textTheme;

  Login({Key? key}) : super(key: key);

  void loginAsGuest() async {
    final user = await signInAsGuest();

    if (user == null) return;

    Navigator.of(context).pushNamedAndRemoveUntil(Home.route, (route) => false);
  }

  void loginWithGoogle() async {
    final user = (await signInWithGoogle()) ?? (await signInAsGuest());

    if (user == null) return;

    Navigator.of(context).pushNamedAndRemoveUntil(Home.route, (route) => false);
  }

  Future<UserCredential?> signInAsGuest() async {
    final guestAccount = await fAuth.signInAnonymously();

    loadingIndicator(context);

    final userAuth = guestAccount.user;

    if (userAuth == null) return null;

    final email = '${userAuth.uid}@tungar.com';

    final photoUrl =
        "https://www.gravatar.com/avatar/${Crypto.hash(email, CryptoAlg.md5)}?d=identicon&s=250";

    final name = await Utils.generateFullName();

    final userData =
        UserModel(email: email, photo: photoUrl, name: name, uid: userAuth.uid);

    await usersCollection.doc(userData.uid).set(userData.toMap());

    await Future.wait([
      userAuth.updateEmail(userData.email),
      userAuth.updatePhotoURL(userData.photo),
      userAuth.updateDisplayName(userData.name)
    ]).catchError((err) {
      print(err);
    });

    // update profile photo

    return guestAccount;
  }

  /// Sign In With Google Auth
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();

      loadingIndicator(context);

      if (googleSignIn == null) return null;

      final googleAuth = await googleSignIn.authentication;

      final googleAuthProviderCredential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      return await fAuth.signInWithCredential(googleAuthProviderCredential);
    } catch (e) {
      print(e);
      return null;
    }
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
                      onPressed: loginAsGuest,
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
                      onPressed: loginWithGoogle,
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
