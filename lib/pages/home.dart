import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/models/chat.dart';
import 'package:super_todo/module/utils.dart';
import 'package:super_todo/widget/home/compose_chat.dart';
import 'package:super_todo/widget/home/header.dart';
import 'package:super_todo/widget/home/user_item.dart';

class Home extends StatelessWidget {
  static final route = 'home';

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            /// Header Widget
            HomeHeader(),

            SizedBox(
              height: 50,
            ),

            Expanded(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: List.filled(3, HomeUserItem()),
              ),
            )),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.chat_bubble_text),
          onPressed: () {
            onSendButtonClick(context);
          }),
    );
  }
}

void onSendButtonClick(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("New Message"),
          content: ComposeChat(toChange: (val){

          },messageChange: (val){
            
          },),
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                sendMessage("--MESSAGE--", "--TO--");
              },
              icon: Icon(CupertinoIcons.paperplane, size: 20),
              label: Text("Send"),
            )
          ],
        );
      });
}

void sendMessage(String message, String to) async {
  final currentUser = fAuth.currentUser;

  if (currentUser == null) return;

  String id = idGenerator(len: 16);
  final date = DateTime.now();

  final chat = Chat(
      id: id,
      lastMsg: "Hey :)",
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
