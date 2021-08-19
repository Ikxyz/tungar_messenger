import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_todo/firebase.dart';
import 'package:super_todo/models/chat.dart';
import 'package:super_todo/styles/colors.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
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
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("New Message"),
                    content: ComposeChat(),
                    actions: [
                      ElevatedButton.icon(
                        onPressed: () {
                          sendMessage("dsgdshdghscdhsd", "Hello World");
                        },
                        icon: Icon(CupertinoIcons.paperplane, size: 20),
                        label: Text("Send"),
                      )
                    ],
                  );
                });
          }),
    );
  }
}

void sendMessage(String text, String to) async {
  final user = fAuth.currentUser;

  if (user == null) return;

  String id = idGenerator(len: 12);
  final date = DateTime.now();

  final chat = Chat(
      id: id,
      uid: "",
      createdAt: date.toString(),
      updatedAt: date.toString(),
      lastModified: date.millisecondsSinceEpoch,
      timestamp: date.millisecondsSinceEpoch);

  final sender = chat;
  sender.uid = user.uid;
  final receiver = chat;
  receiver.uid = to;

  final batch = fDb.batch();

  batch.set(chatsCollection.doc(sender.id), sender.toMap());
  batch.set(chatsCollection.doc(receiver.id), receiver.toMap());

  await batch.commit();
}
