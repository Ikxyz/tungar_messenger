import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/models/chat.dart';
import 'package:super_todo/models/message.dart';
import 'package:super_todo/widget/chat/bubble.dart';

import '../firebase.dart';

class ChatMessages extends StatelessWidget {
  final Chat chatInfo;

  const ChatMessages({Key? key, required this.chatInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = fAuth.currentUser;

    return Container(
      child: SingleChildScrollView(
        /// Stream Builder
        child: StreamBuilder(
            stream: userChatMessageCollection(currentUser!.uid, chatInfo.id!)
                .orderBy('timestamp')
                .limit(30)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasError) {
                return ErrorLoadingMessages();
              }

              if (snapshot.hasData && snapshot.data != null) {
                return ShowMessages(
                  currentUserUid: currentUser.uid,
                  messages: snapshot.data!.docs
                      .map((doc) => Message.fromJson(doc.data()))
                      .toList(),
                );
              }

              return LoadingMessages();
            }),
      ),
    );
  }
}

class ShowMessages extends StatelessWidget {
  final String currentUserUid;
  final List<Message> messages;

  const ShowMessages(
      {Key? key, required this.currentUserUid, required this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: messages.map((msg) {
        return Bubble(
            msg: msg.msg ?? '',
            type: msg.sender == currentUserUid
                ? BubbleType.sender
                : BubbleType.receiver);
      }).toList(),
    ));
  }
}

/// To Be Shown When loading messages
class LoadingMessages extends StatelessWidget {
  const LoadingMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text("Loading messages")
          ],
        ));
  }
}

/// To Be Shown When an error occurs loading messages
class ErrorLoadingMessages extends StatelessWidget {
  const ErrorLoadingMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error Loading Messages"),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.refresh),
                label: Text("Try Again .."))
          ],
        ));
  }
}
