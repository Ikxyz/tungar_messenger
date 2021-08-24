import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "dart:math";

/// Firebase Auth
final fAuth = FirebaseAuth.instance;

// Firestore database
final fDb = FirebaseFirestore.instance;

/// Firestore Collection Names
///

const String UserCollections = "users";

const String ChatCollections = "chats";

const String MessageCollections = "messages";

///
/// End Firestore Collection Names

/// Firestore Collections
///

final usersCollection = fDb.collection(UserCollections);

final chatsCollection = fDb.collection(ChatCollections);

final messagesCollection = fDb.collection(MessageCollections);

///
/// End Firestore Collections

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
