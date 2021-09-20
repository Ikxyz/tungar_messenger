import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:super_todo/components/EditNameAndUsername.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/models/user.dart';
import 'package:super_todo/module/crypto.dart';
import 'package:super_todo/pages/home.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:super_todo/widget/loginPage.dart';
import 'package:super_todo/widget/signupPage.dart';

class Login extends StatefulWidget {
  static final String route = 'login';

  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late BuildContext context;

  late TextTheme textTheme;

  onAppStarting() {
    
  }

  // void loginAsGuest() async {
  //   final nameAndUsername = await showDialog<List<String>>(
  //           context: context,
  //           barrierDismissible: false,
  //           useSafeArea: true,
  //           builder: (BuildContext context) {
  //             return EditNameAndUsername();
  //           }) ??
  //       [];

  //   if (nameAndUsername.length < 2) return;

  //   final user = await signInAsGuest(nameAndUsername[0], nameAndUsername[1]);

  //   if (user == null) return;

  //   Navigator.of(context).pushNamedAndRemoveUntil(Home.route, (route) => false);
  // }

  // void loginWithGoogle() async {
  //   final user = await signInWithGoogle();

  //   if (user == null) return;

  //   Navigator.of(context).pushNamedAndRemoveUntil(Home.route, (route) => false);
  // }

  // Future<UserCredential?> signInAsGuest(String name, String username) async {
  //   final guestAccount = await fAuth.signInAnonymously();
  //   final userAuth = guestAccount.user;

  //   if (userAuth == null) return null;

  //   final email = '$username@tungar.com';

  //   final photoUrl =
  //       "https://www.gravatar.com/avatar/${Crypto.hash(email, CryptoAlg.md5)}?d=identicon&s=250";

  //   final userData = UserModel(
  //       email: email,
  //       username: username,
  //       photo: photoUrl,
  //       name: name,
  //       uid: userAuth.uid,
  //       password: "",
  //       timestamp: DateTime.now().millisecondsSinceEpoch);

  //   await usersCollection.doc(userData.uid).set(userData.toMap());

  //   await Future.wait([
  //     userAuth.updateEmail(userData.email),
  //     userAuth.updatePhotoURL(userData.photo),
  //     userAuth.updateDisplayName(userData.name)
  //   ]).catchError((err) {
  //     print(err);
  //   });

  //   // update profile photo

  //   return guestAccount;
  // }

  // /// Sign In With Google Auth
  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     final googleSignIn = await GoogleSignIn().signIn();

  //     if (googleSignIn == null) return null;

  //     final googleAuth = await googleSignIn.authentication;

  //     final googleAuthProviderCredential = GoogleAuthProvider.credential(
  //         idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

  //     return fAuth.signInWithCredential(googleAuthProviderCredential);
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
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
                  textAlign: TextAlign.center,
                  style: textTheme.headline3?.copyWith(
                    color: Colors.red.shade500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: Text(
                    "Get Started",
                    style: textTheme.headline4?.copyWith(color: cMute),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: ElevatedButton(
                      // onPressed: loginWithGoogle,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccout())),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          elevation: MaterialStateProperty.all(0),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30))),
                      child: Text(
                        "Create Account",
                        style: TextStyle(fontSize: 22),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: OutlinedButton(
                      // onPressed: loginAsGuest,
                      onPressed: () => showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => LoginPage()),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          elevation: MaterialStateProperty.all(0),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 60))),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 22),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
