import 'dart:convert';
import 'dart:math';
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

    final chat = Chat(
        id: id,
        lastMsg: message,
        createdAt: date.toString(),
        updatedAt: date.toString(),
        lastModified: date.millisecondsSinceEpoch,
        timestamp: date.millisecondsSinceEpoch);

    final senderChat = chat.copyWith(Chat(id: currentUser.uid));

    final receiverChat = chat.copyWith(Chat(id: to));

    final batch = fDb.batch();

    batch.set(
        userChatDocument(senderChat.uid, senderChat.id), senderChat.toMap());

    batch.set(userChatDocument(receiverChat.uid, receiverChat.id),
        receiverChat.toMap());

    await batch.commit();
  }
}

String idGenerator({int len = 16}) {
  String data =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";

  final random = Random();

  String str = "";

  for (int i = 0; i < len; i++) {
    final index = random.nextInt(data.length);
    str += data[index];
  }

  return str;
}
