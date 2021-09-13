import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/models/chat.dart';
import 'package:super_todo/models/message.dart';
import 'package:super_todo/widget/chat/bubble.dart';

import '../firebase.dart';

class ChatMessages extends StatefulWidget {
  final Chat chatInfo;

  ChatMessages({Key? key, required this.chatInfo}) : super(key: key);

  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {

  final currentUser = fAuth.currentUser;

  Map<String,dynamic>? lastIndex;

  List<Message> listOfMessages = [];
  
  final ScrollController _scrollController = ScrollController();

 

  @override
  void initState() {
    super.initState();

    // Get List Of Messages
    userChatMessageCollection(currentUser!.uid, widget.chatInfo.id!)
        .orderBy('timestamp', descending: true)
        .limit(20)
        .snapshots().listen((snapshot) {
      if (snapshot.docs.length == 0) return;
      setState(() {
        listOfMessages = snapshot.docs
            .map((doc) => Message.fromJson(doc.data()))
            .toList()
            .reversed
            .toList();
      });
    });

    /// List for scroll events
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        userChatMessageCollection(currentUser!.uid, widget.chatInfo.id!)
            .orderBy('timestamp', descending: true)
            .startAfter([lastIndex])
            .limit(20);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        /// Stream Builder
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ShowMessages(
              currentUserUid: currentUser!.uid,
              messages: listOfMessages,
            )
          ],
        ),
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
