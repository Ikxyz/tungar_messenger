import 'package:super_todo/firebase.dart';
import 'package:super_todo/models/user.dart';
import 'package:super_todo/module/crypto.dart';

class Auth {
  // * check for user
  static getUser(uid) async {
    final Map<String, dynamic> data =
        (await usersCollection.doc(uid).get()).data() as dynamic;

    data.remove("password");

    return data;
  }

  // * login
  static Future login(
      {required String username, required String password}) async {
    final uid = Crypto.hash(username.trim(), CryptoAlg.md5);
    final user = await getUser(uid);

    return user;
  }

  // * signup
  static signup(
      {required String uid,
      required String name,
      required String photoUrl,
      required String email,
      required String username,
      required String password}) async {
    final user = UserModel(
        uid: uid,
        name: name,
        photo: photoUrl,
        email: email,
        username: username,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        password: password);

    await usersCollection.doc(user.uid).set(user.toMap());

    // final userDetails = Map<String, String>();
    // userDetails["username"] = user.username;
    // userDetails["email"] = user.email;
    // userDetails["uid"] = user.uid;
    // userDetails["name"] = user.name;
    // userDetails["photoURL"] = user.photo;

    // return userDetails;
  }
}
