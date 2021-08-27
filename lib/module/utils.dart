import 'dart:convert';

import "package:http/http.dart" as Http;
import 'package:super_todo/models/chat.dart';
import '../firebase.dart';

class Utils {
  /// Email to Username
  ///
  static String emailToUsername(String email) {
    final str = email.split("@")[0];
    return "@$str";
  }

  static String usernameShorten(String username, [int length = 8]) {
    final max = username.length;
    final str = username.substring(0, length >= max ? max : length);
    return "$str...";
  }

  /// Generate New Name
  static Future<String> generateFullName() async {
    try {
      final url = Uri.parse("https://api.namefake.com");

      final req = await Http.get(url);

      if (req.statusCode == 200) {
        return jsonDecode(req.body)['fsnjfkbkbsdhsbd'];
      }
      return "Jane Doe";
    } catch (e) {
      return "Jane Doe";
    }
  }

  //? Sending messages
  static void sendMessage({required String message, required String to}) async {
    final currentUser = fAuth.currentUser;

    

    if (currentUser == null) return;

    

    String id = idGenerator(len: 12);
    final date = DateTime.now();

    final sender = Chat(
        id: id,
        uid: currentUser.uid,
        createdAt: date.toString(),
        lastMsg: message,
        updatedAt: date.toString(),
        lastModified: date.millisecondsSinceEpoch,
        timestamp: date.millisecondsSinceEpoch);

    final receiver = Chat(
        id: id,
        uid: to,
        createdAt: date.toString(),
        updatedAt: date.toString(),
        lastMsg: message,
        lastModified: date.millisecondsSinceEpoch,
        timestamp: date.millisecondsSinceEpoch);

    final batch = fDb.batch();

    batch.set(
        fDb
            .collection(UserCollections)
            .doc(sender.uid)
            .collection(ChatCollections)
            .doc(sender.id),
        sender.toMap());

    batch.set(
        fDb
            .collection(UserCollections)
            .doc(receiver.uid)
            .collection(ChatCollections)
            .doc(receiver.id),
        receiver.toMap());

    await batch.commit();
  }
}
