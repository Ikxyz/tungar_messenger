import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/models/chat.dart';
import 'package:super_todo/widget/home/user_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = fAuth.currentUser;

    if (user == null) {
      return Text("You need to be logged in to access this feature");
    }

    return FutureBuilder(
        future: userChatCollection(user.uid).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("Error occurred fetching chat information");
          }

          if (snapshot.hasData) {
            final data = snapshot.data;
            return Column(
              children: [
                ...data!.docs
                    .map((doc) => doc.data())
                    .map((json) => Chat.fromJson(Map.from(json)))
                    .map((chat) => HomeUserItem(chat: chat))
                    .toList()
              ],
            );
          }

          return CircularProgressIndicator();
        });
  }
}
